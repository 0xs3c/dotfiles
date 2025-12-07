# 1. CORE SETTINGS
HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_CD

# 2. THE PROMPT (Native Git Support)
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{242}(%b)%f '
zstyle ':vcs_info:git:*' actionformats '%F{242}(%b|%a)%f '
PROMPT='%F{blue}%~%f ${vcs_info_msg_0_}%(!.%F{red}#.%F{green}$) '

# 3. ALIASES
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias v="nvim"
alias gs="git status"
alias ga="git add"
alias gp="git push -u origin"
alias gc="git commit -m"
alias gcl="git clone"


# 4. PLUGINS (Loading from the "plugins" submodule folder)
source "$ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"

# 5. COMPLETION (Must be after plugins)
autoload -Uz compinit
compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
