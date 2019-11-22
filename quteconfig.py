import os

c.downloads.location.directory = "~/Downloads/"

c.tabs.position = "left"
c.tabs.width = '10%'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 1500
#c.scrolling.smooth = True
c.qt.low_end_device_mode = "never"

c.completion.shrink = True
c.content.pdfjs = True

c.qt.args += ' /usr/lib/qt/plugins/ppapi/libwidevinecdm.so'
c.qt.process_model = 'process-per-site-instance'

bindings = {
    "<Ctrl+Tab>": "tab-next",
    "<Ctrl+Shift+Tab>": "tab-prev",
    "<F1>": "spawn mpv {url} --gpu-api=vulkan --gpu-context=waylandvk --ytdl --ytdl-raw-options=yes-playlist= --force-window",

    # In case the page grabs our arrow keys
    "<Alt+j>": "scroll-px 0 50",
    "<Alt+k>": "scroll-px 0 -50",

    # for half pages
    "<Alt+Shift+j>": "scroll-px 0 300",
    "<Alt+Shift+k>": "scroll-px 0 -300",

    
    "J": "scroll-px 0 600",
    "K": "scroll-px 0 -600",
}

delBindings = [
        "J", "K"
]


for binding in delBindings:
    config.unbind(binding)

for key, bind in bindings.items():
    config.bind(key, bind)


# THEME
config.source(os.environ['RICE'] + '/themes/nord-qutebrowser.py')

# Use a different color for work container to give visual distinction
if "QUTE_CONTAINER" not in os.environ or os.environ['QUTE_CONTAINER'] == "facebook":
    c.colors.tabs.selected.even.bg = "#B48EAD"
elif os.environ['QUTE_CONTAINER'] == "work":
    c.colors.tabs.selected.even.bg = "#d08770" # nord12
elif os.environ['QUTE_CONTAINER'] == "private":
    c.colors.tabs.selected.even.bg = "#FF00FF" # Doesn't keep with the color scheme on purpose

c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
