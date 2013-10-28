Vim Config File
====

+ **Project URL**
https://github.com/hszcg/vimconf

## Required Libs
ctags http://ctags.sourceforge.net/

pyflake https://pypi.python.org/pypi/pyflakes/

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
git submodule update
```

## Features
General autocomplete

General syntax check

Static analysis for Python and Javascript Code

Better highlight and formating for HTML, CSS, LESS and Coffeescript

Status lines

### Shortcuts
F3 Toggle NerdTree

F4 Run autopep8

F8 Toggle Tagbar
