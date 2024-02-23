#!/usr/bin/env bash

shagen() {
	passphrase="$1"
	if [[ "$passphrase" == "" ]]; then
		echo -n "passphrase      => "
		read -s  passphrase
		echo ""
	fi

	algorithm="$2"
	if [[ "$algorithm" == "" ]]; then
		echo -n "algorithm [256] => "
		read     algorithm
		algorithm=${algorithm:-256}
	fi;

	echo "$(echo -n "$passphrase" | shasum -a "$algorithm" --text)"
}

edit() {
  $EDITOR "$@"
}

editor() {
  if [ -z "$1" ]; then
    echo "eidtor: $EDITOR"

    if [ -z "$EDITOR" ]; then
      return 0
    else
      return 1
    fi
    else
    if [ -z "$2" ]; then
      export EDITOR="$1"
      return 0
    else
      echo "export EDITOR=$1" >> "$HOME/.zshrc"
    fi
  fi
}
