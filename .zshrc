# PATH

export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
path=(~/bin ~/.composer/vendor/bin /usr/local/sbin ~/.config/yarn/global/node_modules/.bin $path)
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/node@10/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/code/go

# Aliases

alias zshconfig="subl ~/.zshrc"
alias sourcezsh="source ~/.zshrc"
alias ohmyzsh="subl ~/.oh-my-zsh"
alias manage="python3 manage.py"
alias runserver="python3 manage.py runserver"
alias http="http-prompt"
alias c="code ."
alias x="exit"
alias s="npm start"
alias b="npm run build"

# Functions

function mkcd() {
mkdir $1;
cd $1
}

function gitrebase() {
    git pull --rebase upstream $1;
}

function gitpr() {
    if [[ -z $1 ]]; then
        print "Enter pull_id and branch_name"
        print "gitpr pull_id branch_name"
        return 1
    fi
    if [[ -z $2 ]]; then
        print "Enter branch_name"
        print "gitpr $1 branch_name"
        return 1
    fi
    git fetch upstream pull/$1/head:$2
    git checkout $2
}

function gitpull() {
    baseurl='https://github.com/digi0ps/Memex/pull/new/'
    gbranch=$(git branch | grep "*" | cut -d " " -f 2)
    tput setaf 2; tput smul; tput bel; echo $baseurl$gbranch;
    tput sgr0; echo "Press enter to open it in a new tab."
    read
    open $baseurl$gbranch
    return 1
}

# Git add all, commit and maybe push
function gam() {
    if [[ -z $1 ]]; then
        print "Help: gam (-p|--push)? message"
        return 1
    fi

    if [[ $1 = "-p" || $1 = "--push" ]]; then
        if [[ -z $2 ]]; then
            print "Enter commit message."
            print "Help: gam (-p|--push)? message"
        else
                git add .
                git commit -m $2
                git push origin master
        fi
    else
        git add .
        git commit -m $1
    fi
}

function gitcommits() {
    gituser=$(git config --global user.name)
    gitbranch=$(git branch | grep "*")
    commits=$(git log | grep $gituser | wc -l)
    echo "Number of commits in $gitbranch: $commits"
}

# dotcommit - copy all dotfiles into dotfiles repo and commit
function dotcommit() {
    DOT_FILES_REPO="$HOME/code/dotfiles/";
    cd $DOT_FILES_REPO;
    for file in ".bash_profile" ".hyper.js" ".zshrc";
    do;
        echo "Backing up $file to $DOT_FILES_REPO";
        cp $HOME/$file .;
    done;
    ls -a;
}

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse"

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

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
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  autojump
)

source $ZSH/oh-my-zsh.sh


# Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/digiops/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/digiops/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/digiops/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/digiops/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

