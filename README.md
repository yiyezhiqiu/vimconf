Vim Config File
====

+ **Project URL**
https://github.com/hszcg/vimconf

## Required Libs
ctags http://ctags.sourceforge.net/

pyflakes https://pypi.python.org/pypi/pyflakes/

pep8 https://pypi.python.org/pypi/autopep8/

JSHint http://www.jshint.com/install/

## Install Libs
Run install_libs.sh

## Install Vim Plugins

**NOTE: Please backup your .vimrc file first if needed**
```
rm -rf ~/.vim  ~/.vimrc
git clone https://github.com/hszcg/vimconf.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update --init --recursive
```

## Install vim-go dependencies
Open vim and type below
```
:GoInstallBinaries
```

## Install a new plugin

```
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

## Features
General autocomplete

General syntax check

Static analysis for Python and Javascript Code

Better highlight and formating for Javascript, HTML, CSS, LESS and Coffeescript

Status lines

### Shortcuts
F3 Toggle NerdTree

F4 Run autopep8 for Python, OR Auto formating for Javascript/HTML/CSS

F7 Browse recently opened files

F8 Toggle Tagbar
