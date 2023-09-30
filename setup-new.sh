#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | setup.sh                                                                   |
# +----------------------------------------------------------------------------+
# |       Usage: ---                                                           |
# | Description: Setup Script to install .dotfiles into home directory         |
# |    Requires: GNU core utils                                                |
# |       Notes: ---                                                           |
# |      Author: Waldemar Schroeer                                             |
# |     Company: Rechenzentrum Amper                                           |
# |     Version: 0.1                                                           |
# |     Created: 29.09.2023                                                    |
# |    Revision: ---                                                           |
# |                                                                            |
# | Copyright © 2019 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+
#
#
#
#
#
#
# +----- Help and Usage (Must start at line 25 and must stop with "######" ----+
#
# example.sh [options]
#
# This is an example on how to use functions from bash-framework.sh
#
# Options...
#  -d, --demo           Run the demo, otherwise exit with an error message
#  -h, --help           Print out help
#  -w, --width          Width to use
#  -o, --option         Just an option
#
#####

# +----- Include bash-framework.sh --------------------------------------------+
# set -o errexit
# set -o pipefail
export BASH_FRMWRK_MINVER=4
export LANG="en_US.UTF-8"
export base_dir="$(dirname "$(readlink -f "$0")")"
export cdir=$(pwd)
export scriptname="${BASH_SOURCE##*/}"
export scriptdir="${BASH_SOURCE%/*}"
export datetime="$(date "+%Y-%m-%d-%H-%M-%S")"
export logfile="${scriptdir}/${datetime}.log"
export framework_width=80

if [[ -f "${scriptdir}"/bash-framework.sh ]]; then
    BASH_FRMWRK_FILE="${scriptdir}/bash-framework.sh"
else
    test_file=$(which bash-framework.sh 2>/dev/null)
    if [[ $? = 0 ]]; then
        BASH_FRMWRK_FILE="${test_file}"
        unset test_file
    else
        echo -e "\nNo Bash Framework found.\n"
        exit 1
    fi
fi

source "${BASH_FRMWRK_FILE}"
if [[ "${BASH_FRMWRK_VER}" -lt "${BASH_FRMWRK_MINVER}" ]]; then
    echo -e "\nI've found version ${BASH_FRMWRK_VER} of bash_framework.sh, but I'm in need of version ${BASH_FRMWRK_MINVER}."
    echo -e "You may get the newest version from https://github.com/WieWaldi/bash-framework.sh\n"
    exit 1
fi

# +----- Variables ------------------------------------------------------------+

declare -a dotfiles_etc=(
    ".alias"
    ".inputrc"
    ".motd"
    ".screenrc"
    )

declare -a config_directories=(
    "/.config"
    "/.local"
    "/.ssh"
    "/.vim"
    "/Templates"
    )

declare -a dotfiles_Zsh=(
    ".zshenv"
    ".zshrc"
    ".zprofile"
    ".zlogin"
)

declare -a dotfiles_Bash=(
    ".bash_functions"
    ".bash_logout"
    ".bash_profile"
    ".bashrc"
)
# +----- Functions ------------------------------------------------------------+
create_Backup_Directory() {
    __echo_Left "Creating Backup directory"
    backupdirectory="${HOME}/.dotfiles_backup/${datetime}"
    mkdir -p ${backupdirectory} >> ${logfile} 2>&1
    __echo_Result
    echo "Your Backup Directory is:"
    echo "  ${backupdirectory}"
}

prepare_Directories() {
    __echo_Left "Installing: .config Directory"
    if [[ $(__check_File_Name ${HOME}/.config) = 1 ]]; then
        __echo_Skipped
    elif [[ $(__check_File_Name ${HOME}/.config) = 3 ]]; then
        mkdir -p ${HOME}/.config >> ${logfile} 2>&1
        __echo_Result
    else
        __echo_Failed
    fi
    __echo_Left "Installing: .local Directory"
    if [[ $(__check_File_Name ${HOME}/.config) = 1 ]]; then
        __echo_Skipped
    elif [[ $(__check_File_Name ${HOME}/.config) = 7 ]]; then
        mkdir -p ${HOME}/.local >> ${logfile} 2>&1
        __echo_Result
    else
        __echo_Failed
    fi
}

install_Dotfiles_Bash() {
    __echo_Left "Installing .dotfiles for Bash"
    if [[ "${get_Dotfiles_Bash}" = "yes" ]];then
        for i in "${dotfiles_Bash[@]}"; do
            eval file=${i}
            if [[ $(__check_File_Name ${HOME}/${file}) = 6 ]]; then
                __echo_Left "Backing up: ${file}"
                mv ${HOME}/${file} ${backupdirectory} >> ${logfile} 2>&1
                __echo_Result
            fi
            __echo_Left "Installing: ${file}"
            cp -r ${cdir}/${file} ${HOME}/${file} >> ${logfile} 2>&1
            __echo_Result
        done
    else
        __echo_Skipped
    fi
}

# install_Dotfiles_Zsh() {
#     __echo_Left "Installing .dotfiles for Zsh"
#     if [[ "${get_Dotfiles_Zsh}" = "yes" ]];then
#     fi
# }
# 
# install_Dotfiles_Vim() {
# }
# 
# install_Dir_config() {
# }
# 
# install_Dir_local() {
# }
# 
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
clear
__display_Text_File blue ${cdir}/setup-notice.txt
if [[ "$(__read_Antwoord_YN "Do you want to proceed?")" = "no" ]]; then
    echo -e "\n Oh Boy, you should reconsider your decision."
    exit 1
fi

__echo_Title "Make Your Choice"
get_Dotfiles_Zsh="$(__read_Antwoord_YN "Install Zsh dotfiles?")"
get_Dotfiles_Bash="$(__read_Antwoord_YN "Install bash dotfiles?")"
get_Dotfiles_Vim="$(__read_Antwoord_YN "Install Vim dotfiles?")"

create_Backup_Directory
prepare_Directories
install_Dotfiles_Bash






__echo_Title "I'm done."
echo -e "\n\n"
exit 0
