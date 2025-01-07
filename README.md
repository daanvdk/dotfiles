# Dotfiles
My dotfiles for a macOS based setup.

## Setup
Simply run `setup.zsh`, this will do the following things:
- Setup symlinks to all the config files in this project in the appropriate
  locations.
- Install homebrew if not yet installed.
- Install homebrew packages if needed.
- Launch a new zsh shell to apply any changes.

All steps in this process are idempotent and thus to apply any changes the
`setup.zsh` script can be reused.

## Manual Setup
Not everything contained in this repo has a scriptable setup. This is a list of
the manual actions to be taken:
- In the options menu of the firefox linkhints plugin import `linkhints.json`.
