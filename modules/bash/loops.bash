#!/bin/bash
. ./modules/bash/other.bash


loop_messages() {
    echo
    echo "1. Open an app"
    echo "2. Close an app"
    echo "3. Search an app"
    echo "4. Show privilege level"
    echo "5. Switch privilege level"
    echo "6. List supported platforms"
    echo

    read -r -p "Choose an option (q to quit): " option_chosen
}

handle_matches() {
    local privilege_lvl
    privilege_lvl=$(python3 -c "file = open('privilege.txt', 'r+'); privilege_lvl: str = file.read(); print(privilege_lvl)")

    local open_command
    local macos_open_end_command

    case "$OSTYPE" in
        darwin*)
            # echo "macos"
            open_command="open -a"
            macos_open_end_command="-n"
            ;;
        linux-gnu*)
            # echo "linux"
            open_command="xdg-open"
            ;;
        *)
            echo "Unsupported OS! To view supported: 6"
            exit 0
            ;;
    esac

    case "$option_chosen" in
        "1")
            read -r -p "$(prompt_msg "open")" open_app_wish

            handle_option_quit "$open_app_wish"
            check_empty_str_no_trim "$open_command"

            # echo "$open_command"

            if [ "$privilege_lvl" = "System" ]; then
                sudo $open_command $open_app_wish $macos_open_end_command
            else
                $open_command $open_app_wish $macos_open_end_command
            fi
            ;;
        "2")
            printf "Note: double quotes for closing multi-word app names! \n"
            read -r -p "$(prompt_msg "close")" close_app_wish

            handle_option_quit "$close_app_wish"

            if [ "$privilege_lvl" = "System" ]; then
                sudo pkill -f "$close_app_wish"
            else
                pkill -f "$close_app_wish"
            fi
            ;;
        "3")
            read -r -p "$(prompt_msg "search for")" search_app_wish

            handle_option_quit "$search_app_wish"

            if [ "$privilege_lvl" = "System" ]; then
                sudo pgrep -l "$search_app_wish"
            else
                pgrep -l "$search_app_wish"
            fi
            ;;
        "4")
            python3 privilege.py
            privilege_lvl="$(python3 -c "file = open('privilege.txt', 'r+'); privilege_lvl: str = file.read(); print(privilege_lvl)")"
            # echo "$privilege_lvl"
            ;;
        "5")
            python3 -c "from privilege import switch_privilege_lvl; switch_privilege_lvl()"
            privilege_lvl="$(python3 -c "file = open('privilege.txt', 'r+'); privilege_lvl: str = file.read(); print(privilege_lvl)")"
            # echo "$privilege_lvl"
            ;;
        "6")
            python3 supported_platforms.py
            ;;
        "q"|"Q")
            echo "OK!"
            exit 0
            ;;
        "")
            echo "Option cannot be empty!"
            ;;
        *)
            echo "Invalid option chosen!"
            ;;
    esac
}

loop() {
    while true; do
        loop_messages
        handle_matches
    done
}