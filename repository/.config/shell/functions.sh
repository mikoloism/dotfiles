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

