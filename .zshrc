# Created by newuser for 5.9
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR='nvim'
# history
HISTSIZE=5000
SAVEHIST=5000
WORDCHARS=''
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

autoload -Uz compinit
compinit

autoload -Uz colors && colors

alias ls='ls --color=auto'
alias ll='ls -lah'
alias vim='nvim'

setopt AUTO_CD
unsetopt CORRECT
unsetopt CORRECT_ALL
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"
# --- syntax highlighting ---
ZSH_HIGHLIGHT_STYLES[command]='fg=#b9d0aa'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9fbfe7'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#a0c0d0'
ZSH_HIGHLIGHT_STYLES[function]='fg=#ccaaee'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#c0b080,underline'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#b9d0aa'

ZSH_HIGHLIGHT_STYLES[path]='fg=#9fbfe7,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#7a9fc0,underline'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#c0b080'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#c0b080'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e9acbf'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=#e9acbf'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e9acbf'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#a0c0d0'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#a0c0d0'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c0b080'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#e9acbf'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#eca28f'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#eca28f'

ZSH_HIGHLIGHT_STYLES[comment]='fg=#5e5468,italic'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#eca28f,underline'

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#767676'
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
source /usr/share/fzf/key-bindings.zsh
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:~/zigbin"
