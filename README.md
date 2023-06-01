# Minimal Cairo 1.0 Template  ![PRs Welcome](https://img.shields.io/badge/PRs-welcome-green.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/auditless/cairo-template/blob/main/LICENSE) <a href="https://github.com/auditless/cairo-template/actions/workflows/test.yaml"> <img src="https://github.com/auditless/cairo-template/actions/workflows/test.yaml/badge.svg?event=push" alt="CI Badge"/> </a>

[Built with **`auditless/cairo-template`**](https://github.com/auditless/cairo-template)

A minimal template for building smart contracts with Cairo 1.0
using the [alexandria](https://github.com/keep-starknet-strange/alexandria) project defaults.

## How it works

- No submodules, forks or other heavy machinery
- Uses [`protostar`](https://github.com/software-mansion/protostar) toolchain for running tests
- Built as a [Scarb](https://github.com/software-mansion/scarb) package for reusability and uses Scarb dependencies for libraries
- Has reproducible builds using GitHub Actions
- Uses Scarb scripts natively for custom commands
- Includes advanced debugging views like the Sierra intermediate representation

## Installing dependencies

### Step 1: Install the Cairo package manager Scarb

Follow the installation guide in [Scarb's documentation](https://docs.swmansion.com/scarb).

### Step 2: Install the Protostar toolchain

Follow the installation guide in [Protostar's Repository](https://github.com/software-mansion/protostar).


### Step 3: Install Cairo 1.0 (guide by [Abdel](https://github.com/abdelhamidbakhta))

**NOTE: By installing Scarb, you already have an accompanying Cairo 1.0 version which can be viewed by running `$ scarb --version`. This installation step is included to allow you maintain an independent version of Cairo. This step will also prove useful when setting up the language server in [Step 5](#step-5-setup-language-server).**

If you are on an x86 Linux system and able to use the release binary,
you can download Cairo here https://github.com/starkware-libs/cairo/releases.

For everyone, else, we recommend compiling Cairo from source like so:

```bash
# Install stable Rust
$ rustup override set stable && rustup update

# Clone the Cairo compiler in $HOME/Bin
$ cd ~/Bin && git clone git@github.com:starkware-libs/cairo.git && cd cairo

# OPTIONAL/RECOMMENDED: If you want to install a specific version of the compiler
# Fetch all tags (versions)
git fetch --all --tags
# View tags (you can also do this in the cairo compiler repository)
git describe --tags `git rev-list --tags`
# Checkout the version you want
git checkout tags/v1.0.0-alpha.6

# Generate release binaries
$ cargo build --all --release
```

**NOTE: Keeping Cairo up to date**

Now that your Cairo compiler is in a cloned repository, all you will need to do
is pull the latest changes and rebuild as follows:

```bash
$ cd ~/Bin/cairo && git fetch && git pull && cargo build --all --release
```

### Step 4: Add Cairo 1.0 executables to your path

```bash
export PATH="$HOME/Bin/cairo/target/release:$PATH"
```

**NOTE: If installing from a Linux binary, adapt the destination path accordingly.**

This will make available several binaries. The one we use is called `cairo-test`.

### Step 5: Setup Language Server

#### VS Code Extension

- Disable previous Cairo 0.x extension
- Install the Cairo 1 extension for proper syntax highlighting and code navigation.
Just follow the steps indicated [here](https://github.com/starkware-libs/cairo/blob/main/vscode-cairo/README.md).

#### Cairo Language Server

The Cairo Language Server now comes bundled with the Scarb package manger distribution.
You can make sure it is available in your system by running `$ scarb commands`.
The output should include a line starting with `cairo-language-server`.

## How to use this template

First you will need to clone the repository or click the `Use this template` button
at the top of the page to create a new repository based on the template.

Next, you will want to update the configuration file with the name of your project:

```
└── .Scarb.toml
```
Also, if you're using a different `protostar` version, you'll want to update the version in the configuration file as well
```
└── .protostar.toml
```
## Working with your project

The Cairo template currently supports building and testing contracts.

### Build

Build the contracts.

```bash
$ scarb build
```

### Test

Run the tests in `src/test`:

```bash
$ scarb run test
```

### Format

Format the Cairo source code (using Scarb):

```bash
$ scarb fmt
```

### Sierra and Casm (advanced)
The Sierra output of your cairo code is automatically built by scarb when you run `$ scarb build`.

To change this behaviour, add the following code to the `[lib]` section of your `Scarb.toml` configuration file
```
    [lib]
    sierra = false
```
Similarly, to generate casm (Cairo assembly), add the following code to the `[lib]` section of your `Scarb.toml` configuration file
```
    [lib]
    casm = true
```

## Thanks to

- The [alexandria](https://github.com/keep-starknet-strange/alexandria) team for coming up with
this configuration and especially [Abdel](https://github.com/abdelhamidbakhta) for helping me with Cairo 1.0 installation
- [Paul Berg](https://github.com/PaulRBerg) and the [foundry-template](https://github.com/paulrberg/foundry-template) project which served as inspiration
- Last but not least, the StarkWare team for building the first smart contract language that is a joy to use

## Other templates

- [ArgentX template](https://github.com/argentlabs/starknet-build/tree/main/cairo1.0) is built as a fork of the compiler
- [Eni's cairo1-template](https://github.com/msaug/cairo1-template) uses git submodules for installation
- [Shramee's Starklings](https://github.com/shramee/starklings-cairo1) use the cairo1 crates as libraries and builds its own framework

## License

[MIT](https://github.com/auditless/cairo-template/blob/main/LICENSE) © [Auditless Limited](https://www.auditless.com)
