# Aliases
alias cat "bat --style=plain"

# Pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin 
contains $fish_user_paths {$PYENV_ROOT}/bin or set --universal --append fish_user_paths {$PYENV_ROOT}/bin
status is-login; and pyenv init --path | source
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - --no-rehash | source
  status --is-interactive; and pyenv virtualenv-init - | source
end

# Homebrew
if test -d /opt/homebrew/bin
  set -x PATH /opt/homebrew/bin $PATH
  alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") /opt/homebrew/bin/brew"
end

# Neovim
set -x NVIM_FOLDER $HOME/.config/nvim
set -x EDITOR nvim 

# Golang
set -x PATH $HOME/go/bin $PATH

# Starship
starship init fish | source

# NVM
nvm use v16
set -Ux NVIM_DIR $HOME/.local/nvm

# Ruby
status --is-interactive; and rbenv init - fish | source

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# Ripgrep
set -x RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/.ripgreprc

# local/bin
set -x PATH $HOME/.local/bin $PATH
