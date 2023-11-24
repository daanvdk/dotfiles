config.load_autoconfig(False)

config.source('qutebrowser-themes/themes/onedark.py')

c.tabs.show = 'multiple'
c.tabs.padding = {'top': 4, 'left': 4, 'right': 4, 'bottom': 4}
c.tabs.favicons.scale = 1.5
c.fonts.tabs.selected = 'bold 10px sans_serif'
c.fonts.tabs.unselected = 'bold 10px sans_serif'
c.statusbar.show = 'in-mode'
c.auto_save.session = True

config.bind(',p', 'spawn --userscript qute-bitwarden')
config.bind(',PU', 'spawn --userscript qute-bitwarden --username-only')
config.bind(',PP', 'spawn --userscript qute-bitwarden --password-only')

config.bind(',d', 'devtools')

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
}
