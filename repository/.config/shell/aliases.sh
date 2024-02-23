alias dof='/usr/bin/git --git-dir=$HOME/.dogfile/ --work-tree=$HOME'
alias ping="ping -w 10 -i 0.250 -c 16 "
alias lzg="lazygit"
alias cp="cp --interactive --verbose"
alias mv="mv --interactive --verbose"
alias ln="ln --interactive --verbose --symbolic"


### `ls` and `exa` (list directory content)
# [LEGACY] alias l='ls -la --group-directories-first --sort=version'
alias exa='command exa --colour="auto" --colour-scale --group-directories-first --binary --header --sort="name" --no-time --level=1'
alias ls='exa'
alias la='exa --all'
alias l='la --long'
alias lc='la --classify'
alias lt="la --tree --long"
alias ll="ls --oneline"
alias lla="ll --all"
alias llt="lla --tree"
alias ld='ls --only-dirs'
alias lda='ld --all'
alias lld='ld --all'

### `rm` command
alias  rm="rmv"
alias rmv="command rm -i --recursive --verbose"
alias rmf="rmv --force"
alias rms="command rm -i --recursive"
alias rmq="command rm -i --recursive"
### `rm` end

### `mkdir` command
alias mkdir="mkdir --parents --verbose"
alias  mkd="mkdir"
alias   md="mkdir"
### `mkdir` end
