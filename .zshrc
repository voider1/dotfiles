# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/wesleygahr/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker bower brew celery encode64 git-extras gradle jsontools osx pip python tmux urltools cask)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"


# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Use Forklift to open files in GUI
alias fl='open -b com.binarynights.ForkLift-3'

# Exa alias
alias e='exa'

autoload -U promptinit; promptinit
prompt pure

source /Users/wesleygahr/.config/tmux/tmuxinator.zsh

# Add Android stuff to path
export PATH="/Users/wesleygahr/Library/Android/sdk/platform-tools:$PATH"
export PATH="/Users/wesleygahr/Library/Android/sdk/build-tools/25.0.2:$PATH"
export PATH="/Users/wesleygahr/Library/Android/sdk/ndk-bundle:$PATH"

# Use GNU coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Expose your own binaries
export PATH="/usr/local/bin:$PATH"

# Use Brew's OpenSSL
export OPENSSL_LIB_DIR="/usr/local/opt/openssl/lib"
export OPENSSL_INCLUDE_DIR="/usr/local/opt/openssl/include"

# Rust source path
export RUST_SRC_PATH=/Users/wesleygahr/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
# Add Rust stuff to path
source $HOME/.cargo/env

# Terminal config
export TERM=xterm-256color
export NVIM_TUI_ENABLE_TRUE_COLOR=1
export EDITOR=nvim

# Add syntax highlighting to shell
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FZF config
export SKIM_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,target,venv}/*" --type-add "blacklist:*.{class,pyc}" -Tblacklist'
# Initialize fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/Users/wesleygahr/go/bin:$PATH"
