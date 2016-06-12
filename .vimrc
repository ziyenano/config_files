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
if has('mouse')
  set mouse-=a
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


 "语法高亮
syntax on

" "显示行号
 set number

" 自动缩进
 set autoindent 

 set tabstop=4
 set softtabstop=4
 set shiftwidth=4

 set expandtab
" set noexpandtab
"
au BufRead *.py map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

 "  colorscheme evening
  colorscheme default

set completeopt-=preview


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
   Plugin 'fholgado/minibufexpl.vim'
   Plugin 'jcfaria/Vim-R-plugin'
 "  Plugin 'Valloric/YouCompleteMe'
   Plugin 'rdnetto/YCM-Generator'
   Plugin 'benmills/vimux'
" plugin from http://vim-scripts.org/vim/scripts.html
   "Plugin 'L9'
 
 
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

"let g:ycm_global_ycm_extra_conf ='/root/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'





"taglist
"let Tlist_Show_One_File=1    "只显示当前文件的tags
"let Tlist_WinWidth=40        "设置taglist宽度
"let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口,则退出Vim
"let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
"let Tlist_Auto_Open=0 "在启动 vim 后,自动打开 taglist 窗口。
"let Tlist_File_Fold_Auto_Close=1 "taglist 只显示当前文件 tag，其它文件的tag折叠
"let Tlist_WinHeight & Tlist_WinWidth "可以设置taglist窗口的高度和宽度
"let Tlist_Use_Horiz_Window=1 "设置taglist窗口横向显示

"miniBufexplorer
" let g:miniBufExplorerMoreThanOne=1


"supertab
"let g:SuperTabDefaultCompletionType = "<c-p>"
let g:SuperTabDefaultCompletionType="context" 
let g:SuperTabContextDefaultCompletionType = "<c-p>"
"let g:SuperTabRetainCompletionType = 2 

"vim -r- plugin
imap <c-a> <Plug>RCompleteArgs
vmap <Space> <Plug>REDSendSelection
nmap <Space> <Plug>RDSendLine
let vimrplugin_assign =2 
let vimrplugin_objbr_w = 40
"let vimrplugin_tmux_ob = 0
"let vimrplugin_vsplit=0
"let vimrplugin_objbr_place = "console,right"
