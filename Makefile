LS_RELATIVE_PATH = ./cairo/bin/cairo-language-server

build: FORCE
	scarb build

clean: FORCE
	scarb clean

fmt: FORCE
	scarb fmt

test: FORCE
	cairo-test -p .

language-server: FORCE
	@echo "Downloading latest release..."
	@curl -s https://api.github.com/repos/starkware-libs/cairo/releases/latest \
	| grep "browser_download_url.*gz" \
	| cut -d : -f 2,3 \
	| tr -d \" \
	| wget -O - -qi - \
	| tar -xf -
	@echo "Moving corelib to project's root directory..."
	@rm -rf corelib && mv cairo/corelib .
	@if which ${LS_RELATIVE_PATH} > /dev/null; then \
		echo "Cairo1: Language Server Path: $$(realpath ${LS_RELATIVE_PATH})"; \
	else \
		echo "The binary does not exist"; \
	fi
FORCE:
