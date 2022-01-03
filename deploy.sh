#!/bin/bash

# Install Starship prompt
echo "Install Starship prompt..."
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
echo "Done."

# Install Nerd Font (for logo support)
echo "Install Nerd Font..."
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip -qq FiraCode.zip -d FiraCode
rm FiraCode.zip
mkdir -p ~/.fonts/
mv FiraCode ~/.fonts/
echo "Done."

# Copy scripts into user bin folder
echo "Install scripts..."
mkdir -p ~/bin/
cp -r ./scripts/* ~/bin/
echo "Done."

# Deploy home folder (git + bashrc + config)
echo "Setup home folder..."
mkdir -p ~/.config/
cp -r ./home/. ~/
echo '
# Setup user
if [ -d ~/.bashrc.d/ ]; then
    for f in ~/.bashrc.d/.bash*; do source $f; done
fi
' >> ~/.bashrc
echo "Done."
