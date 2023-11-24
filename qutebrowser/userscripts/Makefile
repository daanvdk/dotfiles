.venv/INSTALLED: .venv/bin/pip requirements.txt
	.venv/bin/pip install -Ur requirements.txt
	.venv/bin/pip freeze > .venv/INSTALLED

.venv/bin/pip:
	python3 -m venv .venv
	echo "*" > .venv/.gitignore
