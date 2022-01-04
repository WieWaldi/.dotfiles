#!/bin/sh
#
# +-------------------------------------------------------------------------+
# | ~/.local/bin/showcolor-pac-man-hostfetch.sh                             |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+
 
 function pacman_fancy() {
    host="$(hostname)"
    os="$(uname)"
    kernel="$(uname -sr | cut -d - -f 1)"
    uptime="$(uptime -p | sed 's/up //; s/ weeks,/w/; s/ week,/w/; s/ days,/d/; s/ day,/d/; s/ hours,/h/; s/ hour,/h/; s/ minutes/m/; s/ minute/m/')"
    shell="$(basename ${SHELL})"
    user="$(whoami)"

    f=3 b=4
    for j in f b; do
      for i in {0..7}; do
        printf -v $j$i %b "\e[${!j}${i}m"
      done
    done
    bld=$'\e[1m'
    rst=$'\e[0m'
    inv=$'\e[7m'
cat << EOF
$rst
 $f3  ▄███████▄            $f1  ▄██████▄    $f2  ▄██ $f4 Host:     ${host}
 $f3▄█████████▀▀           $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7██  $f4 OS:       ${os}
 $f3███████▀      $f6▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2███$f4    Kernel:   ${kernel}
 $f3███████▄      $f6▀▀  ▀▀   $f1████████████  $f2██████$f4 Uptime:   ${uptime}
 $f3▀█████████▄▄           $f1██▀██▀▀██▀██  $f2██▀███$f4 Shell:    ${shell}
 $f3  ▀███████▀            $f1▀   ▀  ▀   ▀  $f2▀   ▀$f4  User:     ${user}
$rst
EOF
}

pacman_fancy
exit 0
