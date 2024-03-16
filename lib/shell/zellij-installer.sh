#!/usr/bin/env bash

curl -fsSL 'https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz' > zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz
chmod +x ./zellij
mv -iv ./zellij "$HOME/.local/bin/zellij"
rm -iv ./zellij-x86_64-unknown-linux-musl.tar.gz
