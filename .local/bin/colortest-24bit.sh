#!/usr/bin/env bash
#
# +----------------------------------------------------------------------------+
# | .local/bin/colortest-24bit.sh                                              |
# +----------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# +----------------------------------------------------------------------------+

# +----- Functions ------------------------------------------------------------+
setBackgroundColor() {
    printf '\x1b[48;2;%s;%s;%sm' $1 $2 $3
}

resetOutput() {
    echo -en "\x1b[0m\n"
}

rainbowColor() { 
    let h=$1/43
    let f=$1-43*$h
    let t=$f*255/43
    let q=255-t
    if [ $h -eq 0 ]; then
        echo "255 $t 0"
    elif [ $h -eq 1 ]; then
        echo "$q 255 0"
    elif [ $h -eq 2 ]; then
        echo "0 255 $t"
    elif [ $h -eq 3 ]; then
        echo "0 $q 255"
    elif [ $h -eq 4 ]; then
        echo "$t 0 255"
    elif [ $h -eq 5 ]; then
        echo "255 0 $q"
    else
        # execution should never reach here
        echo "0 0 0"
    fi
}

# +----- Main -----------------------------------------------------------------+
for i in `seq 0 127`; do
    setBackgroundColor $i 0 0
    echo -en " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor $i 0 0
    echo -en " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor 0 $i 0
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor 0 $i 0
    echo -n " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor 0 0 $i
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor 0 0 $i
    echo -n " "
done
resetOutput

for i in `seq 0 127`; do
    setBackgroundColor `rainbowColor $i`
    echo -n " "
done
resetOutput
for i in `seq 255 -1 128`; do
    setBackgroundColor `rainbowColor $i`
    echo -n " "
done
resetOutput

exit 0
