#!/bin/sh

ssh-logs() {
  if [ -z "$1" ]; then
    journalctl _SYSTEMD_UNIT=ssh.service
  else
    local keyword="$1"
    journalctl _SYSTEMD_UNIT=ssh.service \
    | egrep "$keyword" --ignore-case
  fi
}

sshpass-fails-full() {
  ssh-logs "(Failed|Failure)"
}

sshpass-fails() {
  sshpass-fails-full \
  | awk '{ print $11 }' \
  | uniq --count \
  | sort --numeric-sort --reverse
}

sshpass-accepts-full() {
  ssh-logs "Accepted"
}

sshpass-accepts() {
  sshpass-accepts-full \
  | awk '{ print $11 }' \
  | uniq --count \
  | sort --numeric-sort --reverse
}

sshpass-logs-full() {
  ssh-logs "password"
}

sshpass-logs() {
  sshpass-logs-full \
  | awk '{ print $11 }'  \
  | uniq --count \
  | sort --numeric-sort --reverse
}
