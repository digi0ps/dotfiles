# Exports
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export GIT_TOKEN="9dfbd1f8b5ffcb8d184be18d12dd348ba9898bb0"

# Aliases
alias sourcebash="source ~/.bash_profile"
alias composer="php /usr/local/bin/composer.phar"

# Changing the prompt
export PS1="\[\e[31m\]\w\[\e[0m\] "

# mkcd - mkdir and jump into the created directory
function mkcd(){
    mkdir $1;
    cd $1;
    return 0;
}

# dotcommit - copy all dotfiles into dotfiles repo and commit
function dotcommit(){
    DOT_FILES_REPO="$HOME/code/dotfiles/";
    echo "Backing up .bash_profile to dotfiles";
    cp $HOME/.bash_profile $DOT_FILES_REPO
    echo "Backing up .hyper.js to dotfiles";
    cp $HOME/.hyper.js $DOT_FILES_REPO
    echo "DONE";
    ls -a;
}

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh