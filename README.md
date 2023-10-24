# My NeoVIM Config

My NeoVIM config based on NeoVIM GigaChad ThePrimeagen's setup.

See here for a description of most of the configuration:

[0 to LSP: Neovim RC from scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)

My own addition to this config is the `Trouble` plugin to show all error, warning
and info diagnostics from clangd, the `DAP` plugin to debug from within vim and
the `conform` plugin to auto-run clang-format on save, plus a few more little
tweaks to make neovim look and behave like I want :)

## Installation

A fairly recent NeoVIM (i.e. >= 0.9) is needed. Best is to build from source:

    git clone https://github.com/neovim/neovim.git

    cd neovim

    make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/local/nvim

    make install

## Install Packer first

    git clone --depth 1 https://github.com/wbthomason/packer.nvim \
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim

See also "QuickStart": https://github.com/wbthomason/packer.nvim

### Windows

    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

### Linux

    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

## Checkout this repo

Checkout this repo somewhere

### Windows

Let's say you checked the repo out at %USERPROFILE%\repos\neovim-config

    mklink %LOCALAPPDATA%\nvim %USERPROFILE%\repos\neovim-config\nvim
    mklink %LOCALAPPDATA%\clang %USERPROFILE%\repos\neovim-config\clang

### Linux

Let's say you checked the repo out at $HOME/repos/neovim-config

    ln -s $HOME/repos/neovim-config/nvim $HOME/.config/nvim
    ln -s $HOME/repos/neovim-config/clang $HOME/.config/clang

## Run PackerSync in NeoVIM

In nvim, enter `:PackerSync` - this should download all plugins.

That's all :)
