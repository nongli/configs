syntax enable
set nocompatible

" Backups
set nobackup
set noswapfile
set nowritebackup

" Gui display
set guifont=Lucida_Sans_Typewriter:h10:cANSI
set guioptions-=T

" Colors
:colorscheme desert

" General
set undolevels=200
set noerrorbells
set number
set ruler
set lazyredraw
set tw=100

" tabs
set softtabstop=2
set shiftwidth=2
set tabstop=4
set smarttab
set shiftround
set expandtab
set smartindent
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>
inoremap <S-Tab> <C-D>

" History
set history=50
set showmode
set showcmd

" Mouse
set mouse=a

" Search
set ignorecase
set smartcase
set incsearch
set gdefault
set showmatch
set hlsearch

" Remap alt+space to turn off search highlights
noremap <silent><F4> :silent noh<Bar>echo<CR>

" Backspace
set backspace=eol,start,indent

" Spelling
abbreviate availible available
abbreviate compatable compatible
abbreviate convinient convenient
abbreviate seperate separate
abbreviate seperately separately
abbreviate teh the

:setlocal spell
noremap <silent><F3> :setlocal spell!<CR>

" Keystrokes

"Remap ijkl
noremap h i
noremap H I
noremap j h
noremap k j
noremap l l
noremap i k

"Remap Space/BS for PageUp/Page Down
noremap <Space> <PageDown>
noremap <BS> <PageUp>

"Remap Ins/Del for Peek up Peek down
noremap <Ins> 2<C-Y>
noremap <Del> 2<C-E>

" Remap F6/S+F6 to cycle split windows
nnoremap <F9> <C-W>w
nnoremap <S-F9> <C-W>W

" Remap Crtl N/P to next/prev file
nnoremap <C-N> :tabnext<CR>
nnoremap <C-P> :tabprev<CR>

" Copy and paste with Ctrl+c/Ctrl+v to system clipboard
"vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
"map <Insert> :set paste<CR><Esc>:.!xclip -o<CR>:set nopaste<CR>
vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

" Remap F1 to help
nnoremap <F1> <C-C><F1>
vmap <F1> <C-C><F1>
omap <F1> <C-C><F1>
map! <F1> <C-C><F1>

" Remap Q to reformat paragraph
nnoremap Q ggap
vnoremap Q qq

" fix :W and :Q
nmap :W :w
nmap :Q :q

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>

" Highlighting
set matchpairs+=<:>

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" Remove trailing white space on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Clang-format configs
let g:clang_format#detect_style_file=1

set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


