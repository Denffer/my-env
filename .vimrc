" Version 1.0
" Author : Denffer
"
" Sections
" 1. General :16
" 2. VIM environment  :56
" 3. Tabs and Indent :155
" 4. Shortcut and Mapping :179
" 5. Helper functions
" 6. Files and backups

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General  " all the plugin should put here
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd WinEnter,FileType * colorscheme lucius
"autocmd WinEnter,FileType php colorscheme solarmized
"let g:solarized_termcolors=256
set t_Co=256
try
    colorscheme lucius 
catch
endtry

" Set curserline
set cursorline
hi CursorLineNr cterm=bold ctermfg=46

"Set background
set background=dark

" Sets how many lines of history VIM has to remember
set history=50

" Enable filetype plugins
filetype plugin on
filetype indent on

"the plugin to manage plugins
execute pathogen#infect()

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"match tmux
"set term=screen-256color

" automatically reload vimrc when it's saved
autocmd BufWritePost .vimrc source ~/.vimrc

" This is for nerd tree
" autocmd vimenter * NERDTree " auto start nerdtree upon open vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endi
map <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > VIM environment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 
set nu

" Remove the annoying red indent
highlight ExtraWhitespace ctermbg=black guibg=black
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Set 8 lines to the cursor - when moving up and down
set so=8

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" highlight python
let python_highlight_all=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=b,s,<,>,[,]

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Always show the status line
set laststatus=2

" enable mouse scroll
set mouse=a

" Show matching brackets when text indicator is over them set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu " no idea what is this for
set wildmenu
set wildmode=longest:full,full

autocmd FileType python :iabbrev <buffer> iff if:<left>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Delete trailing white space on save, useful for Python
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Use spaces instead of tabs
set expandtab

" Set textwidth
set textwidth=80

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Auto indent
set ai
" Smart indent
set si
" Wrap lines
set wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut & Mapping
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving & quit
map <leader>w :w!<cr>
map good :wq<CR>
map fuck :q!<CR> 

" Un highlight
map <leader>h :noh<cr>

" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>

" Move a line of text using ALT+[jk] or Control+[jk] on mac
nnoremap <C-k> mz:m+1<cr>
nnoremap <C-j> mz:m-2<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
" Format the status line
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" For jedi
let g:jedi#auto_vim_configuration = 0
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = 2
let g:jedi#documentation_command = "K"
let g:jedi#completions_command = "<C-c>"
let g:jedi#goto_definitions_command = "<C-g>"
let g:jedi#goto_assignments_command = "<leader>g"




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ag \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

hi CursorLineNr cterm=bold ctermfg=46
