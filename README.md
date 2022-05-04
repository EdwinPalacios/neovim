# Neovim

## Try out this config

Make sure to remove or move your current `nvim` directory

**IMPORTANT** Requires [Neovim v0.7.0](https://github.com/neovim/neovim/releases/tag/v0.7.0) or [Nightly](https://github.com/neovim/neovim/releases/tag/nightly).
```
git clone https://github.com/EdwinPalacios/neovim.git ~/.config/nvim
```

Run `nvim` and wait for the plugins to be installed

**NOTE** (You will notice treesitter pulling in a bunch of parsers the next time you open Neovim)

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

You'll probably notice you don't have support for copy/paste also that python and node haven't been setup

So let's fix that

First we'll fix copy/paste

- On mac `pbcopy` should be builtin

- On Ubuntu

  ```bash
  sudo apt install xsel
  ```

- On Arch Linux

  ```bash
  sudo pacman -S xsel
  ```

Next we need to install python support (node is optional)

- Neovim python support

  ```bash
  pip install pynvim
  ```

- Neovim node support

  ```bash
  npm i -g neovim
  ```
---

- Neovim Javascript & Typescript enable lsp

  ```bash
  npm install -g typescript typescript-language-server eslint eslint-language-server prettier
  ```
  ```bash
  npm install -g vscode-html-languageserver-bin
  ```
---

- Uninstall

  Uninstalling is as simple as removing the nvim configuration directories.

  ```bash
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.cache/nvim
  ```
---


**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

> The computing scientist's main challenge is not to get confused by the complexities of his own making.

\- Edsger W. Dijkstra
