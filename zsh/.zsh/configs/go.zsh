if ! command -v go &> /dev/null; then
  echo "${(%):-%N}: go is not installed"
else
  GOPATH="$HOME/go"
  PATH="$GOPATH/bin:$PATH"
fi
