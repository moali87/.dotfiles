# Aliases
alias cat "bat --style=plain"

# Homebrew
if test -d /opt/homebrew/bin
  set -x PATH /opt/homebrew/bin $PATH
  alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") /opt/homebrew/bin/brew"
end

# Rbenv
status --is-interactive; and rbenv init - fish | source
# set -Ux fish_user_paths $HOME/.rbenv/bin $fish_user_paths
# set -x PATH $HOME/.gem/ruby/2.7.0/bin $PATH

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - | source

# Neovim
set -x NVIM_FOLDER $HOME/.config/nvim
set -x EDITOR nvim 

# Golang
set -x PATH $HOME/go/bin $PATH

# Starship
starship init fish | source

# NVM
nvm use v16
set -Ux NVM_DIR $HOME/.local/share/nvm

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# Ripgrep
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/.ripgreprc

# GPG
set -x GPG_TTY (tty)

# local/bin
set -x PATH $HOME/.local/bin $PATH

# Config for this machine only
# Keys
source ~/.config/private/privateKeys.fish

# Config
source ~/.config/private/config.fish

# theme_gruvbox dark
