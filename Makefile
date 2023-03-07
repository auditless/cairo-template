build: FORCE
	scarb build

sierra: FORCE
	cairo-compile . -r

clean: FORCE
	scarb clean

fmt: FORCE
	scarb fmt

test: FORCE
	cairo-test -p .

FORCE:
