<h1 align="center"> st</h1>

Personal build of st generated using [st-flexipatch](https://github.com/bakkeby/st-flexipatch.git)

### Patches applied:

- [alpha](https://st.suckless.org/patches/alpha/)

  - adds transparency for the terminal

- [blinking-cursor](https://st.suckless.org/patches/blinking_cursor/)

  - allows the use of a blinking cursor

- [bold-is-not-bright](https://st.suckless.org/patches/bold-is-not-bright/)

  - by default bold text is rendered with a bold font in the bright variant of the current color
  - this patch makes bold text rendered simply as bold, leaving the color unaffected

- [boxdraw](https://st.suckless.org/patches/boxdraw/)

  - adds dustom rendering of lines/blocks/braille characters for gapless alignment

- [clipboard](https://st.suckless.org/patches/clipboard/)

  - by default st only sets PRIMARY on selection

- [csi_23_23](https://st.suckless.org/patches/csi_22_23/)

  - adds support for CSI escape sequences 22 and 23, which save and restores the window title
    (for instance nvim does this when opening and closing)

- [drag-n-drop](https://st.suckless.org/patches/drag-n-drop)

  - allows dragging a file into the terminal and have the path printed

- [externalpipe](https://st.suckless.org/patches/externalpipe/)

  - this patch allows for reading and writing st's screen through a pipe, e.g. to pass info to dmenu

- [font2](https://st.suckless.org/patches/font2/)

  - allows you to add a spare font besides the default

- [hidecursor](https://st.suckless.org/patches/hidecursor/)

  - hides the X cursor whenever a key is pressed and show it back when the mouse is moved in the terminal window

- [hide-terminal-cursor](https://www.reddit.com/r/suckless/comments/nvee8h/how_to_hide_cursor_in_st_is_there_a_patch_for_it/)

  - hides the terminal cursor when the window loses focus (as opposed to showing a hollow cursor)

- [invert](https://st.suckless.org/patches/invert/)

  - adds a keybinding that lets you invert the current colorscheme of st
  - this provides a simple way to temporarily switch to a light colorscheme if you use a dark colorscheme or visa-versa

- [iso14755](https://st.suckless.org/patches/iso14755/)

  - pressing the default binding Ctrl+Shift-i will popup dmenu, asking you to enter a unicode codepoint that will be converted to a glyph and then pushed to st

- [keyboard-select](https://st.suckless.org/patches/keyboard_select/)

  - allows you to select text on the terminal using keyboard shortcuts

- [ligatures](https://st.suckless.org/patches/ligatures/)

  - adds support for drawing ligatures using the Harfbuzz library to transform original text of a single line to a list of glyphs with ligatures included

- [monochrome](https://www.reddit.com/r/suckless/comments/ixbx6z/how_to_use_black_and_white_only_for_st/)

  - makes st ignore terminal color attributes to make for a monochrome look

- [newterm](https://st.suckless.org/patches/newterm/)

  - allows you to spawn a new st terminal using Ctrl-Shift-Return
  - it will have the same CWD (current working directory) as the original st instance

- reflow

  - allows st to be resized without cutting off text when the terminal window is made larger again
  - text wraps when the terminal window is made smaller

- [right-click-to-plumb](https://st.suckless.org/patches/right_click_to_plumb/)

  - allows you to right-click on some selected text to send it to the plumbing program of choice

- [scrollback](https://st.suckless.org/patches/scrollback/)

  - allows you scroll back through terminal output using keyboard shortcuts or mousewheel

- scrollback-mouse-altscreen

  - Scroll back through terminal output using mouse wheel (when not in MODE_ALTSCREEN). This variant depends on SCROLLBACK_PATCH being enabled.

- sixel

  - this patch adds SIXEL graphics support

- [swapmouse](https://st.suckless.org/patches/swapmouse/)

  - changes the mouse shape to the global default when the running program subscribes for mouse
    events, for instance, in programs like ranger and fzf
  - it emulates the behaviour shown by vte terminals like termite

- [use-XftFontMatch](https://git.suckless.org/st/commit/528241aa3835e2f1f052abeeaf891737712955a0.html)

  - use XftFontMatch in place of FcFontMatch to allow font to scale with Xft.dpi resource
    setting

- [vertcenter](https://st.suckless.org/patches/vertcenter/)

  - vertically center lines in the space available if you have set a larger chscale in config.h

- [wide-glyphs](https://www.reddit.com/r/suckless/comments/jt90ai/update_support_for_proper_glyph_rendering_in_st/)

  - adds proper support for wide glyphs, as opposed to rendering smaller or cut glyphs

- [workingdir](https://st.suckless.org/patches/workingdir/)

  - allows user to specify the initial path st should use as the working directory

- [xresources](https://st.suckless.org/patches/xresources/)

  - adds the ability to configure st via Xresources
  - during startup, st will read and apply the resources named in the resources[] array in config.h

- xresources-reload
  - reload the Xresources config when a SIGUSR1 signal is received e.g. `killall -USR1 st`

## Additions

- Scripts that use externalpipe patch for handling urls and copying of outputs. -
  - st-urlhandler
  - st-copyout
