# Defined prompt only if is not already defined
if [ ! -z "$PS1" ]; then
        if [ -r ~/.bashrc.d/bashrc_prompt ]; then
	        source ~/.bashrc.d/bashrc_prompt
	fi
fi

# Global aliases
if [ -r ~/.bashrc.d/bashrc_aliases ]; then
        source ~/.bashrc.d/bashrc_aliases
fi

# Global aliases
if [ -r ~/.bashrc.d/bashrc_aliases ]; then
        source ~/.bashrc.d/bashrc_access
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
   . /etc/bash_completion
fi


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
