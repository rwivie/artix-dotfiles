#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\033[01;34m\]  \[\033[1;34m\](\[\033[01;34m\]\u@\h)(\[\033[1;32m\]\@ \d\[\033[1;32m\])\[\033[1;33m\](\[\033[1;33m\]\w\[\033[1;33m\])$ \[\033[0m\]"

#==== aliases
#source ~/.aliases

# Test and then source alias definitions.
if [ -f ~/.aliases ]; then
        source ~/.aliases
else
        print "Note: ~.aliases is unavailable."
fi

#=== so users can see
umask 0002

#=== base16-shell
#BASE16_SHELL="$HOME/.config/base16-shell/"
#[ -n "$PS1" ] && \
#    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#        eval "$("$BASE16_SHELL/profile_helper.sh")"

#=== command not found
source /usr/share/doc/pkgfile/command-not-found.bash

#=== auto cd
shopt -s autocd

#=== exports
#export EDITOR="mousepad"
export EDITOR='nano'
export VISUAL='mousepad'
export BROWSER="firefox"

#==== source files
#xrdb merge ~/.Xresources

#=== ranger just use user config
#export RANGER_LOAD_DEFAULT_RC=false

# XDG - set defaults as they may not be set
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
# and https://wiki.archlinux.org/index.php/XDG_Base_Directory_support
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Unsetting." >&2
    unset XDG_RUNTIME_DIR
else
    export XDG_RUNTIME_DIR
fi

#if [[ $STICKY_NOTE ]]; then
#  PS1=
#  cat "$HOME/tmp/sticky-note"
#  return
#fi

