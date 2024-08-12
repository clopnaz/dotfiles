@echo off
powershell -command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force"

COPY .vimrc %USERPROFILE%\.vimrc
COPY .gitconfig %USERPROFILE%\.gitconfig
