cd ~
# create apps folder if not exist
if [ ! -d "Apps" ]; then
  mkdir Apps
fi

# Clone repository
git clone git://github.com/thooams/dotfiles.git ~/Apps/dotfiles

ln -s ~/Apps/dotfiles/.bashrc.d ~/.bashrc.d
ln -s ~/Apps/dotfiles/.bashrc ~/.bashrc
ln -s ~/Apps/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/Apps/dotfiles/.gitignore-global ~/.gitignore-global
ln -s ~/Apps/dotfiles/.irbrc ~/.irbrc
ln -s ~/Apps/dotfiles/.gemrc ~/.gemrc
ln -s ~/Apps/dotfiles/funky-fresh.rb /usr/local/bin/ff
ln -s ~/Apps/dotfiles/.git-templates ~/.git-templates

# copy dropbox files
ln -s ~/Dropbox/configuration_linux/.bashrc.d/bashrc_access ~/.bashrc.d/bashrc_access
ln -s ~/Dropbox/configuration_linux/.ssh ~/.ssh

