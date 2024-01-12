# Kitty Icon

* [I do not like the kitty icon!](https://sw.kovidgoyal.net/kitty/faq/#i-do-not-like-the-kitty-icon)
* [Replace kitty terminal icon macOS](https://www.youtube.com/watch?v=ZaYTv2eBNr8)

## Alternate icons available

* https://github.com/samholmes/whiskers
* https://github.com/igrmk/whiskers
* https://github.com/k0nserv/kitty-icon
* https://github.com/DinkDonk/kitty-icon
* https://github.com/hristost/kitty-alternative-icon

On macOS and X11 you can put `kitty.app.icns` (macOS only) or `kitty.app.png` in the
[kitty configuration directory](https://sw.kovidgoyal.net/kitty/conf/#confloc),
and this icon will be applied automatically at startup.
On X11, this will set the icon for kitty windows.

Unfortunately, on macOS, Apple's Dock does not change its cached icon so the custom icon will
revert when kitty is quit. Run the following to force the Dock to update its cached icons:

```sh
rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock
```

If you prefer not to keep a custom icon in the kitty config folder, on macOS, you can also set it
with the following command:

```sh
# Set kitty.icns as the icon for currently running kitty
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("OK")' kitty.icns

# Set the icon for app bundle specified by the path
kitty +runpy 'from kitty.fast_data_types import cocoa_set_app_icon; import sys; cocoa_set_app_icon(*sys.argv[1:]); print("OK")' /path/to/icon.png /Applications/kitty.app
```
