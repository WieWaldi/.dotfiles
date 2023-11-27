---
title: cheat
section: 1
header: cheat - A generic cheat sheet
footer: Waldemar Schrooer
date: August 02, 2022
---

# NAME
cheat, a generic cheat sheet

# SYNOPSIS
**cheat**

# DESCRIPTION
**cheat** is a simple manual containing short hints about commands and shortcuts.  
This man file is not associated with any specific program

# st

**[Ctrl]-[=]**
: Zoom In.

**[Ctrl]-[-]**
: Zoom Out.

**[Ctrl]-[0]**
: Zoom Reset.

**[Shift]-[PageUp]**
: Scroll Up.

**[Shift]-[PageDown]**
: Scroll Down.

**[Ctrl]-[Shift]-I**
: Pressing  the  default  binding  [Ctrl]+[Shift]-i will popup dmenu, asking you to
enter a unicode codepoint that will be converted to a glyph and then pushed to
st.

# dwm

**Mod-Alt-[Enter]**
: Open command line interface. In this case it will be st.

**[Mod4]-[Shift]-[j]**
: Move client to stack.

**[Mod4]-[Shift]-[k]**
: Move client from stack.

**[Mod4]-[-]**
: Decrease Gap size.

**[Mod4]-[+]**
: Increase Gap size.

**[Mod4]-[Shift]-[+]**
: Sets Gap size to zero.

**[Mod4]-[Shift]-[i]**
: Increase the number of clients in master.

**[Mod4]-[Shift]-[d]**
: Decrease the numberof clients in master.

# surf

**tabbed -r 2 surf -e x google.com**
: Start tabbed surf with Google as home page.

**[Ctrl]-[g]**
: Opens the URL-bar (requires dmenu installed).

**[Ctrl]-[t]**
: Display the current TLS certificate in a popup window.

**[Ctrl]-[r]**
: Reloads the website.

**[Ctrl]-[h]**
: Change tab.

**[Ctrl]-[l]**
: Change tab.

**[Ctrl]-[Shift]-[PageUp]**
: Zoom In.

**[Ctrl]-[Shift]-[PageDown]**
: Zoom Out.

**[Ctrl]-[Shift]-[Home]**
: Zoom Reset.

**[Ctrl]-[Shift]-[r]**
: Reloads the website without using the cache.

# Vim

**[Ctrl]-[w] [R]**
: To rotate windows up/left.

**[Ctrl]-[w] [r]**
: To rotate windows down/right.

**[Ctrl]-[w] [L]**
: Move the window to the "far right"

**[Ctrl]-[w] [H]**
: Move the window to the "far left"

**[Ctrl]-[w] [J]**
: Move the window to the "very bottom"

**[Ctrl]-[w] [K]**
: Move the window to the "very top"

**[Ctrl]-[w] [X] OR [Ctrl]-[w] [Ctrl]-[X]**
: Rotates the current focused window with the closest window to the right.

**[Ctrl]-[w] [|]**
: Maximize current focused window.

**[Ctrl]-[w] [=]**
: Rearange all windows.

**[z] [R]**
: Unfold all folds

**[z] [M]**
: Fold all folds

# My Vim Mappings

**[leader] [c] [f]**
: Turn current line into figlet banner

**[leader] [c] [p]**
: Toggles paste mode

**[leader] [c] [s]**
: Toggles mySurround

**[leader] [c] [t]**
: Toggles Soft/Hard Tab

**[leader] [n]**
: NERDTreeToggle

**[leader] [c] [f]**
: Put line to figglet

**[leader] [t] [m]**
: Toggle Table Mode

**[leader] [q]**
: Close/Quit current buffer

**[leader] [Q]**
: Close/Quit current buffer (I can not recall what this is for. Probably it
will force the buffer to close even when it is not saved.

**[Ctrl]-[h]**
: :tabprevious

**[Ctrl]-[l]**
: :tabnext

**[Ctrl]-[j]**
: :bnext (Next Buffer)

**[Ctrl]-[k]**
: :bprevious (Previous Buffer)

**[F2]**
: Toggle cursor line

**[F3]**
: Toggle cursor column

**[F4]**
: Toggle Slim View (Will show concealled characters)

**[#]**
: is mapped to :s/^/# /<CR>

**["]**
: is mapped to :s/^/" /<CR>

# Vim NERDTree

**[m]**
: Filesystem Menu

**[m] [a] Filename**
: Bring up Filesystem menu, then press [a] and type in the filename.

**[m] [a] Directory**
: Bring up Filesystem menu, then press [a] and type in the name of the directory
followed by /.

# Git Workflow

This is about my Git Workflow using a master and a development branch. All
modifications are done in the development branch and then merged into the master
branch. 'No fast forward' ist the key word! More to read on the following sites.

https://nvie.com/posts/a-successful-git-branching-model/  
https://github.com/nvie/gitflow  
https://stackoverflow.com/questions/4470523/create-a-branch-in-git-from-another-branch  

**git checkout -b development master**
: First of all you have to have a 'development' branch. This will create a new
branch called 'development' branched off from the 'master' branch.

**git checkout -b newfeature development**
: When starting work on a new feature, branch off from the develop branch.
Edit files, add and commit. Then push with the -u (short for --set-upstream) option:

**git push -u origin myfeature**
: Finished features may be merged into the develop branch to definitely add them
to the upcoming release:

**git checkout development**
: Switch back to the 'development' branch.

**git merge --no-ff myfeature**
: Merge from 'myfeature' branch into 'development' branch.

**git branch -d myfeature**
: Delete not needed 'myfeature' branch.

**git push origin development**
: Push 'development' branch to remote repository.

**git push origin --delete myfeature**
: Delete not needed 'myfeature' branch at remote repository.

**git checkout master**
: Switch back to 'master' branch.

**git merge --no-ff development**
: Merge from 'development' branch into 'master' branch.

**git push origin master**
: Push 'master' branch to remote repository.

# AUTHORS
Written by Waldemar Schroeer
