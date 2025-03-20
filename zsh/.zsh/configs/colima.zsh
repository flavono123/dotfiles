# Function to add Colima k3s cluster config to ~/.kube/config
function colima-config() {
  echo "🔄 Adding Colima k3s cluster to kubeconfig..."

   # Check if colima context already exists
  if kubectl config get-contexts -o name 2>/dev/null | grep -q "^colima$"; then
    echo "✅ Colima context already exists in kubeconfig. No changes needed."
    echo "👉 You can use: kubectl config use-context colima"
    return 0
  fi

  # Check if Colima is running
  echo "📋 Checking if Colima is running..."
  if ! colima status 2>/dev/null | grep -q "Running"; then
    echo "❌ Colima is not running. Please start it with 'colima start'."
    return 1
  else
    echo "✅ Colima is running."
  fi

  # Get the port that k3s is using
  local K3S_PORT=$(colima ssh -- sudo grep -o '\--bind-address=127.0.0.1:[0-9]\+' /etc/systemd/system/k3s.service | cut -d: -f3)
  if [[ -z "$K3S_PORT" ]]; then
    # Try to get the port from the kubeconfig directly
    local K3S_PORT=$(colima ssh -- grep -o 'https://127.0.0.1:[0-9]\+' /etc/rancher/k3s/k3s.yaml | cut -d: -f3)
  fi

  if [[ -z "$K3S_PORT" ]]; then
    echo "❌ Could not determine the k3s port. Please check if k3s is running in Colima."
    return 1
  fi

  echo "📊 Found k3s running on port: $K3S_PORT"

  # Create a temporary file
  local TEMP_FILE=$(mktemp)

  # Extract the kubeconfig from Colima and modify it
  echo "📝 Extracting and modifying kubeconfig..."
  colima ssh -- sudo cat /etc/rancher/k3s/k3s.yaml | \
    sed -e "s|default|colima|g" \
    > $TEMP_FILE

  # Backup the current config
  if [[ -f ~/.kube/config ]]; then
    cp ~/.kube/config ~/.kube/config.bak.$(date +%Y%m%d%H%M%S)
    echo "💾 Backed up existing kubeconfig to ~/.kube/config.bak.$(date +%Y%m%d%H%M%S)"
  fi

  # Merge configs
  echo "🔄 Merging configurations..."
  KUBECONFIG=~/.kube/config:$TEMP_FILE kubectl config view --flatten > ~/.kube/config.merged
  if [[ $? -eq 0 ]]; then
    mv ~/.kube/config.merged ~/.kube/config
    chmod 600 ~/.kube/config
    echo "✅ Successfully merged Colima k3s configuration into ~/.kube/config"
    echo "👉 You can now use: kubectl config use-context colima"
  else
    echo "❌ Failed to merge configurations."
    rm -f ~/.kube/config.merged
  fi

  # Clean up
  rm -f $TEMP_FILE
}
