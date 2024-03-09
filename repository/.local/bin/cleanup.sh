#!/usr/bin/env bash

COMMAND_DELETE_LOCKFILE="rm -rf package-lock.json yarn.lock pnpm-lock.yaml"
COMMAND_DELETE_NODE_MODULES="rm -rf node_modules"
COMMAND_DELETE_CACHE="npm cache clean --force && pnpm store prune && yarn cache clean --all"
CWD="$(pwd)"
cd "$CWD"

commands="0"

delete_node_modules() {
	echo "Delete 'node_modules'"
	echo "$COMMAND_DELETE_NODE_MODULES" | bash
}

delete_lockfile() {
	echo "Delete Lockfiles"
	echo "$COMMAND_DELETE_LOCKFILE" | bash
}

delete_cache() {
	echo "Delete Caches"
	echo "$COMMAND_DELETE_CACHE" | bash
}

display_help() {
	echo "rm node_modules - Node Modules Remover"
	echo "Help:"
	echo ""
	echo " --modules   Remove 'node_modules' directory"
	echo " --lockfile  Remove Lockfiles"
	echo "               - package-lock.json"
	echo "               - yarn.lock"
	echo "               - pnpm-lock.yaml"
	echo " --cache     Remove Caches"
	echo " --help      Display This"
	exit 0
}

while [ "$#" -gt 0 ]; do
	if [[ "$1" == "--lockfile" ]]; then
		delete_lockfile
		commands="1"
	fi
	if [[ "$1" == "--cache" ]]; then
		delete_cache
		commands="1"
	fi
	if [[ "$1" == '--modules' ]]; then
		delete_node_modules
		commands="1"
	fi

	if [[ "$1" == "--help" ]]; then
		display_help
	fi
	# Shift the positional parameters to the left
	shift
done

if [[ "$commands" == "0" ]]; then
	display_help
fi
