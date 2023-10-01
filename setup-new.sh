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
declare -a dotfiles_Base=(
    ".alias"
    ".inputrc"
    ".motd"
    ".screenrc"
    ".config/bat"
    ".config/powershell"
    ".config/tmux"
    ".config/vifm"
    ".local/bin/colortest-24bit.sh"
    ".local/bin/colortest-256.sh"
    ".local/bin/colortest-ansi-logo-1.sh"
    ".local/bin/colortest-ansi-logo-2.sh"
    ".local/bin/colortest-ansi.sh"
    ".local/bin/colortest-bars.sh"
    ".local/bin/colortest-gYw.sh"
    ".local/bin/colortest-pac-man-1.sh"
    ".local/bin/colortest-pac-man-2.sh"
    ".local/bin/colortest-pac-man-3.sh"
    ".local/bin/colortest-pac-man-hostfetch.sh"
    ".local/bin/colortest-slim.sh"
    ".local/bin/colortest-star.sh"
    ".local/bin/colortest-support1.pl"
    ".local/bin/colortest-support2.sh"
    ".local/bin/colortest-view.sh"
    ".local/bin/colortest-zig.sh"
    ".local/bin/cowsay"
    ".local/bin/exa"
    ".local/bin/fuck"
    ".local/bin/git-diff-wrapper.sh"
    ".local/bin/lolcat"
    ".local/bin/mailbomb.sh"
    ".local/bin/rdp"
    ".local/bin/tmux-start.sh"
    ".local/bin/vmremote"
    ".local/bin/xclientprop.sh"
    )

declare -a config_Directories=(
    ".config"
    ".local/bin"
    ".local/share/cowsay"
    ".local/share/man/man1"
    ".local/share/man_build"
    )

declare -a dotfiles_Zsh=(
    ".zshenv"
    )

declare -a dotfiles_Bash=(
    ".bash_functions"
    ".bash_logout"
    ".bash_profile"
    ".bashrc"
    )

# +----- Functions ------------------------------------------------------------+
create_Backup_Directory() {
    __echo_Left "Backup Directory:"
    if [[ "${get_Backup_Directory}" = "yes" ]]; then
        __echo_Left "Creating Backup directory"
        backupdirectory="${HOME}/.dotfiles_backup/${datetime}"
        mkdir -p ${backupdirectory} >> ${logfile} 2>&1
        __echo_Result
        echo "Your Backup Directory is:"
        echo "  ${backupdirectory}"
    else
        __echo_Skipped
    fi
}

create_Config_Directories() {
    __echo_Left "Config Directories:"
    if [[ "${get_Config_Directories}" = "yes" ]]; then
        for i in "${config_Directories[@]}"; do
            __echo_Left "Preparing Directory: ${i}"
            if [[ $(__check_File_Name ${HOME}/${i}) = 1 ]]; then
                __echo_Right "Already in Place"
            elif [[ $(__check_File_Name ${HOME}/${i}) = 3 ]]; then
                mkdir -p ${HOME}/${i} >> ${logfile} 2>&1
                __echo_Result
            else
                __echo_Failed
            fi
        done
    else
        __echo_Skipped
    fi
}

install_Dotfiles_Bash() {
    __echo_Left "Bash:"
    if [[ "${get_Dotfiles_Bash}" = "yes" ]];then
        get_Dotfiles_Base="yes"
        for i in "${dotfiles_Bash[@]}"; do
            if [[ $(__check_File_Name ${HOME}/${i}) = 6 ]]; then
                __echo_Left "Backing up: ~/${i}"
                cp -r ${HOME}/${i} ${backupdirectory} >> ${logfile} 2>&1
                __echo_Result
            fi
            __echo_Left "Installing: ~/${i}"
            cp -r ${cdir}/${i} ${HOME}/${i} >> ${logfile} 2>&1
            __echo_Result
        done
    else
        __echo_Skipped
    fi
}

