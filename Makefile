build: FORCE
	scarb build

clean: FORCE
	rm -r target

fmt: FORCE
	scarb fmt

test: FORCE
	cairo-test -p .

FORCE: