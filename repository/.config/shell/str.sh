#!/usr/bin/env bash

str-include() {
    local str=""
    local sub=""

    if [ $# -eq 2 ]; then
        str="$1"
        sub="$2"
    elif [ $# -eq 1 ]; then
        input=$(cat)
        str="$input"
        sub="$1"
    fi

    if [ -z "$str" ] || [ -z "$sub" ]; then
        echo " Usage: str-include <string> <substring>"
        return 2
    fi

    case $str in
        *"$sub"*) return 0 ;;
        *) return 1 ;;
    esac
}
