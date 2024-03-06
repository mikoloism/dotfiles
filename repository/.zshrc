# -------------------------------- #
# ZSH Configuration File
# -------------------------------- #
# https://github.com/mikoloism/dotfiles

# ZSH_CUSTOM=/path/to/new-custom-folder
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

# default theme as callback
ZSH_THEME="robbyrussell"

# -------------------------------- #
# Oh My ZSH Plugins
# -------------------------------- #

plugins=(
    git git-flow github gh
    volta node npm yarn deno bun
    python autopep8 pep8 pyenv pip pipenv virtualenv
    ubuntu snap man colored-man-pages ssh-agent gnu-utils emoji themes
    ionic react-native sdk adb gradle
    grunt gulp
    vscode golang rust
    # brew
)

# -------------------------------- #
# Configs and Extensions
# -------------------------------- #

source "$HOME/.config/shell/ohz-init-theme.zsh"
source "$HOME/.config/shell/aliases.sh"
source "$HOME/.config/shell/functions.sh"
source "$HOME/.config/shell/str.sh"
source "$HOME/.config/shell/path.sh"
source "$HOME/.config/shell/pass.sh"



# -------------------------------- #
# PATH Environment Variables
# -------------------------------- #

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$PATH:$HOME/.fzf/bin"

fpath=(~/.zshrc_configs $fpath)
autoload -Uz compinit
compinit -u

# lua (luaver)
[[ -s "$HOME/.luaver/luaver" ]] && . "$HOME/.luaver/luaver"
# lua end

# golang (gvm)
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/local/go/bin"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
alias gover="gvm"
# golang end

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"
# volta end

# pnpm
export VOLTA_FEATURE_PNPM=1
# pnpm end

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"
# bun end

# deno
export DENO_INSTALL="$HOME/.deno"
case ":$PATH:" in
  *":$DENO_INSTALL:"*) ;;
  *) export PATH="$PATH:$DENO_INSTALL/bin" ;;
esac
# deno end

# java (jdk, jre, jvm)
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
export JAVA_PATH="/usr/bin/java"
export PATH="$PATH:$JAVA_HOME/bin"
# java end

# android (cmdline-tools, platform-tools, tools)
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_SDK_ROOT="/opt/android-sdk"
export ANDROID_SDK_HOME="$HOME/.android"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/bin"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin"
# android end

# gradle
export GRADLE_HOME="/opt/gradle/gradle-8.6"
export PATH="$PATH:$GRADLE_HOME/bin"
# gradle end

# cargo
. "$HOME/.cargo/env"
# cargo end

# shell
export PATH="$HOME/.local/bin:$PATH"
# shell end
