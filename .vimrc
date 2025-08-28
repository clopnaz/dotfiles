set nocompatible
" misc ========================================
set hlsearch " highlight search results
set encoding=utf-8 " set utf-8. `e % +enc` to disable
set number " numbered lines
set visualbell " make the screen flash instead of noise
colorscheme elflord
set colorcolumn=80 " python PEP8-recommended text width 
syntax on 
" <C-F5>: print a timestamp
inoremap <C-F5> <C-R>=strftime("%F")<CR> 
" F9: "quickload"
nnoremap <F9> :browse oldfiles<CR> 
set mouse= " alternatively, use shift key (see `:h mouse`) 
" =============================================

" folding 
set foldcolumn=1
set foldmethod=indent
" autocmd BufRead *.extension :set foldlevel=99 " for files I don't want folded on opening

" indentation
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set autoindent

" status line
set laststatus=2 " filename
set ruler " position in file
" set wildmenu " I don't know if this even works
" show hex code?  Just press `ga` 

" make markdown foldable
function! MarkdownLevel()
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    " etc.
    return "="
endfunction
au BufEnter *.md setlocal foldexpr=MarkdownLevel()
au BufEnter *.md setlocal foldmethod=expr

" NOTE: <ctrl-n> turns off numbering for copy/paste, copied by clopnaz from original 
  " vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers 
  " Maintainer:        <https://jeffkreeftmeijer.com> 
  " Version:           2.1.2 
  augroup numbertoggle 
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
  :nnoremap <silent> <C-n> :set relativenumber!<CR> 
  :nnoremap <silent> <C-s-n> :set nonu!<CR>:set nornu!<CR> 


" plugin stuff ==============================
" = auto first-install = 
" == credit == 
" - linux: vim-plug README
" - windows: debajyoti1990 and KarboniteKream on github 
"   (https://github.com/junegunn/vim-plug/issues/1245#issuecomment-1618559726) 
" - detecting OS: Rich (https://superuser.com/a/193638)
" https://superuser.com/questions/193250/how-can-i-distinguish-current-operating-system-in-my-vimrc
if has('win32') 
    if empty(glob('~\vimfiles\autoload\plug.vim'))
    silent ! powershell -Command "
        \ echo INSTALL VIM-PLUG;
        \ New-Item -Path ~\vimfiles -Name autoload -Type Directory -Force;
        \ Invoke-WebRequest
        \ -Uri 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        \ -OutFile ~\vimfiles\autoload\plug.vim
        \ "
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif
if has('unix') 
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
        silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif
" = plugin list = 
" use :PlugInstall or :PlugUpdate to update
call plug#begin()
    Plug 'vimwiki/vimwiki'
    Plug 'tpope/vim-surround'
    Plug 'arcticicestudio/nord-vim'
    Plug 'chrisbra/recover.vim'
    Plug 'honza/vim-snippets'
    if has('python3')
        " Plug 'SirVer/ultisnips'
    else
        echo 'No python3, refusing to load ultisnips plugin'
    endif
    " Plug 'ycm-core/YouCompleteMe'
    Plug 'davidhalter/jedi-vim'
call plug#end()
filetype plugin on 

" = ultisnips settings = 
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetDirectories=["UltiSnips"] " , '/path/to/directory', ... ] 

" = vimwiki settings (and markdown stuff) = 
autocmd Filetype vimwiki set shiftwidth=2
autocmd Filetype markdown set shiftwidth=2
autocmd Filetype vimwiki nmap <buffer> <CR> <Plug>VimwikiTabTDropLink
" ===========================================
autocmd Filetype python nmap <buffer> <f5> :compiler pylint<CR>:make %<CR>
autocmd Filetype python nmap <buffer> <f6> :compiler mypy<CR>:make %<CR>
set list
" https://www.reddit.com/r/vim/comments/4hoa6e/what_do_you_use_for_your_listchars/
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set backspace=nostart " this should be set by defaults.vim
