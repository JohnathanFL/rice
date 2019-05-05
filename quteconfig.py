import os

c.tabs.position = "left"
c.tabs.width = '10%'
c.tabs.show = 'always'
c.tabs.show_switching_delay = 1500
#c.scrolling.smooth = True
c.qt.low_end_device_mode = "never"

c.completion.shrink = True
c.content.pdfjs = True

c.qt.args += ' /usr/lib/qt/plugins/ppapi/libwidevinecdm.so'


bindings = {
    "<Ctrl+Tab>": "tab-next",
    "<Ctrl+Shift+Tab>": "tab-prev",
}

delBindings = [
        "j", "k", "h", "l", "J", "K"

]


for binding in delBindings:
    config.unbind(binding)

for key, bind in bindings.items():
    config.bind(key, bind)


# THEME
config.source(os.environ['RICE'] + '/nord-qutebrowser.py')
