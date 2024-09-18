<h1 align="center"> dmenu</h1>

Personal build of dmenu generated using [dmenu-flexipatch](https://github.com/bakkeby/dmenu-flexipatch.git)

### Patches applied:

   - [border](http://tools.suckless.org/dmenu/patches/border/)
      - adds a border around the dmenu window

   - [center](https://tools.suckless.org/dmenu/patches/center/)
      - this patch centers dmenu in the middle of the screen

   - cntrl_v_to_paste
      - enable the use of Ctrl+v (XA_PRIMARY) and Ctrl+Shift+v (CLIPBOARD) to paste.

   - [fuzzymatch](https://tools.suckless.org/dmenu/patches/fuzzymatch/)
      - adds support for fuzzy-matching to dmenu, allowing users to type non-consecutive portions
        of the string to be matched

   - [fzfexpect](https://github.com/DAFF0D11/dafmenu/blob/master/patches/dmenu-fzfexpect-5.1.diff)
      - adds fzf expect functionality in dmenu

   - [grid](https://tools.suckless.org/dmenu/patches/grid/)
      - allows dmenu's entries to be rendered in a grid by adding a new `-g` flag to specify the
        number of grid columns
      - the `-g` and `-l` options can be used together to create a G columns * L lines grid

   - [gridnav](https://tools.suckless.org/dmenu/patches/gridnav/)
      - adds the ability to move left and right through a grid (when using the grid patch)

   - [instant](https://tools.suckless.org/dmenu/patches/instant/)
      - adds a flag that will cause dmenu to select an item immediately if there is only one
        matching option left

   - [line-height](http://tools.suckless.org/dmenu/patches/line-height/)
      - adds a `-h` option which sets the minimum height of a dmenu line
      - this helps integrate dmenu with other UI elements that require a particular vertical size

   - [mouse-support](https://tools.suckless.org/dmenu/patches/mouse-support/)
      - adds basic mouse support for dmenu

   - [motion-support](https://tools.suckless.org/dmenu/patches/mouse-support/)
      - Expands the above to support mouse hovering.

   - [password](https://tools.suckless.org/dmenu/patches/password/)
      - with this patch dmenu will not directly display the keyboard input, but instead replace it
        with dots
      - all data from stdin will be ignored

   - [scroll](https://tools.suckless.org/dmenu/patches/scroll/)
      - this patch adds support for text scrolling
      - it doesn't append `...` for long input anymore as it can handle long text

   - [tsv](https://tools.suckless.org/dmenu/patches/tsv/)
      - makes dmenu split input lines at first tab character and only display first part, but it
        will perform matching on and output full lines as usual
      - can be useful if you want to separate data and representation

   - [vertfull](https://tools.suckless.org/dmenu/patches/vertfull/)
      - prevents dmenu from indenting items at the same level as the prompt length

   - [xresources](https://tools.suckless.org/dmenu/patches/xresources/)
      - allows dmenu to read font and colors from Xresources
      - note that with this patch the Xresources settings takes precedence over command line arguments

   - [xyw](https://tools.suckless.org/dmenu/patches/xyw/)
      - adds options for specifying dmenu window position and width
