## INSTALL
    git clone https://github.com/clopnaz/dotfiles
    cd dotfiles
    chmod +x install.sh
    ./install.sh
## CONTENTS
# .bashrc
* vim as default editor
# .gitconfig
* name and email
* vim as editor
* git log alias `git lg` (https://coderwall.com/p/euwpig/a-better-git-log)
# .tmux.conf
* tmux use 256 colors
* aggressive resizing
* long history 
* arrows to change panes
* rename-window (,) deletes old name
# .vimrc
* highlight search results
* fold indicator 
* folding in markdown
* dynamic absolute/relative line numbers (credit: jeffkreeftmeijer.com)
* numbered lines
* autoindent
* C-F5 prints a timestamp
* vim-plugged
  * vimwiki/vimwiki
    * customization: open links in new tab 
  * SirVer/ultisnips
    * customization: shortcut is shift+tab
  * tpope/vim-surround
  * arcticicestudio/nord-vim
  * chrisbra/recover.vim 
# install.sh
* moves all the dotfiles to $HOME
