#!/bin/bash
# Make directories
mkdir -p "$HOME/.ssh/"

# Install brew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Install brew packages
brew update
brew bundle

# TODO: Everything below this should be done by fish shell

# Install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install neovim packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install fisher packages
if [[ -f /usr/local/bin/fish ]]; then
  /usr/local/bin/fish -c "fisher update"
else
  /opt/homebrew/bin/fish -c "fisher update"
fi

# Install go modules
go install github.com/mgechev/revive@latest
go install golang.org/x/lint/golint@latest
go install golang.org/x/tools/cmd/goimports@latest
go install mvdan.cc/gofumpt@latest
go install github.com/kisielk/errcheck@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install github.com/fatih/gomodifytags@latest
go get -u github.com/cweill/gotests/...
go install github.com/koron/iferr@latest
go install github.com/katbyte/terrafmt@latest
go install github.com/arl/gitmux@latest

# Install node packages
npm install -g eslint_d prettierd quicktype aws-cdk typescript-language-server typescript jsonlint

# Install python packages
pip install pylint neovim
pip install --user yamllint

# Install rust and rust packages
curl https://sh.rustup.rs -sSf | sh
rustup component add rustfmt

# Install gem packages
gem install --user-install solargraph

# Install Macports
cd /tmp
wget https://github.com/macports/macports-base/releases/download/v2.11.5/MacPorts-2.11.5.tar.gz
cd MacPorts-2.11.5
./configure && make && sudo make install

# Install Luarocks
wget https://luarocks.github.io/luarocks/releases/luarocks-3.12.2.tar.gz
tar zxpf luarock-3.12.2.tar.gz
cd luarocks-3.12.2
./configure && sudo make bootstrap
