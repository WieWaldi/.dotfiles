#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | setup.sh                                                                |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

backupdir=~/Backup.dotfiles.$$
cdir=$(pwd)

declare -a dotfiles=(
    ".alias"
    ".bash_functions"
    ".bash_logout"
    ".bash_profile"
    ".bashrc"
    ".inputrc"
    ".motd"
    ".screenrc"
    ".tmux.conf"
    ".vimrc"
    ".zshenv"
    "template.sh"
    "template.php"
    )

Display_Warning() {
    clear && cat ${cdir}/setup-warning.txt
}

Install_Dotfiles() {
    mkdir -p ${backupdir}
    for i in "${dotfiles[@]}"; do
        if [ -f ~/${i} ]; then
            printf "\n Moving ${i} to $backupdir"
            mv ~/${i} $backupdir
        fi
        printf "\n Creating $i"
        cp ${cdir}/${i} ~
    done
}

Copy_Directories() {
    printf "\n Installing directories and binaries to your home directory."
    cp -r ${cdir}/.config ~
    cp -r ${cdir}/.local ~
    cp -r ${cdir}/.ssh ~
    cp -r ${cdir}/.vim ~
}

while true; do
    Display_Warning
    printf "\n\n Go ahead? (Yes|No) >> "
    read antwoord
    case $antwoord in
        [yY] | [yY][Ee][Ss] )
            Install_Dotfiles
            Copy_Directories
            printf "\n I'm done\n\n"
            break
            ;;
        [nN] | [n|N][O|o] )
            printf "\n Oh Boy, you should reconsider your decision."
            break
            ;;
        *)
            printf "  Wut?"
    esac
done

exit 0