install_Dotfiles_Zsh() {
    __echo_Left "Zsh:"
    if [[ "${get_Dotfiles_Zsh}" = "yes" ]];then
        get_Dotfiles_Base="yes"
        if [[ $(__check_File_Name ${HOME}/.zshenv) = 6 ]]; then
            __echo_Left "Backing up: ~/.zshenv"
            cp -r ${HOME}/.zshenv ${backupdirectory} >> ${logfile} 2>&1
            __echo_Result
        fi
        __echo_Left "Installing: ~/.zshenv"
        cp -r ${cdir}/.zshenv ${HOME}/.zshenv >> ${logfile} 2>&1
        __echo_Result
        if [[ $(__check_File_Name ${HOME}/.config/zsh) = 1 ]]; then
            __echo_Left "Backing up: ~/.config/zsh"
            cp -r ${HOME}/.config/zsh ${backupdirectory} >> ${logfile} 2>&1
            __echo_Result
        fi
        __echo_Left "Installing: ~/.config/zsh"
        cp -r ${cdir}/.config/zsh ${HOME}/.config >> ${logfile} 2>&1
        __echo_Result
    else
        __echo_Skipped
    fi
}

install_Dotfiles_Vim() {
    __echo_Left "Vim:"
    if [[ "${get_Dotfiles_Vim}" = "yes" ]];then
        if [[ $(__check_File_Name ${HOME}/.vim) = 1 ]]; then
            __echo_Left "Backing up: ~/.vim"
            cp -r ${HOME}/.vim ${backupdirectory} >> ${logfile} 2>&1
            __echo_Result
        fi
        __echo_Left "Installing: ~/.vim"
        cp -r ${cdir}/.vim ${HOME}/.vim >> ${logfile} 2>&1
        __echo_Result
    else
        __echo_Skipped
    fi
}

install_Dotfiles_Base() {
    __echo_Left "Base:"
    if [[ "${get_Dotfiles_Base}" = "yes" ]];then
        for i in "${dotfiles_Base[@]}"; do
            eval file=${i}
            if [[ $(__check_File_Name ${HOME}/${file}) = 1 || $(__check_File_Name ${HOME}/${file}) = 6 ]]; then
                __echo_Left "Backing up: ~/${file}"
                cp -r ${HOME}/${file} ${backupdirectory} >> ${logfile} 2>&1
                __echo_Result
            fi
            __echo_Left "Installing: ~/${file}"
            cp -r ${cdir}/${file} ${HOME}/${file} >> ${logfile} 2>&1
            __echo_Result
        done
    else
        __echo_Skipped
    fi
}

# +----- Main -----------------------------------------------------------------+
clear
__display_Text_File blue ${cdir}/setup-notice.txt
if [[ "$(__read_Antwoord_YN "Do you want to proceed?")" = "no" ]]; then
    echo -e "\n Oh Boy, you should reconsider your decision."
    exit 1
fi

__echo_Title "Make Your Choice"
get_Dotfiles_Zsh="$(__read_Antwoord_YN "Install .dotfiles for Zsh?")"
get_Dotfiles_Bash="$(__read_Antwoord_YN "Install .dotfiles for Bash?")"
get_Dotfiles_Vim="$(__read_Antwoord_YN "Install .dotfiles for Vim?")"

if [[ "${get_Dotfiles_Zsh}" = "yes" || \
      "${get_Dotfiles_Bash}" = "yes" ]]; then
    get_Backup_Directory="yes"
    get_Config_Directories="yes"
    get_Dotfiles_Base="yes"
fi
if [[ "${get_Dotfiles_Vim}" = "yes" ]]; then
    get_Backup_Directory="yes"
fi

create_Backup_Directory
create_Config_Directories
install_Dotfiles_Zsh
install_Dotfiles_Bash
install_Dotfiles_Vim
install_Dotfiles_Base






__echo_Title "I'm done."
echo -e "\n\n"
exit 0
