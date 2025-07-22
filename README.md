# Dotfiles
My dotfiles for a macOS based setup.

## Setup
Simply run `make`, this will do the following things:
- Setup symlinks to all the config files in this project in the appropriate
  locations.
- Install homebrew if not yet installed.
- Install homebrew packages if needed.
- Install uv tools if needed.

If any changes are made to either `symlinks.txt`, `Brewfile` or `uv_tools.txt`
it is safe to rerun `make` to apply these changes.
