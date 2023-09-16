# https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/history.zsh

## history命令实际调用
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    fc -p "$HISTFILE"
    echo >&2 History file deleted.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# 根据HIST_STAMPS环境变量的值来同时历史记录时间
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## zsh历史记录文件的路径、大小和保存数量
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

setopt extended_history       # 启用扩展历史记录功能，即显示命令的完整路径、选项和参数。
setopt hist_expire_dups_first # 在历史记录中删除重复项时，保留第一个命令。
setopt hist_ignore_dups       # 忽略重复的命令。
setopt hist_ignore_space      # 在搜索历史记录时，忽略命令末尾的空格。
setopt hist_verify            # 在执行历史记录命令之前，检查命令是否有效。
setopt share_history          # 允许在多个会话之间共享历史记录。
