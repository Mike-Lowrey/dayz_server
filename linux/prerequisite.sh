#!/bin/bash -e
(

    # Install Azure cli if az version fails
    echo "INFO: Welcom to Dayz Prerequisite Installer (DPI)"
    cat << EndOfMessage
Checking for the following prerequisites please wait...
tmux
nano
htop
curl
wget
rename
psmisc
lib32gcc1
lib32stdc++6
EndOfMessage
    sudo apt-get update

    REQPKGS=(tmux nano htop curl wget rename psmisc lib32gcc1 lib32stdc++6)

    for pkg in "${REQPKGS[@]}"; do
        if dpkg -l "$pkg" > /dev/null 2>&1; then
            echo -e "$pkg is already installed"
        else
            sudo apt install "$pkg" -y && echo "Successfully installed $pkg"
        fi
    done

)