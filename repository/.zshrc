# -------------------------------- #
# ZSH Configuration File
# -------------------------------- #
# https://github.com/mikoloism/dotfiles

# ZSH_CUSTOM=/path/to/new-custom-folder
export ZSH="$HOME/.config/oh-my-zsh"
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

source "$HOME/.config/shell/oh-my-zsh.zsh"
source "$HOME/.config/shell/aliases.sh"
source "$HOME/.config/shell/functions.sh"
source "$HOME/.config/shell/str.sh"
source "$HOME/.config/shell/path.sh"
source "$HOME/.config/shell/pass.sh"
source "$HOME/.config/shell/env.sh"

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

# shell
export PATH="$HOME/.local/bin:$PATH"
# shell end
