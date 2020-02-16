mon = {
  'black': '#272822',
  'white': '#f8f8f2',
  'grey': '#74715e',
  'red': '#F92672',
  'blue': '#66D9EF',
  'green': '#A6E22E',
  'orange': '#FD971F',
  'purple': '#ae81ff',
  'yellow': '#e6db74',
}

## Background color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.bg = mon['red']

## Bottom border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.bottom = mon['black']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.category.border.top = mon['black']

## Foreground color of completion widget category headers.
## Type: QtColor
c.colors.completion.category.fg = mon['white']

## Background color of the completion widget for even rows.
## Type: QssColor
c.colors.completion.even.bg = mon['black']

## Background color of the completion widget for odd rows.
## Type: QssColor
c.colors.completion.odd.bg = mon['black']

## Text color of the completion widget.
## Type: QtColor
c.colors.completion.fg = mon['white']

## Background color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.bg = mon['purple']

## Bottom border color of the selected completion item.
## Type: QssColor
c.colors.completion.item.selected.border.bottom = mon['purple']

## Top border color of the completion widget category headers.
## Type: QssColor
c.colors.completion.item.selected.border.top = mon['purple']

## Foreground color of the selected completion item.
## Type: QtColor
c.colors.completion.item.selected.fg = mon['white']

## Foreground color of the matched text in the completion.
## Type: QssColor
c.colors.completion.match.fg = mon['red']

## Color of the scrollbar in completion view
## Type: QssColor
c.colors.completion.scrollbar.bg = mon['black']

## Color of the scrollbar handle in completion view.
## Type: QssColor
c.colors.completion.scrollbar.fg = mon['red']

## Background color for the download bar.
## Type: QssColor
c.colors.downloads.bar.bg = mon['black']

## Background color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.bg = mon['grey']

## Foreground color for downloads with errors.
## Type: QtColor
c.colors.downloads.error.fg = mon['red']

## Color gradient stop for download backgrounds.
## Type: QtColor
c.colors.downloads.stop.bg = mon['black']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.downloads.system.bg = 'none'

## Background color for hints. Note that you can use a `rgba(...)` value
## for transparency.
## Type: QssColor
c.colors.hints.bg = mon['red']

## Font color for hints.
## Type: QssColor
c.colors.hints.fg = mon['white']

## Font color for the matched part of hints.
## Type: QssColor
c.colors.hints.match.fg = mon['red']

## Background color of the keyhint widget.
## Type: QssColor
c.colors.keyhint.bg = mon['yellow']

## Text color for the keyhint widget.
## Type: QssColor
c.colors.keyhint.fg = mon['white']

## Highlight color for keys to complete the current keychain.
## Type: QssColor
c.colors.keyhint.suffix.fg = mon['white']

## Background color of an error message.
## Type: QssColor
c.colors.messages.error.bg = mon['red']

## Border color of an error message.
## Type: QssColor
c.colors.messages.error.border = mon['red']

## Foreground color of an error message.
## Type: QssColor
c.colors.messages.error.fg = mon['white']

## Background color of an info message.
## Type: QssColor
c.colors.messages.info.bg = mon['grey']

## Border color of an info message.
## Type: QssColor
c.colors.messages.info.border = mon['white']

## Foreground color an info message.
## Type: QssColor
c.colors.messages.info.fg = mon['white']

## Background color of a warning message.
## Type: QssColor
c.colors.messages.warning.bg = mon['purple']

## Border color of a warning message.
## Type: QssColor
c.colors.messages.warning.border = mon['purple']

## Foreground color a warning message.
## Type: QssColor
c.colors.messages.warning.fg = mon['white']

## Background color for prompts.
## Type: QssColor
c.colors.prompts.bg = mon['black']

# ## Border used around UI elements in prompts.
# ## Type: String
c.colors.prompts.border = '1px solid ' + mon['grey']

## Foreground color for prompts.
## Type: QssColor
c.colors.prompts.fg = mon['white']

## Background color for the selected item in filename prompts.
## Type: QssColor
c.colors.prompts.selected.bg = mon['purple']

## Background color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.bg = mon['black']

## Foreground color of the statusbar in command mode.
## Type: QssColor
c.colors.statusbar.command.fg = mon['white']

## Background color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.bg = mon['black']

## Foreground color of the statusbar in private browsing + command mode.
## Type: QssColor
c.colors.statusbar.command.private.fg = mon['white']

## Background color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.bg = mon['green']

## Foreground color of the statusbar in insert mode.
## Type: QssColor
c.colors.statusbar.insert.fg = mon['black']

## Background color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.bg = mon['black']

## Foreground color of the statusbar.
## Type: QssColor
c.colors.statusbar.normal.fg = mon['white']

## Background color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.bg = mon['blue']

## Foreground color of the statusbar in passthrough mode.
## Type: QssColor
c.colors.statusbar.passthrough.fg = mon['white']

## Background color of the progress bar.
## Type: QssColor
c.colors.statusbar.progress.bg = mon['black']

## Foreground color of the URL in the statusbar on error.
## Type: QssColor
c.colors.statusbar.url.error.fg = mon['red']

## Default foreground color of the URL in the statusbar.
## Type: QssColor
c.colors.statusbar.url.fg = mon['white']

## Foreground color of the URL in the statusbar for hovered links.
## Type: QssColor
c.colors.statusbar.url.hover.fg = mon['green']

## Foreground color of the URL in the statusbar on successful load
## (http).
## Type: QssColor
c.colors.statusbar.url.success.http.fg = mon['white']

## Foreground color of the URL in the statusbar on successful load
## (https).
## Type: QssColor
c.colors.statusbar.url.success.https.fg = mon['white']

## Foreground color of the URL in the statusbar when there's a warning.
## Type: QssColor
c.colors.statusbar.url.warn.fg = mon['red']

## Background color of the tab bar.
## Type: QtColor
c.colors.tabs.bar.bg = mon['black']

## Background color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.bg = mon['black']

## Foreground color of unselected even tabs.
## Type: QtColor
c.colors.tabs.even.fg = mon['white']

## Color for the tab indicator on errors.
## Type: QtColor
c.colors.tabs.indicator.error = mon['red']

## Color gradient start for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.start = mon['violet']

## Color gradient end for the tab indicator.
## Type: QtColor
# c.colors.tabs.indicator.stop = mon['orange']

## Color gradient interpolation system for the tab indicator.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
c.colors.tabs.indicator.system = 'none'

## Background color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.bg = mon['black']

## Foreground color of unselected odd tabs.
## Type: QtColor
c.colors.tabs.odd.fg = mon['white']

# ## Background color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.bg = mon['purple']

# ## Foreground color of selected even tabs.
# ## Type: QtColor
c.colors.tabs.selected.even.fg = mon['white']

# ## Background color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg 

# ## Foreground color of selected odd tabs.
# ## Type: QtColor
c.colors.tabs.selected.odd.fg = mon['white']

## Background color for webpages if unset (or empty to use the theme's
## color)
## Type: QtColor
# c.colors.webpage.bg = 'white'
