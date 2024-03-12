#!/usr/bin/env bash

gopo() {
  cd "$PROJECTS/$1"
}

shagen() {
	print_help() {
		local help_message="\n"
		help_message="${help_message} SHAGEN - HASH Generator\n\n"
		help_message="${help_message} ----------------------------------------------------------------------\n\n"
		help_message="${help_message} --algorithm | algorithm               ['256' | ALGORITHMS]            \n\n"
		help_message="${help_message} --data      | data                    [STRING]                        \n\n"
		help_message="${help_message} --silent                              hide the last result from output\n"
		echo -e "$help_message"
	}

	local algorithm=""
	local data=""
	local can_be_interactive='YES'
	local should_copy_output='YES'
	local should_print_output='YES'

	while [[ "$#" -gt 0 ]]; do
		case $1 in
		-h | --help | help)
			print_help
			[ "$0" = "$SHELL" ] && exit 0 || return 0
			break
			;;

		-s | --silent | --no-output)
			should_print_output='NO'
			shift
			;;
		-c | --copy | --clipboard)
			should_copy_output='YES'
			shift
			;;
		--no-copy | --no-clipboard)
			should_copy_output='NO'
			shift
			;;
		-d | --data | data)
			data="$2"
			shift
			shift
			;;
		-a | --algorithm | algorithm)
			algorithm="$2"
			shift
			shift
			;;

		-* | --*)
			echo "Unknown option $1"
			[ "$0" = "$SHELL" ] && exit 1 || return 1
			break
			;;
		esac
	done

	if [[ "$data" == "" && "$can_be_interactive" == "YES" ]]; then
		echo -n "passphrase      => "
		read -s data
		echo ""
	fi

	if [[ "$algorithm" == "" && "$can_be_interactive" == "YES" ]]; then
		echo -n "algorithm [256] => "
		read algorithm
		algorithm=${algorithm:-256}
	fi

	local output="$(echo -n "$data" | shasum -a "$algorithm" --text | sed -r 's|\s+\-\s*||g')"

	if [[ "$should_copy_output" == "YES" ]]; then
		if command -v 'clipboard' &>/dev/null; then
			echo -n "$output" | clipboard
		fi
	fi

	if [[ "$should_print_output" == 'YES' ]]; then
		echo "$output"
	fi

	return 0
}

edit() {
	$EDITOR "$@"
}
