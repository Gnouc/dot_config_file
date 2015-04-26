" Set background
if has("gui_running")
    set background=dark
else
    set background=light
endif

" Set colorscheme
"colorscheme desert
"colorscheme pyte
"colorscheme grb256
"colorscheme vividchalk
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 0
let g:solarized_degrade    = 0
let g:solarized_bold       = 1
let g:solarized_underline  = 1
let g:solarized_italic     = 1
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"
let g:solarized_hitrail    = 0
let g:solarized_menu       = 1
call togglebg#map("<C-b>")
colorscheme solarized
"colorscheme distinguished
"colorscheme developer
"colorscheme tidy

" Fix color in tmux
if &term =~ '256color'
  set t_ut=
endif

" Syntax highlighting
syntax enable

" Set encoding
set encoding=utf-8

" Enable file type detection
if has("autocmd")
    filetype plugin indent on
endif

" Do smart autoindenting when starting a new line
set smartindent

" Show matched pattern when search
set incsearch

" Highlight mathed pattern
set hlsearch

" Ignore case of normal letter
set ignorecase

" Override the 'ignorecase' option if
" the search pattern contains upper case characters
set smartcase

" Smart with tab
set smarttab

" Show line and column of cursor position
set ruler

" Show command
set showcmd

" Complete longest common string, then each full match
set wildmode=longest:full
set wildmenu

" Adding character form pairs
set matchpairs+=<:>

" Number of space that <Tab> count
set tabstop=4

" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab

" Number of spaces to use for each step of (auto)indent)
set shiftwidth=4

" Round indent to multiple of 'shiftwidth'
set shiftround

" Don't wrap long line
set nowrap

" Allow backspace over anything
set backspace=indent,eol,start

" Show full path file
set laststatus=2
set statusline=%<\ %F\ %m%r-\ FileType:\ %y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" List tree view
let g:netrw_liststyle=3
let g:netrw_browse_split=3

" NerdTree
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Highlight trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Turn off highlight search in insert mode
augroup hlsearch
    autocmd!
    autocmd InsertEnter * :setlocal nohlsearch
    autocmd InsertLeave * :setlocal hlsearch
augroup END

" Don't add comment automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show long line indicator
if v:version >= 703
    augroup colorcolumn
        autocmd!
        autocmd FileType python setlocal colorcolumn=78
        autocmd FileType c setlocal colorcolumn=80
        autocmd FileType cpp setlocal colorcolumn=80
        autocmd FileType perl setlocal colorcolumn=100
    augroup END
endif