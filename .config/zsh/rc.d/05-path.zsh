#!/usr/bin/env zsh
#
# +-------------------------------------------------------------------------+
# | ~/config/zsh/rc.d/05-path.zsh                                           |
# +-------------------------------------------------------------------------+
# | Copyright © 2022 Waldemar Schroeer                                      |
# |                  waldemar.schroeer(at)rz-amper.de                       |
# |                                                                         |
# +-------------------------------------------------------------------------+

# -U ensures each entry in these is Unique (that is, discards duplicates).
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair; see below.

# $PATH and $path (and also $FPATH and $fpath, etc.) are "tied" to each other.
# Modifying one will also modify the other.
# Note that each value in an array is expanded separately. Thus, we can use ~
# for $HOME in each $path entry.
path=(
    $path
    ~/.local/bin
)

# Add your functions to your $fpath, so you can autoload them.
fpath=(
    $ZDOTDIR/functions
    $fpath
)
