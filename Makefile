SHELL=/bin/zsh

setup: .symlinks .brew_bundle .uv_tools .python-path

.symlinks: symlinks.txt
	while read -A args; do \
		source="$$(realpath $${args[1]})"; \
		target="$$(eval echo $${args[2]})"; \
		mkdir -p "$$(dirname $$target)"; \
		ln -hfs $$source $$target; \
	done <symlinks.txt
	touch .symlinks

.brew_bundle: Brewfile
	which brew > /dev/null || /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew bundle install
	touch .brew_bundle

.uv_tools: uv_tools.txt
	while read -A args; do \
		uv tool install -U $${args[@]}; \
	done <uv_tools.txt
	touch .uv_tools

.python-path: .python-version
	uv python install $(shell cat .python-version)
	uv python find $(shell cat .python-version) > .python-path
	ln -hfs $$(cat .python-path) $(HOME)/.local/bin/python
	ln -hfs $$(cat .python-path) $(HOME)/.local/bin/python3
