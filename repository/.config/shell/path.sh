#!/usr/bin/env bash

path-normilize() {
    local RESULT=$(echo "$1" | sed -e "s|~|$HOME|g")
    echo "$RESULT"
}

path-contain() {
    if [ -z "$1" ]; then
        echo "Error: Arguments not provided." >&2
        return 1
    fi

    local TARGET=$(path-normilize "$1")
    if str-include "$PATH" "$TARGET"; then
        echo "Error: $TARGET available." >&2
        return 2
    fi
}

path-use() {
    path-contain "$@" || return
    local NEWPATH=$(path-normilize "$1")
    export PATH="$PATH:$NEWPATH"
}

path-add() {
    path-contain "$@" || return

    local NEWPATH=$(path-normilize "$1")
    if [ "$2" = '--use' ]; then
        echo "path-use \"$NEWPATH\"" >> "~/.config/shell/path-source.sh"
    else
        echo "export PATH=\"\$PATH:$NEWPATH\"" >> "~/.config/shell/path-source.sh"
    fi
}

path-list() {
    local PARAMS="${1:-\\n}"
    local TARGET=$(path-normilize "$PARAMS")
    echo "$PATH" | tr ":" "\n" | grep "$TARGET" --line-number --initial-tab --ignore-case --color="always"
}

path-count() {
    local PARAMS="${1:-\\n}"
    local TARGET=$(path-normilize "$PARAMS")
    local COUNT=$(echo "$PATH" | tr ":" "\n" | grep "$TARGET" --line-number --initial-tab --ignore-case --color="always" --count)
    echo "$COUNT"
}

path-remove() {
    echo "Error: not implemented" >&2
    return 3
}
