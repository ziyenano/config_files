" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2014 Nov 05
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
" else
"  set backup		" keep a backup file (restore to previous version)
"  set undofile		" keep an undo file (undo changes after closing)
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  "set hlsearch
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

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


set number

set autoindent 

set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
" set noexpandtab
"au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

colorscheme default
"set background=dark
"colorscheme solarized

"suppress the preview window while completion, e.g, python 
set completeopt-=preview

"do not autoselect the first item
set completeopt=longest,menuone

let mapleader = ","
let maplocalleader = ","

inoremap jk <esc>
vnoremap jk <esc>

"switch to other buffer without saving
set hidden

"popup menu colors
hi Pmenu ctermfg=15 ctermbg=60
hi PmenuSel  ctermfg=0 ctermbg=7 guibg=Grey
hi PmenuSbar  ctermbg=60
hi PmenuThumb ctermbg=7 guibg=Grey

"split line color and style
hi VertSplit term=bold cterm=bold  gui=bold
"set fillchars=vert:|

"Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'

 " The following are examples of different formats supported.
 " Keep Plugin commands between vundle#begin/end.
 " plugin on GitHub repo

   Plugin 'ervandew/supertab'
 "  Plugin 'fholgado/minibufexpl.vim'
   Plugin 'jcfaria/Vim-R-plugin'
   Plugin 'vim-airline/vim-airline'
   Plugin 'vim-airline/vim-airline-themes'
   Plugin 'vim-syntastic/syntastic'
   Plugin 'benmills/vimux'
   Plugin 'SirVer/ultisnips'
   Plugin 'honza/vim-snippets'
   Plugin 'Rip-Rip/clang_complete'
   Plugin 'majutsushi/tagbar'
   Plugin 'scrooloose/nerdtree'
   Plugin 'tpope/vim-fugitive'
   

 "  Plugin 'Valloric/YouCompleteMe'
 "  Plugin 'rdnetto/YCM-Generator'
 "  Plugin 'dbext.vim'
 "  plugin from http://vim-scripts.org/vim/scripts.html
 "  Plugin 'L9'
 
 
   "Install L9 and avoid a Naming conflict if you've already installed a different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just:PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line

"youcompelteme

"let g:ycm_global_ycm_extra_conf ='$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf ='$HOME/.ycm_extra_conf.py'

"supertab
"let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabRetainCompletionType = "insert"
"autocmd FileType *
"    \ if &omnifunc != '' |
"    \   call SuperTabChain(&omnifunc, "<c-p>") |
"    \ endif

"vim-r-plugin
imap <c-a> <Plug>RCompleteArgs
autocmd Filetype r vmap <buffer> <Space>  <Plug>REDSendSelection
autocmd Filetype r nmap <buffer> <Space>  <Plug>RDSendLine
autocmd Filetype r nmap <buffer> <LocalLeader>rc  <Plug>RClearConsole
autocmd Filetype r nmap <buffer> <LocalLeader>rr  <Plug>RCustomStart
"let vimrplugin_tmux_ob = 0 
let vimrplugin_assign = 2
let vimrplugin_objbr_w = 35 
"let vimrplugin_vsplit=0
"let vimrplugin_objbr_place = "console,right"
let vimrplugin_rconsole_height = 16
let vimrplugin_objbr_opendf = 0

function! RplugZoomRunner()
    if exists("g:rplugin_rconsole_pane")
        call system("tmux resize-pane -Z -t" . g:rplugin_rconsole_pane)
    else 
        echo "Did you alraeay start R?"
    endif
endfunction

autocmd Filetype r nmap <buffer> <LocalLeader>rz :call RplugZoomRunner()<CR>
autocmd Filetype r nmap <buffer> <LocalLeader>rx :RStop<CR>

"dbext
"source $HOME/db_config.vim
"let g:dbext_map_prefix = ',s'

"vimux
nmap <Leader>vf :call VimuxRunCommand("ipython")<CR>
" Prompt for a command to run
nmap <Leader>vr :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
nmap <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
nmap <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
nmap <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
nmap <Leader>vx :VimuxInterruptRunner<CR>
" Zoom the runner pane (use <bind-key> z to restore runner pane)
nmap <Leader>vz :call VimuxZoomRunner()<CR>
" clear the console
nmap <silent><Leader>vc :call VimuxSendKeys("c-l")<CR>
" Quit the runner without closing the pane
nmap <Leader>vd :call VimuxExitRunner()<CR>

