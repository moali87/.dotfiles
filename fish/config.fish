# FZF Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# FZF
# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# FZF
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

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
fish_add_path $PYENV_ROOT/bin
pyenv init - | source

# Neovim
set -x NVIM_FOLDER $HOME/.config/nvim
set -x EDITOR nvim

# Golang
set -x PATH $HOME/go/bin $PATH

# Starship
starship init fish | source

# NVM
# nvm use v16
# set -Ux NVM_DIR $HOME/.local/share/nvm

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
if test -e ~/.config/private/privateKeys.fish
  source ~/.config/private/privateKeys.fish
end

# Config
if test -e ~/.config/private/config.fish
  source ~/.config/private/config.fish
end

# theme_gruvbox dark

# TFENV
set -x PATH $HOME/.tfenv/bin $PATH

# fzf
fzf --fish | source
