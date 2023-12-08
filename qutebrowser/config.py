config.load_autoconfig(False)

config.source('qutebrowser-themes/themes/onedark.py')

c.tabs.padding = {'top': 4, 'left': 4, 'right': 4, 'bottom': 4}
c.tabs.favicons.scale = 1.5
c.fonts.tabs.selected = 'bold 10px sans_serif'
c.fonts.tabs.unselected = 'bold 10px sans_serif'
c.statusbar.show = 'in-mode'
c.auto_save.session = True
c.colors.webpage.preferred_color_scheme = 'dark'
c.editor.command = ['/Applications/kitty.app/Contents/MacOS/kitty', 'nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']

config.bind(',p', 'spawn --userscript qute-bitwarden')
config.bind(',PU', 'spawn --userscript qute-bitwarden --username-only')
config.bind(',PP', 'spawn --userscript qute-bitwarden --password-only')

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    'gitlab': 'https://gitlab.codeyellow.nl/search?search={}',
    'phab': 'https://phabricator.codeyellow.nl/search/?query={}',
}
