This sxiv (now un)stable version 26 (1d28627, 2020-01-16) side project has a different take on sxiv
patching. It uses preprocessor directives to decide whether or not to include a patch during build
time. Essentially this means that this build, for better or worse, contains both the patched _and_
the original code. The aim being that you can select which patches to include and the build will
contain that code and nothing more.

For example to include the `image-mode-cycle` patch then you would only need to flip this setting
from 0 to 1 in [patches.h](https://github.com/bakkeby/sxiv-flexipatch/blob/master/patches.def.h):
```c
#define IMAGE_MODE_CYCLE_PATCH 1
```

So if you have ever been curious about trying out sxiv patches then this may be a good starting
point. Once you have found out what works for you and what doesn't then you should be in a better
position to choose patches should you want to start patching from scratch.

Refer to [https://github.com/muennich/sxiv](https://github.com/muennich/sxiv) for the original
version and further details on sxiv, how to install it and how it works.

---

### Changelog:

2021-09-07 - Added the fifo patch

2021-06-11 - Added the alpha patch

2021-06-10 - Added the "allow escape key in external key handler" patch (for the lack of a better
             name), dmenu-like behaviour, the navigate if not scroll, the start from file, the
             set title and separate bar colors patches

2021-06-09 - Added the marks count, marks border, window title and swap bar colors patches

2021-06-08 - Added the thumb paddings and the libcurl patches

2021-05-25 - Added fill scale mode

2021-04-12 - Added animated WebP support

2021-04-09 - Added svg image support, WM hints and \_NET\_WM\_PID and WM\_CLIENT\_MACHINE EWMH
             properties

2021-04-08 - Added image-mode-cycle, square-thumbnails and window-fit-image patches

### Patches included:

   - [allow-escape-key-in-external-key-handler](https://github.com/muennich/sxiv/pull/428)
      - this patch removes redundant handling of the escape key allowing it to be used for other
        things such as exiting the external key handler with no output
      - optionally this patch allows multiple inputs to be sent to the external key handler until
        it returns with an exit status of 1

   - [alpha](https://github.com/jaredforrest/sxiv/commit/49bb193074f92ebe05f165c091256e9f07c56e5f)
      - the alpha patch allows sxiv to be embedded into applications that expects it, e.g.
        tabbed with alpha patch applied

   - [dmenu-like-behaviour](https://github.com/muennich/sxiv/pull/405)
      - adds dmenu-like behaviour for sxiv such that selecting an image and pressing enter will
        exit sxiv and output the path to the currently selected file to standard out

   - [ewmh-net-wm-pid](https://github.com/muennich/sxiv/pull/403)
      - sets the \_NET\_WM\_PID X property

   - [ewmh-wm-client-machine](https://github.com/muennich/sxiv/pull/403)
      - sets the WM_CLIENT_MACHINE X property

   - [fifo](https://github.com/muennich/sxiv/pull/369)
      - adds support for pipe-based redirection for sxiv

   - [image-mode-cycle](https://github.com/i-tsvetkov/sxiv-patches)
      - adds the ability to cycle when viewing multiple images

   - [libcurl](https://github.com/explosion-mental/sxiv/blob/main/patches/libcurl.patch)
      - add support for remote links with libcurl

   - [marks-border](https://github.com/muennich/sxiv/issues/294)
      - shows marked files with a separate colored border in the thumbnail view

   - [marks-count](https://github.com/muennich/sxiv/issues/294)
      - shows the number of marked files in the thumbnail view

   - [navigate-if-not-scroll](https://github.com/muennich/sxiv/pull/368)
      - allows for the same keys used to scroll to be re-used for navigation if the image is not
        zoomed

   - [scale-mode-fill](https://github.com/muennich/sxiv/pull/446)
      - adds fill scale mode

   - [separate-bar-colors](https://github.com/muennich/sxiv/pull/386)
      - adds the option of having separate colors for the bar in thumbnail view

   - [set-title](https://github.com/muennich/sxiv/pull/427)
      - allows the window title to be set via a command line flag during runtime

   - [start-from-file](https://github.com/muennich/sxiv/pull/371)
      - similar to the `-n` command line option, `-F` starts from a file instead of its index

   - [square-thumbnails](https://github.com/i-tsvetkov/sxiv-patches)
      - makes thumbnails square

   - [svg-image-support](https://github.com/muennich/sxiv/pull/440)
      - adds support for the SVG image format

   - [swap-bar-colors](https://github.com/muennich/sxiv/pull/392)
      - swaps the foreground and background colors of the bar

   - [thumb-paddings](https://github.com/explosion-mental/sxiv/blob/main/patches/thumb_paddings.patch)
      - adds some control over the padding between thumbnails

   - [webp-image-support](https://github.com/muennich/sxiv/pull/437)
      - adds support for animated WebP images

   - [window-fit-image](https://github.com/i-tsvetkov/sxiv-patches)
      - makes the window size fit the image when displaying a single image

   - [window-title](https://github.com/muennich/sxiv/pull/453)
      - adds the name or path of the currently viewed file to the window title

   - [wm-hints](https://github.com/muennich/sxiv/pull/406)
      - without this there is the potential for some window managers assuming that sxiv does not
        require focus
