#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | makeman.sh                                                                 |
# +----------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+

# Some glyphs I have often in use.
# 塚 﨑 晴 﨓  
# ﱮ          
#    
#                    
#  

ThisFunction() {
    # Do something useful
    echo $1
}

if [[ -n ${1} ]]; then
    if [[ "${2}" = "preview" ]]; then
        pandoc "${1}" -s -t man | /usr/bin/man -l -
    else
        pandoc "${1}" -s -t man -o "${2}"
    fi
else
    echo "No file given."
fi

exit 0 

