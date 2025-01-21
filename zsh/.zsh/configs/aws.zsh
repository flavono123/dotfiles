function awsp() {
    local profile=$(grep '\[profile' ~/.aws/config | sed 's/\[profile \(.*\)\]/\1/' | fzf)
    if [ ! -z "$profile" ]; then
        export AWS_PROFILE=$profile
        local color=$(( $(echo -n "$profile" | cksum | cut -d ' ' -f 1) % 256 + 1))
        echo "exporting \033[38;5;208mAWS_PROFILE\033[0m as \033[38;5;${color}m$profile\033[0m"
    fi
}
