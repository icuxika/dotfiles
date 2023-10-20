# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------
# Zim configuration
# -----------------
source ~/.zsh/zim_settings.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# -----------------

#export HIST_STAMPS="yyyy-mm-dd"
source ~/.zsh/history.zsh

source ~/.zsh/functions.zsh
source ~/.zsh/alias.zsh

# -----------------
# macOS config
# -----------------
if [[ $(uname) = "Darwin" ]]; then
 [ -f ~/.bash_profile ] && source ~/.bash_profile
 [ -f ~/.zsh/functions_macos.zsh ] && source ~/.zsh/functions_macos.zsh
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi
# -----------------
# -----------------
# Linux config
# -----------------
if [[ $(uname) = "Linux" ]]; then
 [ -f ~/.bash_profile ] && source ~/.bash_profile
fi
