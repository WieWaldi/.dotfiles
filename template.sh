#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | Name of the Script                                                      |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

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
