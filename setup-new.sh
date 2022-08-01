#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | setup.sh                                                                   |
# +----------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+

# +----- Include bash-framework.sh --------------------------------------------+
export LANG="en_US.UTF-8"
export base_dir="$(dirname "$(readlink -f "$0")")"
export cdir=$(pwd)
export datetime="$(date "+%Y-%m-%d-%H-%M-%S")"
export logfile="${cdir}/${datetime}.log"
export framework_width=80
export notice=notice.txt
export bash_framework="${HOME}/.local/bin/bash-framework.sh"
if [[ ! -f ${bash_framework} ]]; then
    export bash_framework="${cdir}/bash_framework.sh"
fi
source ${bash_framework}

# +----- Variables ------------------------------------------------------------+
backupdir=~/.dotfiles.${datetime}

declare -A check_directory_exists

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
    ".zshenv"
    )

declare -a directories=(
    "${HOME}/.config"
    "${HOME}/.local"
    "${HOME}/.ssh"
    "${HOME}/.vim"
    "${HOME}/Templates"
    )

declare -a dotfiles_Zsh=(
    ".zshenv"
    ".zshrc"
    ".zprofile"
    ".zlogin"
)

# +----- Functions ------------------------------------------------------------+

create_BackupDirectory() {
    echo_Left "Backup directory: ${backupdir}"
    mkdir -p ${backupdir}
    echo_Done
}

check_Directories_Exists() {
    for i in "${directories[@]}"; do
        echo_Left "Checking ${i}"
        if [[ -d "${i}" ]]; then
            check_directory_exists["$i"]="yes"
            echo_OK
        else
            check_directory_exists[$i]="no"
            echo_Failed
        fi
    done
}

install_Dotfiles() {
    for i in "${dotfiles[@]}"; do
        if [[ -f ~/${i} ]]; then
            echo -n -e "Moving ${i} to ${backupdir}\r"
            mv ~/${i} $backupdir
            echo_OK
        fi
        echo -n -e "Copying $i\r"
        cp ${cdir}/${i} ~
        echo_OK
    done
}

install_Zsh() {
    if [[ "${get_install_Zsh}" = "yes" ]]; then
        if [[ "${check_directory_exists[${HOME}/.config]}" = "yes" ]]; then
            echo "Dir ${check_directory_exists[${HOME}/.config]} ist da."
        else
            echo "Dir ${check_directory_exists[${HOME}/.config]} ist nicht da."
        fi
    fi
}

install_ZshTTT() {
    if [[ "${get_install_Zsh}" = "yes" ]]; then
        for i in "${dotfiles_Zsh[@]}"; do
            if [[ -f ~/${i} ]]; then
                echo_Left "Moving ${i} to backup directory"
                mv ~/${i} $backupdir
                if [[ ${?} -eq 0 ]]; then echo_OK; else echo_Failed; fi
            fi
        done
        echo_Left "Copying .zshenv to home directory"
        cp ${cdir}/.zshenv ${HOME}
        if [[ ${?} -eq 0 ]]; then echo_OK; else echo_Failed; fi
        if [[ -d "${HOME}/.config/zsh" ]]; then
            echo_Left "Moving .config/zsh to ${backupdir}"
            mv ${HOME}/.config/zsh $backupdir
            if [[ ${?} -eq 0 ]]; then echo_OK; else echo_Failed; fi
        fi
        echo_Left "Copying .config/zsh to ${HOME}/.config"
        cp -r ${cdir}/.config/zsh ${HOME}/.config
        if [[ ${?} -eq 0 ]]; then echo_OK; else echo_Failed; fi
    fi
}

copy_Directories() {
    for i in "${directories[@]}"; do
        if [[ -d ~/${i} ]]; then
            echo -n -e "Moving ${i} to ${backupdir}\r"
            mv ~/${i} $backupdir
            echo_OK
        fi
        echo -n -e "Copying $i\r"
        cp -r ${cdir}/${i} ~
        echo_OK
    done
}

# +----- Main -----------------------------------------------------------------+
display_Notice ${cdir}/${notice}
if [[ "${proceed}" = "no" ]]; then
    echo -e "\n Oh Boy, you should reconsider your decision."
    exit 1
fi

echo_Title "Make Your Choice"
get_install_Zsh="$(read_Antwoord "Install Zsh dotfiles? ${YN}")"
get_install_Bash="$(read_Antwoord "Install bash dotfiles? ${YN}")"
get_install_Vim="$(read_Antwoord "Install Vim dotfiles? ${YN}")"
echo_Title "Copying .dotfiles"
create_BackupDirectory
check_Directories_Exists
declare -p check_directory_exists



install_Zsh

# install_Dotfiles
# echo_title "Copying directories"
# copy_Directories
echo_Title "I'm done."
echo -e "\n\n"
exit 0
