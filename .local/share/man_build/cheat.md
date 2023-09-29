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
this man file is not associated with any specific program

# DESCRIPTION
cheat sheet is a simple manual containing short hints about commands and shortcuts.

# st

**Ctrl-[=]**
: Zoom In.

**Ctrl-[-]**
: Zoom Out.

**Ctrl-[0]**
: Zoom Reset.

**Shift-[PageUp]**
: Scroll Up.

**Shift-[PageDown]**
: Scroll Down.

**Ctrl-Shift-I**
: Pressing  the  default  binding  Ctrl+Shift-i will popup dmenu, asking you to
enter a unicode codepoint that will be converted to a glyph and then pushed to
st.

# dwm

**Mod-Alt-[Enter]**
: Open command line interface. In this case it will be st.

**Alt-Shift-[j]**
: Move client to stack.

**Alt-Shift-[k]**
: Move client from stack.

**Alt-[-]**
: Decrease Gap size.

**Alt-[+]**
: Increase Gap size.

**Alt-Shift-[+]**
: Sets Gap size to zero.

**Alt-Shift-[i]**
: Increase the number of clients in master.

**Alt-Shift-[d]**
: Decrease the numberof clients in master.

# surf

**tabbed -r 2 surf -e x google.com**
: Start tabbed surf with Google as home page.

**Ctrl-[g]**
: Opens the URL-bar (requires dmenu installed).

**Ctrl-[t]**
: Display the current TLS certificate in a popup window.

**Ctrl-[r]**
: Reloads the website.

**Ctrl-[h]**
: Change tab.

**Ctrl-[l]**
: Change tab.

**Ctrl-Shift-[PageUp]**
: Zoom In.

**Ctrl-Shift-[PageDown]**
: Zoom Out.

**Ctrl-Shift-[Home]**
: Zoom Reset.

**Ctrl-Shift-[r]**
: Reloads the website without using the cache.

# Vim

**Ctrl-[w] [R]**
: To rotate windows up/left.

**Ctrl-[w] [r]**
: To rotate windows down/right.

**Ctrl-[w] [L]**
: Move the window to the "far right"

**Ctrl-[w] [H]**
: Move the window to the "far left"

**Ctrl-[w] [J]**
: Move the window to the "very bottom"

**Ctrl-[w] [K]**
: Move the window to the "very top"

**Ctrl-[w] [X] OR Ctrl-[w] Ctrl-[X]**
: Rotates the current focused window with the closest window to the right.

**Ctrl-[w] [|]**
: Maximize current focused window.

**Ctrl-[w] [=]**
: Rearange all windows.

# My Vim Mappings

**<leader> [c] [p]**
: Toggles paste mode

**<leader> [c] [s]**
: Toggles mySurround

**<leader> [c] [t]**
: Toggles Soft/Hard Tab

**<leader> [n]**
: NERDTreeToggle

**<leader> [c] [f]**
: Put line to figglet

**<leader> [t] [m]**
: Toggle Table Mode

**Ctrl-[h]**
: :tabprevious

**Ctrl-[l]**
: :tabnext

**[F2]**
: Toggle cursor line

**[F3]**
: Toggle cursor column

**[F4]**
: Slim View

**[#]**
: is mapped to :s/^/# /<CR>

**["]**
: is mapped to :s/^/" /<CR>
