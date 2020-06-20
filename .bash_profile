export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export PATH=~/bin:$PATH
echo "Welcome to the throne, digi0p$"
alias py='python3'
alias runserver='py manage.py runserver'
alias manage='py manage.py'
alias alpha='cd ~/Desktop/v && source bin/activate'
alias digi='cd ~/Code/digiops && source bin/activate && cd digiopsdotme'
alias up='vagrant up; vagrant ssh;'
alias rebootserver='vagrant halt; vagrant up; vagrant ssh;'
alias rebase='git fetch upstream; git rebase upstream/master;'
