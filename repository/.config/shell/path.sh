#!/usr/bin/env bash

path-normilize() {
	local RESULT=$(echo "$1" | sed "s/\$HOME/~/g")
	local RESULT=$(echo "${RESULT/#$HOME/~}")
	echo "$RESULT"
}

path-use() {
	[ -z "$1" ] && return 1
	local NEWPATH=$(path-normilize "$1")
	export PATH="$PATH:$NEWPATH"
}

path-add() {
	[ -z "$1" ] && return 1
	local NEWPATH=$(path-normilize "$1")
	if [ "$2" = '--use' ]; then
        echo "path-use \"$NEWPATH\"" >> "~/.config/shell/path-source.sh"
	else
		echo "export PATH=\"\$PATH:$NEWPATH\"" >> "~/.config/shell/path-source.sh"
	fi
}

path-list() {
	local PARAMS="${1:-\n}"
	local TARGET=$(path-normilize "$PARAMS")
	echo "$PATH" | tr ":" "\n" | grep "$TARGET" --line-number --initial-tab --ignore-case --color="always"
}

path-count() {
	local PARAMS="${1:-\n}"
	local TARGET=$(path-normilize "$PARAMS")
	local COUNT=$(echo "$PATH" | tr ":" "\n" | grep "$TARGET" --line-number --initial-tab --ignore-case --color="always" --count)
	echo "$COUNT"
}

path-remove() {
	return 1
}
