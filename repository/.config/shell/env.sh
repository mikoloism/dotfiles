#!/usr/bin/env bash

# -------------------------------- #
# Golang Envs
# -------------------------------- #
# https://go.dev

export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
alias gover="gvm"

# -------------------------------- #
# Volta Envs
# -------------------------------- #
# https://volta.sh

export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"

# -------------------------------- #
# PNPM Envs
# -------------------------------- #
# https://pnpm.io

export VOLTA_FEATURE_PNPM=1

# -------------------------------- #
# Bun Envs
# -------------------------------- #
# https://bun.run

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"

# -------------------------------- #
# Deno Envs
# -------------------------------- #
# https://deno.land

export DENO_INSTALL="$HOME/.deno"
case ":$PATH:" in
*":$DENO_INSTALL:"*) ;;
*) export PATH="$PATH:$DENO_INSTALL/bin" ;;
esac

# -------------------------------- #
# Java Envs
# -------------------------------- #
# JDK, JRE, JVM

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
export JAVA_PATH="/usr/bin/java"
export PATH="$PATH:$JAVA_HOME/bin"

# -------------------------------- #
# Android Envs
# -------------------------------- #
# cmdline-tools, platform-tools

export ANDROID_HOME="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export ANDROID_SDK_HOME="$HOME/.android"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"

# -------------------------------- #
# Gradle Envs
# -------------------------------- #

export GRADLE_HOME="/opt/gradle/gradle-8.6"
export PATH="$PATH:$GRADLE_HOME/bin"

# -------------------------------- #
# Rust Envs
# -------------------------------- #
# https://rust-lang.org (cargo)

. "$HOME/.cargo/env"
