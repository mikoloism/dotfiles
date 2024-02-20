# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=("clean" "jaischeema" "nebirhos" "philips" "terminalparty" "wezm+" "wuffers")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git git-flow github gh
    volta node npm yarn deno bun
    python autopep8 pep8 pyenv pip pipenv virtualenv
    ubuntu snap man ssh-agent gnu-utils emoji themes
    ionic react-native sdk adb gradle
    grunt gulp
    vscode golang rust
    # brew
)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
source "$HOME/.config/shell/themes.zsh"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ALIASES
source "$HOME/.config/shell/aliases.sh"
source "$HOME/.config/shell/functions.sh"
source "$HOME/.config/shell/path.sh"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$PATH:~/.fzf/bin"

fpath=(~/.zshrc_configs $fpath)
autoload -Uz compinit
compinit -u

# lua (luaver)
[[ -s "~/.luaver/luaver" ]] && . "~/.luaver/luaver"
# lua end

# golang (gvm)
export PATH="$PATH:~/go/bin"
export PATH="$PATH:/usr/local/go/bin"
[[ -s "~/.gvm/scripts/gvm" ]] && source "~/.gvm/scripts/gvm"
alias gover="gvm"
# golang end

# pnpm
export PNPM_HOME="~/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PATH:$PNPM_HOME" ;;
esac
# pnpm end

# bun
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"
export BUN_INSTALL="~/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"
# bun end

# volta
export VOLTA_HOME="~/.volta"
export PATH="$PATH:$VOLTA_HOME/bin"
# volta end

# deno
export DENO_INSTALL="~/.deno"
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
export ANDROID_SDK_HOME="~/.android"
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
export PATH="~/.local/bin:$PATH"
# shell end