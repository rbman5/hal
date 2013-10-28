# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export TERM="xterm"

PS1="\[$(tput setaf 1)\]\u $(tput setaf 3)>$(tput setaf 1)$(hostname | tr '[A-Z]' '[a-z]')$(tput setaf 3)<$(tput setaf 1) \w >> \[$(tput sgr0)\]"
#fi
#PS1="\e[0;31m \u >> \e[m\W $ "

eval `dircolors -b ~/.dir_colors`
alias gp="cd ~/hal && git push && cd -"
alias gp2="cd ~/hal && git add ~/.bashrc ~/bin ~/.dir_colors ~/hal/.mybashsetup.sh && git commit -m 'hi' && git push origin master && cd -"
alias gitbash="rm -rf ~/hal && git clone https://github.com/rbman5/hal.git && cd ~/hal && chmod +x .mybashsetup.sh && ./.mybashsetup.sh && cd && . .bashrc"
alias ls="ls --color=auto"
alias htpc="ssh htpc -X"
alias htpcinternet="ssh -A kzz5.com -X"
alias htpcinternetvnc="ssh -L  5901:localhost:5901 kzz5@kzz5.com"
alias nimbus="ssh nimbus -X"
alias nimbusinternet="ssh -A nimbus.kzz5.com -X"
alias nimbusinternetvnc="ssh -L 5901:localhost:5901 kzz5@kzz5.com"
alias pc="ssh pc -X"
alias pi="ssh pi@tardis"
alias piinternet="ssh pi@tardis.kzz5.com"
alias down="cd /$(hostname | tr '[A-Z]' '[a-z]')stuff/Downloads"
alias fixbash="PS1='\u $(hostname | tr '[A-Z]' '[a-z]') \w  >> '"
fixbash
###########################
alias vpn="sudo pon work && sleep 5  && ifconfig | grep ppp"
alias kvpn="sudo poff work"
alias vz="sudo wvdial Verizon4GLTE"
###########################

alias clean="sudo umount /media/e && find /home/kzz5/.thumbnails/normal -mmin -180 -exec rm {} \;"
#alias thumb24="find /home/kzz5/.thumbnails/normal -mmin -1440 -exec rm {} \;"
#alias thumb="find /home/kzz5/.thumbnails/normal -mmin -180 -exec rm {} \;"
#alias thumball="rm /home/kzz5/.thumbnails/normal/*"
#alias thumball="rm -f /home/kzz5/.cache/thumbnails/normal/* && rm -f /home/kzz5/.cache/thumbnails/large/*"
alias mkdir='mkdir -pv'
alias thumball="rm -r .cache/thumbnails/"
alias dir="ls"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'
alias editbash='geany ~/.bashrc'
alias ti='ping google.com'
alias utargz="tar xvzf"
alias utarbz2="tar xvjf"
alias utar="tar xvf"
alias mgn="mtpfs ~/Nexus/"
alias tailmail='tail /var/spool/mail/kzz5'
alias oct="stat -c %a %n"
alias ed="export DISPLAY=:0"
alias screenvnc="screen xllvnc -display :0"
alias nautilus="nemo"
alias s="screen"
alias wget='wget -c'
alias localinstall='sudo yum localinstall --nogpgcheck'
alias htpcnox='ssh htpc'
alias oct="stat -c '%a %n'"
export PATH=$PATH:/home/kzz5/bin:/home/kzz5/AndroidSDK/platform-tools
alias jd="screen java -jar '/home/kzz5/JDownloader/JDownloader.jar'&"
alias update="sudo apt-get update && sudo apt-get upgrade"
alias splitflac="shnsplit -f *.cue -o flac -t '%n - %t' *.flac < *.cue"
alias yums="sudo apt-cache search"
alias yumf="sudo apt-get -f install"
alias yumin="sudo apt-get install"
alias yumre="sudo apt-get remove"
alias yumup="sudo apt-get update"
alias yumrein="sudo apt-get install --reinstall"
alias yumf="sudo apt-get install -f"

function extract () {
	PWD="`pwd`"
	echo $PWD
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf -c $PWD/$(mkdir -p $(echo $1 |  sed 's/.tar.gz//')) $1    ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#################################################
# Backup a file with a date-time stamp		 #
##################################################

# Usage "bu filename.txt"
function bu() { cp $1 ${1}-`date +%Y%m%d%H%M`.bak ; }
function bak() { cp $1 ${1}-`date +%Y%m%d%H%M`.bak ; }
# Creates an archive from directory		 #
function mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

##################################################
# Reminder for whatever whenever		 #
##################################################

function remindme()
{
min=$[$1*60]
sleep "$min" && zenity --info --text "$2" &
}
################################################
# Send to HTPC
################################################
function sendtohtpc()
{
scp "$1" kzz5@htpc:/home/kzz5
}


# merge session histories
shopt -s histappend

export HISTTIMEFORMAT="%F %T "
