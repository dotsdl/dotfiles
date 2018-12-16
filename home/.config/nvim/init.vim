set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
" Julia support
Plugin 'JuliaLang/julia-vim'

" jedi
"Plugin 'zchee/deoplete-jedi'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set cindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set clipboard=unnamedplus
set title
set nowrap
set ruler
"set tw=79
"set number
"highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight Normal guifg=white guibg=grey19

filetype plugin on
set foldmethod=indent
"set t_Co=256
set background=dark
colorscheme molokai-dots

" For files with no extension, set filetype as reStructuredText
au BufNewFile,BufRead * if &ft == '' | set ft=rst | set nocindent | set tw=79 | endif
au BufNewFile,BufRead *.txt set ft=rst

" For files with tex extension, set filetype as tex
au BufNewFile,BufRead *.tex set ft=tex

" Python: see  http://wiki.python.org/moin/Vim
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" indentation
au FileType python setl autoindent tabstop=4 expandtab shiftwidth=4 softtabstop=4
:command! -range=% -nargs=0 Tab2Space execute '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

" Remap space in normal mode to insert a space
:nnoremap <Space> i<Space><Esc>l

" Remap enter in normal mode to insert return
:nmap <CR> _i<Enter><Esc>k

" Enter a blank line below/above cursor in Normal mode.
" The o command will continue comments in a program.
nmap ,o o<Esc>k
nmap ,O O<Esc>j

"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  endif
endif

"Use UTF-8 encoding all the time
"set encoding=utf-8  " The encoding displayed.
"set fileencoding=utf-8  " The encoding written to file.

" Latex:
au FileType tex setl wrap number
" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count
autocmd FileType tex nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType tex nnoremap <expr> k v:count ? 'k' : 'gk'


" RestructuredText:
au FileType rst setl wrap number
" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count
autocmd FileType rst nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType rst nnoremap <expr> k v:count ? 'k' : 'gk'


" Markdown:
au FileType markdown setl wrap number
" j and k don't skip over wrapped lines in following FileTypes, unless given a
" count
autocmd FileType markdown nnoremap <expr> j v:count ? 'j' : 'gj'
autocmd FileType markdown nnoremap <expr> k v:count ? 'k' : 'gk'