"The percent of the screen the split pane Vimux will spawn should take up.
let g:VimuxHeight = "40"

let g:VimuxOrientation = "v"

" if we directly map the target function, while dealing with the blank line, the 
" internal line/getpos will return the number of next line, however, when we
" add an extra wrap funciton, it works properly again. 
function! VimuxCreateMaps(combo, target, mode)
    let tg = a:target . '<CR>'
        exec 'vnoremap' . a:mode . a:combo . ' <Esc>' . tg
endfunction


function! VimuxSlime()
    let lines = getline("'<", "'>")
    let i = col("'<") - 1
    let j = col("'>")
    let lines[0] = strpart(lines[0], i)
    let llen = len(lines) - 1
    let lines[llen] = strpart(lines[llen], 0, j)
    if &filetype == "python"
        call VimuxSendText("%cpaste")
        call VimuxSendKeys("Enter")
    endif
    for text in lines
        call VimuxSendText(text)
        call VimuxSendKeys("Enter")
    endfor
    if &filetype == "python"
        call VimuxSendKeys("C-d")
    endif
    call cursor(line(".") + 1, 1)
endfunction

function! VimuxSlimeOneline()
    call VimuxSendText(@v)
    call cursor(line(".") + 1, 1)
endfunction

function! VimuxAction(arg)
    call VimuxSendText(a:arg. "(". @v . ")")
    call VimuxSendKeys("Enter")
endfunction

function! VimuxExitRunner()
    if exists("g:VimuxRunnerIndex")
        call _VimuxTmux("send-keys -t ".g:VimuxRunnerIndex." "."c-d")
        call _VimuxTmux("send-keys -t ".g:VimuxRunnerIndex." "."c-d")
        unlet g:VimuxRunnerIndex
    endif
endfunction

call VimuxCreateMaps('<Space>', ':call VimuxSlime()', '<silent>')
nnoremap <silent> <Space> "vyy:call VimuxSlimeOneline()<CR>

nnoremap <silent> <Leader>vp "vyiw:call VimuxAction("print")<CR>
vnoremap <silent> <Leader>vp "vy:call VimuxAction("print")<CR>
autocmd Filetype python nnoremap <buffer><silent> <Leader>vt "vyiw:call VimuxAction("type")<CR>
autocmd Filetype python vnoremap <buffer><silent> <Leader>vt "vy:call VimuxAction("type")<CR>

"vim-airline
set laststatus=2
set t_Co=256

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme="luna"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = ['']
"autocmd FileType * unlet! g:airline#extensions
"autocmd FileType vim let g:airline#extensions#whitespace#checks = [ 'indent' ]

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = '' 
let g:airline_left_alt_sep = '' 
let g:airline_right_sep = '' 
let g:airline_right_alt_sep = '' 
let g:airline_symbols.branch = '' 
let g:airline_symbols.readonly = '' 
let g:airline_symbols.linenr = '' 

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 0 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0 

let g:syntastic_c_config_file = ".clang_complete"
let g:syntastic_cpp_config_file = ".clang_complete"


"python
let g:syntastic_python_pylint_quiet_messages = { "level": "warnings" }
"R
let g:syntastic_enable_r_lintr_checker = 0
let g:syntastic_r_checkers = ['lintr']

"for comfortablely reading location list [syntastic]
hi Search term=reverse ctermbg=000  guibg=black 

"ultisnips
"let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-l>"

"clang-complete
 let g:clang_complete_copen = 1
 let g:clang_library_path = '/usr/lib/llvm-3.5/lib/libclang-3.5.so.1'
 "let g:clang_snippets = 1
 "let g:clang_snippets_engine = 'ultisnips'
 let g:clang_complete_auto = 0 
 let g:clang_auto_select = 0

"tagbar
 nmap  <Leader>tt :TagbarToggle<CR>
 let g:tagbar_width = 35

"nerdtree
 nmap  <Leader>nt :NERDTreeToggle<CR>
