#!/bin/bash

# Install brew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh

# Install brew packages
brew update
brew install fish \
  go \
  rust \
  fzy \
  fzf \
  shellcheck \
  gcc \
  nvm \
  pyenv \
  rbenv \
  vale \
  golangci-lint \
  awscli \
  neovim \
  terraform

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

# Install node packages
npm install -g quicktype
npm install -g eslint_d
npm install jsonlint -g
npm install -g aws-cdk

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

# Install python packages
pip install pylint neovim
pip install --user yamllint

# Install rust packages
rustup component add rustfmt
