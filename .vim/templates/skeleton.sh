#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | example.sh                                                                 |
# +----------------------------------------------------------------------------+
# |       Usage: ---                                                           |
# | Description: Example script to show off how bash_framework.sh works        |
# |    Requires: bash_framework.sh                                             |
# |       Notes: ---                                                           |
# |      Author: Waldemar Schroeer                                             |
# |     Company: Rechenzentrum Amper                                           |
# |     Version: 3                                                             |
# |     Created: 10.08.2022                                                    |
# |    Revision: ---                                                           |
# |                                                                            |
# | Copyright © 2022 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+






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

# +----- Functions ------------------------------------------------------------+
output_Variable() {
    __echo_Title "VAR"
    __echo_Left "cdir:"
    __echo_Right "${cdir}"
    __echo_Left "base_dir:"
    __echo_Right "${base_dir}"
    __echo_Left "scriptname:"
    __echo_Right "${scriptname}"
    __echo_Left "scriptdir:"
    __echo_Right "${scriptdir}"
    __echo_Left "BASH_SOURCE:"
    __echo_Right "${BASH_SOURCE}"
    __echo_Left "demo:"
    __echo_Right "${demo}"
    __echo_Left "framework_width:"
    __echo_Right "${framework_width}"
    __echo_Left "option:"
    __echo_Right "${option}"
}

# +----- Option Handling ------------------------------------------------------+
while [[ $# -gt 0 ]]; do
    case "$1" in
        -\?|-h|-help|--help) __exit_Help ;;                    # Standard help option
        -doc|--doc)          __exit_Help ;;
        -d|--demo)
            demo="True"
            ;;
        -w|--width)
            if [[ ${2} != *[^0-9]* ]]; then
                __exit_Usage 10 "Width must be an integer"
            fi
            framework_width="${2}"
            shift
            ;;
        -o|--option)
            if [[ ${2} = *[^0-9]* ]]; then
                __exit_Usage 10 "Option must be an integer"
            fi
            option="${2}"
            shift
            ;;
        --) shift; break ;;                                 # Force end of user option
        -*) __exit_Usage 10 "Unknown option \"${1}\"" ;;    # Unknown command line option
        *)  break ;;                                        # Unforced end of user options
    esac
    shift                                                   # Shift to next option
done

# +----- Main -----------------------------------------------------------------+
# clear
if [[ "${demo}" != "True" ]]; then
    __exit_Usage 10 "Not in demo mode"
fi

__display_Text_File blue ${scriptdir}/notice.txt

if [[ "$(__read_Antwoord_YN "Do you want to proceed?")" = "no" ]]; then
    __exit_Error 10 "You don't want to proceed!"
fi

ThisExample1="$(__read_Line "Read Example")"
__echo_Left "This Example:"
__echo_Right "${ThisExample1}"

__echo_Title "Example Start"
__echo_Left "Let me start up."
__echo_OK
__echo_Left "Some Text on the left hand side."
__echo_Done
__echo_Left "A bit more Text on the left hand side."
__echo_Skipped
__echo_Left "Some more Text."
__echo_Failed

GoAhead="$(__read_Antwoord_YN "Shall we conitnue?")"
__echo_Left "We shall continue..."
if [[ "${GoAhead}" = "yes" ]]; then
    # Do some work
    __echo_Done
else
    __echo_Skipped
fi

__echo_Left "Copy affe"
cp affe /tmp >/dev/null 2>&1
__echo_Result

GoAhead="$(__read_Antwoord_YN "Check File Name?")"
if [[ "${GoAhead}" = "yes" ]]; then
    read -p "File Name: " filename
    filenamecode=$(__check_File_Name $(echo ${filename}))
    __echo_Left "Result is ${filenamecode}"
    __echo_Done

else
    __echo_Left "Check File Name..."
    __echo_Skipped
fi

__echo_Title "Example End"
# +----- End ------------------------------------------------------------------+
echo -e "\n\n"
exit 0
