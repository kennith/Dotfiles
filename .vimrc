" vim:fdm=marker

" Settings -------------------------------------------------------------

" Preamble {{{

" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
colorscheme molotov
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
"set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
"set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undo
set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" Configuration -------------------------------------------------------------

" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

  " Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Remap :W to :w {{{
  command! W w
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Hard to type things {{{
  iabbrev >> →
  iabbrev << ←
  iabbrev ^^ ↑
  iabbrev VV ↓
  iabbrev aa λ
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

  " Clear last search (,qs) {{{
  map <silent> <leader>qs <Esc>:noh<CR>
  " map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Vim on the iPad {{{
  if &term == "xterm-ipad"
    nnoremap <Tab> <Esc>
    vnoremap <Tab> <Esc>gV
    onoremap <Tab> <Esc>
    inoremap <Tab> <Esc>`^
    inoremap <Leader><Tab> <Tab>
  endif
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Paste toggle (,p) {{{
  set pastetoggle=<leader>p
  map <leader>p :set invpaste paste?<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Insert newline {{{
  map <leader><Enter> o<ESC>
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}

  " Relative numbers {{{
  "set relativenumber " Use relative line numbers. Current line is still in status bar.
  "au BufReadPost,BufNewFile * set relativenumber
  " }}}
augroup END
" }}}



" Buffers {{{
augroup buffer_control
  autocmd!

  " Prompt for buffer to select (,bs) {{{
  nnoremap <leader>bs :CtrlPBuffer<CR>
  " }}}

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader>, <C-^>
  map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

  " Close Quickfix window (,qq) {{{
  map <leader>qq :cclose<CR>
  " }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}


" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" Filetypes -------------------------------------------------------------

" C {{{
augroup filetype_c
  autocmd!

  " Highlight Custom C Types {{{
  autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
  autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
  autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
  autocmd BufRead,BufNewFile *.[ch] endif
  " }}}
augroup END
" }}}

" Clojure {{{
augroup filetype_clojure
  autocmd!
  let g:vimclojure#ParenRainbow = 1 " Enable rainbow parens
  let g:vimclojure#DynamicHighlighting = 1 " Dynamic highlighting
  let g:vimclojure#FuzzyIndent = 1 " Names beginning in 'def' or 'with' to be indented as if they were included in the 'lispwords' option
augroup END
" }}}

" Coffee {{{
augroup filetype_coffee
  autocmd!
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup END
" }}}




" JavaScript {{{
augroup filetype_javascript
  autocmd!
  let g:javascript_conceal = 1
augroup END
" }}}

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
  autocmd!
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}









" Plugins -------------------------------------------------------------

" Load plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'bling/vim-airline'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'guns/vim-clojure-static'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'msanders/snipmate.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'oplatek/Conque-Shell'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
Plug 'vim-scripts/jade.vim',   { 'for': 'jade' }
Plug 'wavded/vim-stylus',      { 'for': 'stylus' }
Plug 'wlangstroth/vim-racket'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

call plug#end()
" }}}
