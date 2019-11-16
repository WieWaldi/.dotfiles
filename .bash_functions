#!/usr/bin/env bash
#
# +-------------------------------------------------------------------------+
# | .bash_functions                                                         |
# +-------------------------------------------------------------------------+
# | Copyright © 2019 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# +-------------------------------------------------------------------------+

function prompt_command_fancy() {
    local exitcode="$?"
    local split=4
    local workingdir=" $(/bin/pwd | /bin/sed 's@'"$HOME"'@~@')"
    local git=$(/bin/git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')

    if [[ ${exitcode} -eq 0 ]]; then
        local exitsymbol=" "
    else
        local exitsymbol=" "
    fi

    if [[ $(/bin/id -u) = 0 ]]; then
        local usersymbol=" "
    else
        local usersymbol=" "
    fi

    W=${workingdir}
    if [[ $(echo ${W} | /bin/grep -o '/' | /bin/wc -l) -gt ${split} ]]; then
        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
    fi

    PS1="\[\e[38;5;255;48;5;53m\]${usersymbol}\u@\h\[\e[38;5;53;48;5;91m\]\[\e[38;5;255;48;5;91m\]${workingdir}${git}\[\e[38;5;91;48;5;140m\]\[\e[38;5;256;48;5;140m\] \A${exitsymbol}\[\e[0m\[\e[38;5;140m\[\e[m\]"
    # PS1="${exitsymbol}${usersymbol} ${workingdir} ${git}"
}

function prompt_command_tiny() {
    local exitcode="$?"
    local split=2
    local workingdir="$(/bin/pwd | /bin/sed 's@'"$HOME"'@~@')"
    local git="$(/bin/git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')"
    W=${workingdir}
    if [[ $(echo ${W} | /bin/grep -o '/' | wc -l) -gt ${split} ]]; then
        workingdir=$(echo $W | cut -d'/' -f1-$split | xargs -I{} echo {}"/../${W##*/}")
    fi
    PS1="\n┌[\u@\h]──[${workingdir}${git}]──[\@]\n└────╼ "

}

function pacman_fancy() {
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
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄    
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄  $f5▄█$f7███$f5██$f7███$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f7▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██  $f5██$f7█ █$f5██$f7█ █$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f7▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████  
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀ 
$bld
 $f3  ▄███████▄                $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄    $f5  ▄██████▄    $f6  ▄██████▄    
 $f3▄█████████▀▀               $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7█ █$f2██$f7█ █$f2█▄  $f4▄█$f7█ █$f4██$f7█ █$f4█▄  $f5▄█$f7█ █$f5██$f7█ █$f5█▄  $f6▄██$f7█▀█$f6██$f7█▀█$f6▄
 $f3███████▀      $f6▄▄  ▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7███$f2██$f7███$f2██  $f4██$f7███$f4██$f7███$f4██  $f5██$f7███$f5██$f7███$f5██  $f6███$f7█▄▄$f6██$f7█▄▄$f6█
 $f3███████▄      $f6▀▀  ▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████  $f5████████████  $f6████████████  
 $f3▀█████████▄▄               $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██  $f5██▀██▀▀██▀██  $f6██▀██▀▀██▀██
 $f3  ▀███████▀                $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀  $f5▀   ▀  ▀   ▀  $f6▀   ▀  ▀   ▀ 
$rst
EOF
}

function pacman_small() {
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
 $f3  ▄███████▄            $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄
 $f3▄█████████▀▀           $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄
 $f3███████▀      $f7▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██
 $f3███████▄      $f7▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████
 $f3▀█████████▄▄           $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██
 $f3  ▀███████▀            $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀
$bld
 $f3  ▄███████▄            $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄
 $f3▄█████████▀▀           $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7█ █$f2██$f7█ █$f2█▄  $f4▄█$f7█ █$f4██$f7█ █$f4█▄
 $f3███████▀      $f6▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7███$f2██$f7███$f2██  $f4██$f7███$f4██$f7███$f4██
 $f3███████▄      $f6▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████
 $f3▀█████████▄▄           $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██
 $f3  ▀███████▀            $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀
$rst
EOF
}

function pacman_tiny() {
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
 $f3  ▄███████▄            $f1  ▄██████▄    $f2  ▄██████▄    $f4  ▄██████▄
 $f3▄█████████▀▀           $f1▄$f7█▀█$f1██$f7█▀█$f1██▄  $f2▄█$f7███$f2██$f7███$f2█▄  $f4▄█$f7███$f4██$f7███$f4█▄
 $f3███████▀      $f6▄▄  ▄▄   $f1█$f7▄▄█$f1██$f7▄▄█$f1███  $f2██$f7█ █$f2██$f7█ █$f2██  $f4██$f7█ █$f4██$f7█ █$f4██
 $f3███████▄      $f6▀▀  ▀▀   $f1████████████  $f2████████████  $f4████████████
 $f3▀█████████▄▄           $f1██▀██▀▀██▀██  $f2██▀██▀▀██▀██  $f4██▀██▀▀██▀██
 $f3  ▀███████▀            $f1▀   ▀  ▀   ▀  $f2▀   ▀  ▀   ▀  $f4▀   ▀  ▀   ▀
$rst
EOF
}

function hostfetch-tti() {
    host="$(/bin/hostname)"
    os="$(/bin/uname)"
    kernel="$(uname -sr | cut -d - -f 1)"
    uptime="$(uptime -p | sed 's/up //; s/ weeks,/w/; s/ week,/w/; s/ days,/d/; s/ day,/d/; s/ hours,/h/; s/ hour,/h/; s/ minutes/m/; s/ minute/m/')"
    shell="$(basename ${SHELL})"
    user="$(/bin/whoami)"

/bin/cat <<EOF
    .XSISzozozSIS2S2SIoIS2o2ozSzSoc.
  7MMI1X17t7tXtCt7t7t7tXtCtXtXtC1t8MM,
 vM;                                IM.
 @M    iYvcvYcYvYcYcYvcvYvYvYvYv,    M1
 #M   #@QWQW@M@WQQ0W0Q0W0W0WQW0BMt   MY
 BM  .@tnC1QI .EnCnt69S1oo8A211tEU   MC
 @M  .@nt2B9   #1ntE17zz0b1o00Xn62   MY
 BM  .#S@#7   .M#W#U  SW;    7Zt8n   MX   Host:     ${host}
 #M  .#1,      ,.io   U@      BSZz   MY   OS:       ${os}
 BM  .Mv              9Bv    vEtbS   MX   Kernel:   ${kernel}
 @M  .#A@6    .v         AEbM@CSZz   MY   Uptime:   ${uptime}
 WM  .#10o    .tY     i  iY;:;8tbn   MX   Shell:    ${shell}
 #M  .@S9z     MM.    01     .BSZz   MY   User:     ${user}
 WM  .#1bn     ##     AM,    .#1E1   M7
 @M  .Bn9o     #W     oM.    .Bo9z   MY
 BM  .#tb1    .##     U@.    .#1b1   MX
 #M  .@oZS    .MM     zM.    .Bo9o   MY
 BM  .#tA2     i.     6M.    .#1bn   M7
 @M  .@S1Et.    ,     IM.    .@S9o   M7
 BM  .#t1tE@QI6QMc           .MSbS   MX
 @M  .@StntonUz2tB1;,::v      7z8z   MY
 BM  .@1ntStStntn1bW#@t        cBz   M7
 #M  .MBAbAb6Z6Z9b6b6EE##@@@@@WQ@U   M7
 @M   ,1UoUzIzUzUz2zIoU2AU6I6IAzX    Mn
 zM                                 iM;
 MMX.                            ,IMo
  .7##@#@@@#@#@@@#@@@#@#@#@#@#@#@0Y


EOF
}

