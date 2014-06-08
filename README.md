emacs-color-theme-choco
=======================

Emacs color theme converted from the TextMate theme created by [Ludvig Widman](http://www.ludw.se/blog/).

## Installation Instructions

1. Download and install the color-theme emacs package either via your linux distribution or [via the source tarball](http://www.nongnu.org/color-theme/#sec5)
2. Download and install color-theme-choco.el from [github](http://github.com/imtayadeway/emacs-color-theme-choco/raw/master/color-theme-choco.el)
3. Make sure that both color-theme.el and color-theme-choco.el are in your load path

Then, somewhere in your `.emacs.d`:

```elisp
(add-to-list 'load-path "~/.emacs.d/themes/choco")
(require 'color-theme)
(require 'color-theme-choco)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-choco)))
```
## Contributing

Contributions are welcome.
