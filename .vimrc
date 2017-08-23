" Remember to install pathogen in ~/.vim/autoload/pathogen.vim
execute pathogen#infect()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backupdir=~/.vimbackups//
set backup        " keep a backup file
set directory=~/.vimbackups/swaps//
set history=50        " keep 50 lines of command line history
set ruler     " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

augroup END

else

set autoindent      " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set number
set ignorecase

" Removes trailing spaces
function TrimWhiteSpace()
%s/\s*$//
''
:endfunction

autocmd BufWritePre *.c :call TrimWhiteSpace()
autocmd BufWritePre *.cpp :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

colorscheme torte

"syntax on

" For autocomplete!  https://github.com/Valloric/YouCompleteMe
"
" Step-by-step guide
" Follow the lazy way of having the YCM plugin working in no-time...Replace
" obviously all references of you_here by your username
" Copy the needed directories and files
" cp -R /home/jvaz/.vim/autoload /home/you_here/.vim
" cp -R /home/jvaz/.vim/bundle/YouCompleteMe /home/you_here/.vim/bundle
" cp /home/jvaz/.vim/ycm_extra_conf.py /home/you_here/.vim
" Edit your .vimrc file in the home directory i.e. /home/you_here/.vimrc and
" add the following lines
let g:ycm_global_ycm_extra_conf = '/home/wwong295/.vim/ycm_extra_conf.py'
call pathogen#infect()
call pathogen#helptags() " Load the help tags for all plugins

"Information on the following setting can be found with
":help set
"set tabstop=4
"set expandtab
"set autoindent
"set shiftwidth=4  "this is the level of autoindent, adjust to taste
"set ruler
"set number
"set backspace=indent,eol,start
"set visualbell
" Uncomment below to make screen not flash on error
" set vb t_vb=""
