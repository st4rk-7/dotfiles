<h1 align="center"> slock</h1>
=======
Personal build of slock generated using [slock-flexipatch](https://github.com/bakkeby/slock-flexipatch.git)

### Patches applied:

   - [blur_pixelated_screen](https://tools.suckless.org/slock/patches/blur-pixelated-screen/)
      - sets the lockscreen picture to a blured or pixelated screenshot

   - [control-clear](https://tools.suckless.org/slock/patches/control-clear/)
      - with this patch slock will no longer change to the failure color if a control key is pressed
        while the buffer is empty
      - this may be useful if, for example, you wake your monitor up by pressing a control key and
        don't want to spoil the detection of failed unlocking attempts

   - [dpms](https://tools.suckless.org/slock/patches/dpms/)
      - interacts with the Display Power Signaling and automatically shuts down the monitor after a
        configurable amount of seconds
      - the monitor will automatically be activated by pressing a key or moving the mouse and the
        password can be entered then

   - [dwmlogo](https://tools.suckless.org/slock/patches/dwmlogo/)
      - draws the dwm logo which changes color based on the state

   - [mediakeys](https://tools.suckless.org/slock/patches/mediakeys/)
      - allows media keys to be used while the screen is locked, e.g. adjust volume or skip to the
        next song without having to unlock the screen first

   - [xresources](https://tools.suckless.org/slock/patches/xresources/)
      - this patch adds the ability to get colors via Xresources
