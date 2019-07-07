" for spell check
set nocompatible
filetype plugin on       " may already be in your .vimrc

"--------------AUTOMATE vim plug setup---------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
 
"--------PLUGINS-----------------------
call plug#begin('~/.vim/plugged')
"Plug 'klen/python-mode'                "python syntax
Plug 'kalekundert/vim-coiled-snake'    "python folding
Plug 'vim-scripts/c.vim'                "c++ syntax
Plug 'ervandew/supertab'                "lightweight tab complettion
Plug 'vim-scripts/vim-auto-save'
Plug 'vim-syntastic/syntastic' 
"Plug 'scrooloose/nerdtree'
"Plug 'craigemery/vim-autotag'
Plug '/Valloric/YouCompleteMe'          "more robust tab completion
Plug 'Konfekt/FastFold'                 "optimizes vim folding
call plug#end()

"--------FASTFOLD------------------------
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_minlines = 10
let g:fastfold_fold_command_suffixes =  []
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

"--------Pymode---------------------------
" no redline in middle of screen
"let g:pymode_virtualenv = 0
"let g:pymode_breakpoint = 0
"let g:pymode_folding = 0
"let g:pymode_rope = 0
"let g:pymode_run = 0
"let g:pymode_options_colorcolumn = 0
"let g:pymode_lint_on_write = 0
""set the complexity check high to essentially disable it
"let g:pymode_lint_options_mccabe = {'complexity': 30}
"let g:pymode_python = 'python3'
"let g:pymode=0

"--------Syntastic---------------------------
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

"-------Autosave--------------------------
let g:auto_save = 1 " enable AutoSave on Vim startup
let g:auto_save_no_updatetime = 1 " do not change the updatetime option
let g:auto_save_silent = 1  " do not display the auto-save notification
"---------------------------------------

"--------APPEARANCE-----------------------
set omnifunc=htmlcomplete#CompleteTags
set guifont=DejaVu\ Sans\ Mono:h12
set t_Co=16
set background=dark
set hlsearch
syntax on
"fix for tmux changing the color scheme
set t_ut=
"---------------------------------------

"--------BEHAVIOR-----------------------
set nowrap
set foldmethod=syntax
set norelativenumber
set number
set wildignore=*.o,tags,*~   "Don't show object files, etc when tab-completing
set tags=./tags,tags;$HOME
"diable scratch
set completeopt-=preview
set mouse=a
"---------------------------------------

"--------TAB SETTINGS--------------------
filetype plugin indent on
" SHOW EXISTING TAB WITH SPACES WIDTH
set tabstop=2
" WHEN INDENTING WITH '>', USE SPACES WIDTH
set shiftwidth=2
" ON PRESSING TAB, INSERT SPACES
set expandtab
set smarttab
set cin "C-style indentation"
set ai "autoindent"
"---------------------------------------

"--------WORD COUNT--------------------
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

"-------------STATUS LINE--------------------
set laststatus=2
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=black guibg=black ctermfg=white guifg=white
set statusline=%1*			" Switch to User1 color highlight
set statusline+=%<%F			" file name, cut if needed at start
set statusline+=%M			" modified flag | DOESNT WORK 
set statusline+=%y			" file type | DOESNT WORK
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words, " word count
set statusline+=\ col:\ %c, "column number
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file
"--------------------------------------------

"------HTML REMAPS----------
set nocompatible
filetype plugin on
syntax on
"--------------------------

"---------KEY REMAPS------------
set pastetoggle=<F3>
noremap ZZ <Nop>
"Save and compile current C file, % is current file, '<' removes .out
map <F8> :w <CR> :!clang -g -Wall % -o %< && ./%< 

" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
 if argc() == 2
   n
     e #
     endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"autocmd BufWritePost *.md !star='%' && fin=$(star.md/.md/.pdf) && pandoc $star -o $fin -s -S

" compiles .tex and produces a pdf
"autocmd BufWritePost *.tex Dispatch! latexmk -pdf main.tex

"ctags
"autocmd BufWritePost *
"      \ if filereadable('tags') |
"      \   call system('ctags -a '.expand('%')) |
"      \ endif
"autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.
" map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
" map! <F10> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
" map! <F11> <Esc>set makeprg=javac\ #<CR>:make<CR>
" map! <F12> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>

"Tip: load a file into the default buffer, and its driver
" into the alternate buffer, then use F9/F12 to build/run.
" Note: # (alternate filename) isn't set until you :next to it!
" Tip2: You can make then run without hitting ENTER to continue. F9-F12

" With these you can cl/cn/cp (quickfix commands) to browse the errors
" after you compile it with :make

" set makeprg=javac\ %
" set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#

"inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
"autocmd FileType html inoremap ;i <em></em><Space><++><Esc>FeT>i
"autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
"autocmd FileType html inoremap ;p <p></p><Space><++><Esc>FpT>i

