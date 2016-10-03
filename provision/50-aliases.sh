# leny/vagrant-etab
#
# /provision/50-aliases.sh - Vagrant provision script: bahs aliases
#
# coded by leny@flatLand!
# started at 03/09/2016

echo "
alias c='clear'
alias tree=\"find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'\"
alias l='ls -Falh'
alias duh='du -h --max-depth=1'
alias rm='rm -I'
alias ..='cd ..'
alias ...='cd ~-'

alias work='supervisor -w bin,static -e js,jade,pug -i node_modules,src,static'

cd /vagrant
" >> /home/ubuntu/.bashrc
