init:
	python3 -m venv .venv
	. .venv/bin/activate
	sudo chmod u+x "$(CURDIR)/main.py"
uninit:
	rm -rf .venv
active:
	@$(shell . "$(CURDIR)/.venv/bin/activate")
deactive:
	deactivate
install:
	pip3 install rich textual beaupy click pyautogui
run:
	python3 main.py
help:
	@echo "Usage: make <target>"
	@echo " | 'make run'        - execute main.py file"
	@echo " | 'make init'       - initial virtualenv"
	@echo " | 'make uninit'     - remove venv directory"
	@echo " | 'make active'     - activate virtualenv"
	@echo " | 'make deactive'   - deactivate virtualenv"
	@echo " | 'make install'    - install dependencies"
	@echo " | 'make help'       - display help and usage message"
