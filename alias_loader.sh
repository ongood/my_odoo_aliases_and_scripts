##########################################################
########################  PATHS  ##########################
###########################################################

export AP=$(dirname "$0")

export SRC="$HOME/src"
export ODOO="$SRC/odoo"
export ENTERPRISE="$SRC/enterprise"
export DESIGN_THEMES="$SRC/design-themes"
export INTERNAL="$SRC/internal"
export PAAS="$SRC/paas"
export ST="$SRC/support-tools"
export USER_DOC="$SRC/documentation-user"
export UPGR_PLAT="$SRC/upgrade-platform"
export OQOL="$SRC/misc_gists/odoo-qol"
export SRC_MULTI="$HOME/odoo/versions"

if [[ $OSTYPE =~ ^darwin ]]; then
    # macos specific stuffs
    export ODOO_STORAGE="$HOME/Library/Application Support/Odoo"
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export PATH="/usr/local/sbin:$PATH"
    # paths to some libraries
    export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"
    # misc
    alias flushdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
    # paths to gnu version of tools
    export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
    export HOMEBREW_NO_INSTALL_CLEANUP=TRUE
else
    # on linux machine
    export ODOO_STORAGE="$HOME/.local/Odoo"
fi

# GPG stuff
export GPG_TTY=$(tty)

# activate bash style completion
autoload bashcompinit
bashcompinit

# use vim as default editor
export EDITOR="vim"

# activate vi mode in the terminal
bindkey -v
if [ ! -f ~/.inputrc ]; then
    echo "set editing-mode vi" >~/.inputrc
else
    if ! grep -q "set editing-mode vi" ~/.inputrc; then
        echo "set editing-mode vi" >>~/.inputrc
    fi
fi

# re-add emacs style short cut to the command line editor
bindkey '^x^e' edit-command-line

# setup .zshrc to source this file
if ! grep -q "source $0" ~/.zshrc; then
    echo "source $0" >>~/.zshrc
fi

########################################
######   terminal customizations   #####
########################################

PROMPT="[%D|%T] $PROMPT"
TMOUT=10
TRAPALRM() {
    zle reset-prompt
}

##################################################
### load all the other files in the $AP folder ###
##################################################

# compile/generate non-bash aliases
ap_compile() {
    python3 $AP/python_scripts/alias.py --generate
}

# pure shell functions and aliases
source $AP/alias.sh

# load python based functions and aliases
if [ ! -f $AP/autogenerated_scripts.sh ]; then
    ap_compile
fi
source $AP/autogenerated_scripts.sh

# load autocompletion scripts
source $AP/completion.sh

# load temporary scripts
# this file may be deleted at any time, so we need to make sure that it actually exists before trying to source it
if [ -f $AP/temporary-scripts.sh ]; then
    source $AP/temporary-scripts.sh
fi

##################################################
###            Finishing touches               ###
##################################################
# scripts / alias defined in this repo to call at each terminal startup

# govcur
