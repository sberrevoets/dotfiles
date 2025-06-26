#!/usr/bin/env bash

die() {
    echo "Usage: $0 {install|uninstall}"
    exit 1
}

apps=(
    "1438243180" # Dark Reader for Safari
    "1544743900" # Hush Nag Blocker
    "1365531024" # 1Blocker: Ad Blocker & Privacy
    "1519867270" # Refined GitHub
    "1458969831" # JSON Peep for Safari
    "1376402589" # StopTheMadness
)

install() {
    for app in "${apps[@]}"; do
        mas install "$app"
    done
}

uninstall() {
    for app in "${apps[@]}"; do
        mas uninstall "$app"
    done
}

if [[ $# != 1 ]]; then
    die
fi

if [[ $1 == "install" ]]; then
    install
elif [[ $1 == "uninstall" ]]; then
    uninstall
else
    die
fi
