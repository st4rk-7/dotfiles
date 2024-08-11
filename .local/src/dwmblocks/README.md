<h1 align="center"> dwmblocks</h1>

Lightweight, Clickable, Modular and Async status bar for [dwm](https://dwm.suckless.org). Fork of [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async)

### Modifying the blocks

You can define your status bar blocks in `config.h`:

```c
#define BLOCKS(X) \
    ...
    X(" ", "wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d' ' -f2", 0, 5) \
    X("󰥔 ", "date '+%H:%M:%S'", 1, 1) \
    ...
```

Each block has the following properties:

| Property        | Description                                                                                                                                        |
| --------------- | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| Icon            | An icon you wish to prepend to your block output.                                                                                                  |
| Command         | The command you wish to execute in your block.                                                                                                     |
| Update interval | Time in seconds, after which you want the block to update. If `0`, the block will never be updated.                                                |
| Update signal   | Signal to be used for triggering the block. Must be a positive integer. If `0`, a signal won't be set up for the block and it will be unclickable. |
