CAIRO_PATH = ${HOME}/Bin/cairo
lS_PATH = ${CAIRO_PATH}/target/release/cairo-language-server

build: FORCE
	scarb build

clean: FORCE
	scarb clean

fmt: FORCE
	scarb fmt

test: FORCE
	cairo-test -p .

language-server: FORCE
	@if which ${lS_PATH} > /dev/null; then \
		echo "Cairo1: Language Server Path: ${lS_PATH}"; \
	else \
		cd ${CAIRO_PATH} && cargo build --bin cairo-language-server --release; \
	fi
FORCE:
