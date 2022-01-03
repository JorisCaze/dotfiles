#!/bin/bash

# This script allow to setup easily the current machine environment to the one of this repo.
# Configuration files are linked (symbolic) to ease the source control.

read -p "Would you like to install Starship prompt (sudo required)? (y/n) " -n 1 -r yn
echo ''
if [ "$yn" = "y" ]; then
  # Install Starship prompt
  echo "Install Starship prompt..."
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
  echo "Done."

  # Install Nerd Font (for logo support with Starship)
  echo "Install Nerd Font..."
  wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
  unzip -qq FiraCode.zip -d FiraCode
  rm FiraCode.zip
  mkdir -p ~/.fonts/
  mv FiraCode ~/.fonts/
  echo "Desired font must be selected in the terminal using Preferences > Profile > Font."
  echo "Done."
fi

# Copy scripts into user bin folder
echo "Install scripts..."
mkdir -p ~/bin/
cp -r ./scripts/* ~/bin/
echo "Done."

# Deploy home folder (git + bashrc + config)
echo "Setup home folder..."

# Save bashrc.d dotfiles and remove link
if [ -d ~/dotfiles_backup ]; then
  echo "Previous dotfiles backup folder found ~/dotfiles_backup.
This folder must be deleted to proceed to installation."
  read -p "Delete previous dotfiles backup? (y/n) " -n 1 -r yn
  echo ''
  if [ "$yn" != "y" ]; then
    echo "Installation aborted."
    exit 0
  fi
  rm -rf ~/dotfiles_backup/
fi

mkdir -p ~/dotfiles_backup
if [ -d ~/.bashrc.d ]; then
  cp -r ~/.bashrc.d/ ~/dotfiles_backup/
  rm ~/.bashrc.d
fi

# Update bashrc.d
curr_dir=$(pwd)
ln -s $curr_dir/home/.bashrc.d ~/.bashrc.d

# Check if bashrc already includes bashrc.d
cat ~/.bashrc | grep ".bashrc.d" > /dev/null
if [ $? != 0 ]; then
  echo '
# Setup user
if [ -d ~/.bashrc.d/ ]; then
  for f in ~/.bashrc.d/.bash*; do . $f; done
fi
' >> ~/.bashrc
fi

# Vim & Git
cd ./home/
# Check if a dotfile of the Git repo is already present in home dir.
# If so, do a backup before removing the file from home dir.
# After a clean state proceed to create the symbolic link.
for file in .*;
do   
  if [ ! -d $file ]; then
    if [ -f ~/$file ]; then
      cp ~/$file ~/dotfiles_backup/
      rm ~/$file
    fi
    ln -s $curr_dir/home/$file ~/$file;
  fi; 
done

# Config files
mkdir -p ~/.config
mkdir -p ~/dotfiles_backup/.config
cd .config/
curr_dir=$(pwd)
for file in *; 
do 
  if [ -f ~/.config/$file ]; then
    cp ~/.config/$file ~/dotfiles_backup/.config/
    rm ~/.config/$file
  fi
  ln -s $curr_dir/$file ~/.config/$file
done
echo 'Done.'
