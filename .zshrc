


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="mh"


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Global aliases
if [ -r ~/.bashrc.d/bashrc_aliases ]; then
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    . ~/.bashrc.d/bashrc_aliases
  else
    source ~/.bashrc.d/bashrc_aliases
  fi
fi

# Global aliases
if [ -r ~/.bashrc.d/bashrc_access ]; then
  if [[ "$OSTYPE" =~ ^darwin ]]; then
    source ~/.bashrc.d/bashrc_access
  else
    . ~/.bashrc.d/bashrc_access
  fi
fi

if [ pwd = $HOME/Apps/codde-eime ]; then
  rvm-prompt i v p g
fi

PS1="\$(~/.rvm/bin/rvm-prompt [options]) $PS1"


# zsh help
if [ -f /usr/local/share/zsh/helpfiles ]; then
  unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/helpfiles
fi


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
 # Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

if [ -r ~/Apps/powerline/powerline/bindings/zsh ]; then

  if [[ "$OSTYPE" =~ ^darwin ]]; then
    . ~/Apps/powerline/powerline/bindings/zsh/powerline.zsh
  else
    source ~/Apps/powerline/powerline/bindings/zsh/powerline.zsh
  fi
fi

# Customize to your needs...
# if mac os
if [[ "$OSTYPE" =~ ^darwin ]]; then
  plugins=(git rails textmate ruby brew osx gem github knife rails rake rbenv rvm shh-agent)
  export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/X11/bin:/Users/thomas/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/.cabal/bin/pandoc:$PATH

  #  auto completion for macosx
  if [ -f /opt/local/etc/bash_completion ]; then
      . /opt/local/etc/bash_completion
  fi
else

  # Rubymine
  # export RUBYMINE_JDK=/usr/lib/jvm/java-6-openjdk

  #zsh config
  plugins=(git rails ruby debian gem github knife rails rake rbenv rvm shh-agent)
  export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/thomas/.rvm/bin:/home/thomas/.linuxbrew/bin:$PATH

  # nodejs
  export PATH=$PATH:/opt/node/bin
  export NODE_PATH=/opt/node:/opt/node/lib/node_modules

  # add sencha CMD
  # export PATH=$PATH:/opt/SenchaSDKTools-2.0.0-beta3
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export DROPBOX_USE_LIBAPPINDICATOR=1
