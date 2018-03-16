set t_Co=256 
set nocompatible              " be iMproved, required
 filetype off
 set rtp+=~/.vim/bundle/Vundle.vim
 " call vundle#begin()
 
 " Plugin 'VundleVim/Vundle.vim'
 " Plugin 'morhetz/gruvbox'
 
 " call vundle#end()            " required
 
 filetype plugin indent on    " required
 
 syntax enable
 colorscheme molokai
 set background=dark
 set number
 set relativenumber

 
 " visual settings
 set number
 set cursorline
 set cursorcolumn
 set showcmd
 set wildmenu
 set showmatch
 set scrolloff=7

 
" searching
set incsearch
set hlsearch

" movement


" indent
 set expandtab
 set autoindent
 " set smartindent <- don't use this according to stack overflow
 set copyindent
 set shiftwidth=2
 set tabstop=2
        

 set nostartofline

 set ruler

 " set confirm "asks to confirm changes

 set mouse=a "allows for mouse




 let s:comment_map = { 
     \   "c": '\/\/',
     \   "cpp": '\/\/',
     \   "go": '\/\/',
     \   "java": '\/\/',
     \   "javascript": '\/\/',
     \   "scala": '\/\/',
     \   "php": '\/\/',
     \   "python": '#',
     \   "ruby": '#',
     \   "sh": '#',
     \   "desktop": '#',
     \   "fstab": '#',
     \   "conf": '#',
     \   "profile": '#',
     \   "bashrc": '#',
     \   "bash_profile": '#',
     \   "mail": '>',
     \   "eml": '>',
     \   "bat": 'REM',
     \   "ahk": ';',
     \   "vim": '"',
     \   "tex": '%',
     \ }
 
 function! ToggleComment()
     if has_key(s:comment_map, &filetype)
         let comment_leader = s:comment_map[&filetype]
     if getline('.') =~ "^\\s*" . comment_leader . " " 
         " Uncomment the line
         execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
     else 
         if getline('.') =~ "^\\s*" . comment_leader
            "  Uncomment the line
             execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
         else
            " Comment the line
             execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
         end
     end
     else
         echo "No comment leader found for filetype"
     end
 endfunction
 
 nnoremap <leader><Space> :call ToggleComment()<cr>
 vnoremap <leader><Space> :call ToggleComment()<cr>
 
