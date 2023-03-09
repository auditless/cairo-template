# Minimal Cairo 1.0 Template  ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-green.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/auditless/cairo-template/blob/main/LICENSE) <a href="https://github.com/auditless/cairo-template/actions/workflows/test.yaml"> <img src="https://github.com/auditless/cairo-template/actions/workflows/test.yaml/badge.svg?event=push" alt="CI Badge"/> </a>

[Built with **`auditless/cairo-template`**](https://github.com/auditless/cairo-template)

A minimal template for building smart contracts with Cairo 1.0
using the [Quaireaux](https://github.com/keep-starknet-strange/quaireaux) project defaults.

## How it works

- No submodules, forks or other heavy machinery
- Uses the [`cairo-test-runner`](https://github.com/starkware-libs/cairo/blob/main/crates/cairo-lang-test-runner/README.md) binary for running tests
- Built as a [Scarb](https://github.com/software-mansion/scarb) package for reusability and uses Scarb dependencies for libraries
- Has reproducible builds using GitHub Actions
- Includes a standard Makefile for commonly used commands

## Installing dependencies

### Step 1: Install Cairo 1.0 (guide by [Abdel](https://github.com/abdelhamidbakhta))

If you are on an x86 Linux system and able to use the release binary,
you can download Cairo here https://github.com/starkware-libs/cairo/releases.

For everyone, else, we recommend compiling Cairo from source like so:

```bash
# Install stable Rust
$ rustup override set stable && rustup update

# Clone the Cairo compiler in $HOME/Bin
$ cd ~/Bin && git clone git@github.com:starkware-libs/cairo.git && cd cairo

# Generate release binaries
$ cargo build --all --release
```

**NOTE: Keeping Cairo up to date**

Now that your Cairo compiler is in a cloned repository, all you will need to do
is pull the latest changes and rebuild as follows:

```bash
$ cd ~/Bin/cairo && git fetch && git pull && cargo build --all --release
```

### Step 2: Add Cairo 1.0 executables to your path

```bash
export PATH="$HOME/Bin/cairo/target/release:$PATH"
```

**NOTE: If installing from a Linux binary, adapt the destination path accordingly.**

This will make available several binaries. The one we use is called `cairo-test`.

### Step 3: Install the Cairo package manager Scarb

Follow the installation guide in [Scarb's Repository](https://github.com/software-mansion/scarb).

### Step 4: Setup Language Server

#### VS Code Extension

- Disable previous Cairo 0.x extension
- Install the Cairo 1 extension for proper syntax highlighting and code navigation.
Just follow the steps indicated [here](https://github.com/starkware-libs/cairo/blob/main/vscode-cairo/README.md).

#### Cairo Language Server

From [Step 1](#step-1-install-cairo-10-guide-by-abdel), the `cairo-language-server` binary should be built and executing this command will copy its path into your clipboard.

```bash
$ which cairo-language-server | pbcopy
```

Update the `languageServerPath` of the Cairo 1.0 extension by pasting the path.

## How to use this template

First you will need to clone the repository or click the `Use this template` button
at the top of the page to create a new repository based on the template.

Next, you will want to update the configuration files with the name of your project:

```
├── .cairo_project.toml
└── .Scarb.toml
```

## Working with your project

The Cairo template currently supports building and testing contracts.

### Build

Build the contracts.

```bash
$ make build
```

### Test

Run the tests in `src/test`:

```bash
$ make test
```

### Format

Format the Cairo source code (using Scarb):

```bash
$ make fmt
```

### Sierra (advanced)

View the compiled Sierra output of your Cairo code:

```bash
$ make sierra
```

## Thanks to

- The [Quaireaux](https://github.com/keep-starknet-strange/quaireaux) team for coming up with
this configuration and especially [Abdel](https://github.com/abdelhamidbakhta) for helping me with Cairo 1.0 installation
- [Paul Berg](https://github.com/PaulRBerg) and the [foundry-template](https://github.com/paulrberg/foundry-template) project which served as inspiration
- Last but not least, the StarkWare team for building the first smart contract language that is a joy to use

## Other templates

- [ArgentX template](https://github.com/argentlabs/starknet-build/tree/main/cairo1.0) is built as a fork of the compiler
- [Eni's cairo1-template](https://github.com/msaug/cairo1-template) uses git submodules for installation
- [Shramee's Starklings](https://github.com/shramee/starklings-cairo1) use the cairo1 crates as libraries and builds its own framework

## License

[MIT](https://github.com/auditless/cairo-template/blob/main/LICENSE) © [Auditless Limited](https://www.auditless.com)
