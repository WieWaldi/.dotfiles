#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | Name of the Script                                                      |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+
# 塚 﨑 晴 﨓  
# ﱮ          
#    
#  

# /bin/pkill compton
/bin/xfreerdp --ignore-certificate -g 2400x1400 -d domain.com -u username -p password $1 &
# ~/.local/bin/compton &

function ThisFunction() {
    # Do something useful
    echo $1
}

casetype=$1
case ${casetype} in
    affe)
        echo affe
        ;;
    *)
        echo nicht affe
        ;;
esac

exit 0 
