prompt_msg() {
    local action="$1"
    echo "Which app do you wish to $action (q to quit)? "
}

check_empty_str_no_trim() {
    if [ -z "$1" ]; then
        echo "Error: open command is empty! Exiting..."
        exit 1
    fi
}

handle_option_quit() {
    local input="$1"

    if [ "$input" = "q" ] || [ "$input" = "Q" ]; then
        exit 0
    fi

    # * local input="${1,,}" fungerer ikke

    # if [ "$input" = "q" ]; then
    #     exit 0
    # fi
}