#!/usr/bin/env zsh
#
# +----------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/02-dirs.zsh                                              |
# +----------------------------------------------------------------------------+
# | Copyright © 2021 Waldemar Schroeer                                         |
# |                  waldemar.schroeer(at)rz-amper.de                          |
# |                                                                            |
# +----------------------------------------------------------------------------+

# Named directories
# Create shortcuts for your favorite directories.
# `hash -d <name>=<path>` makes ~<name> a shortcut for <path>.
# You can use this ~name anywhere you would specify a dir, not just with `cd`!
hash -d z=$ZDOTDIR
hash -d g=$gitdir
hash -d r=~/Repos/WieWaldi
#
# Change dirs without `cd`. Just type the dir and press enter.
# Note: This will misfire if there is an alias, function, builtin or command
# with the same name!
# To be safe, use autocd only with paths starting with ~ (including named
# directories), .. or /
setopt AUTO_CD
