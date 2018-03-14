"Vim transision
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
"General settings
	set lazyredraw
    set nocompatible
    filetype off
    set linespace=1
    set guifont=Monospace\ 11
    "colo evening
    set nu
    set relativenumber number
    hi CursorLineNR guifg=#ffffff
    syntax on
    set encoding=utf-8
    set undofile
    set undodir="$HOME/.vim-undo-files"
    set background=dark
    set t_Co=256
	set ttyfast
    set mouse=a "enable mouse scrolling
    set splitbelow
    set splitright
	"set clipboard=unnamedplus




"Hide status line, using powerline
	set noshowmode
	set noruler
	set laststatus=0
	set noshowcmd

" Default delimiter
    filetype plugin indent on
    " show existing tab with 4 spaces width
    set tabstop=4
    " when indenting with '>', use 4 spaces width
    set shiftwidth=4
    " On pressing tab, insert 4 spaces
    set softtabstop=4
    set expandtab

"Vundle and plugins
    " initialize vundle
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    " start- all plugins below
    Plugin 'VundleVim/Vundle.vim'
    " Plugin 'itchyny/lightline.vim'
    " Snippets
	Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'SirVer/ultisnips'
    Plugin 'algotech/ultisnips-php'
    Plugin 'honza/vim-snippets'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'tpope/vim-surround'
    Plugin 'tmhedberg/SimpylFold'
	Plugin 'Valloric/YouCompleteMe'
    Plugin 'vim-scripts/indentpython.vim'
    Plugin 'ternjs/tern_for_vim'
    Plugin 'Yggdroot/indentLine'
    Plugin 'ctrlpvim/ctrlp.vim'
    " stop - all plugins above
    call vundle#end()

" Neovim Specific Plugins
" Setup dein  ---------------------------------------------------------------{{{

    "if (!isdirectory(expand("$HOME/.config/nvim/repos/github.com/Shougo/dein.vim")))
      "call system(expand("mkdir -p $HOME/.config/nvim/repos/github.com"))
      "call system(expand("git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/repos/github.com/Shougo/dein.vim"))
    "endif
    if &compatible
      set nocompatible
    endif
    set runtimepath+=~/.config/nvim/repos/github.com/Shougo/dein.vim/
    call dein#begin(expand('~/.config/nvim/bundle'))
    call dein#add('tpope/vim-fugitive')
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('Xuyuanp/nerdtree-git-plugin')
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('terryma/vim-multiple-cursors')
    "call dein#add('dominic-dev/nvim-jchain')
    "call dein#add('dominic-dev/nvim-showcon')
	"call dein#local('~/Development/vim/', {}, ['nvim-jchain'])
    " php
    call dein#add('ludovicchabant/vim-gutentags')
    "call dein#add('vim-scripts/YankRing.vim')
    call dein#add('tpope/vim-abolish')
    call dein#add('StanAngeloff/php.vim')
    call dein#add('stephpy/vim-php-cs-fixer')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('padawan-php/padawan.vim')
    call dein#add('padawan-php/deoplete-padawan')
    call dein#add('neomake/neomake')
    call dein#add('adoy/vim-php-refactoring-toolbox')
    call dein#add('stephpy/vim-php-cs-fixer')
    call dein#add('phpactor/phpactor')
    call dein#add('majutsushi/tagbar')
    call dein#add('Townk/vim-autoclose')
	call dein#add('mattn/emmet-vim')

    if dein#check_install()
      call dein#install()
      let pluginsExist=1
    endif

    call dein#end()
    call dein#save_state()
    filetype plugin indent on
    syntax enable
" }}}

" Deoplete
if &ft != 'java'
	let g:deoplete#enable_at_startup = 1
endif
" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
    if exists('*deoplete#disable')
        exe 'call deoplete#disable()'
    elseif exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
    if exists('*deoplete#enable')
        exe 'call deoplete#enable()'
    elseif exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction

" Autoclose
"let g:AutoClosePumvisible = {"ENTER": "<C-Y>", "ESC": "<ESC>", "UP" : "<UP>", "DOWN" : "<DOWN>"}
let g:AutoClosePreserveDotReg = 0


" yankring
    let g:yankring_replace_n_pkey = '<m-p>'
    let g:yankring_replace_n_nkey = '<m-n>'


"airline"
"let g:airline_theme='base16_spacemacs'
let g:airline_theme='wombat'

" vim-airline ---------------------------------------------------------------{{{
    let g:webdevicons_enable_airline_statusline = 1
    "if !exists('g:airline_symbols')
        "let g:airline_symbols = {}
    "endif
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#mike#enabled = 1
    set hidden
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline_powerline_fonts = 1
    "let g:airline_symbols.branch = ''
    "cnoreabbrev <silent> <expr> x getcmdtype() == ":" && getcmdline() == 'x' ? 'Sayonara' : 'x'
    "tmap <leader>x <c-\><c-n>:bp! <BAR> bd! #<CR>
    "nmap <leader>, :bnext<CR>
    "tmap <leader>, <C-\><C-n>:bnext<cr>
    "nmap <leader>. :bprevious<CR>
    "tmap <leader>. <C-\><C-n>:bprevious<CR>
    tmap <leader>1  <C-\><C-n><Plug>AirlineSelectTab1
    tmap <leader>2  <C-\><C-n><Plug>AirlineSelectTab2
    tmap <leader>3  <C-\><C-n><Plug>AirlineSelectTab3
    tmap <leader>4  <C-\><C-n><Plug>AirlineSelectTab4
    tmap <leader>5  <C-\><C-n><Plug>AirlineSelectTab5
    tmap <leader>6  <C-\><C-n><Plug>AirlineSelectTab6
    tmap <leader>7  <C-\><C-n><Plug>AirlineSelectTab7
    tmap <leader>8  <C-\><C-n><Plug>AirlineSelectTab8
    tmap <leader>9  <C-\><C-n><Plug>AirlineSelectTab9
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#branch#format = 0
    let g:airline_detect_spelllang=0
    let g:airline_detect_spell=0
    let g:airline#extensions#hunks#enabled = 0
    let g:airline#extensions#wordcount#enabled = 0
    let g:airline#extensions#whitespace#enabled = 0
    " let g:airline_section_c = '%f%m'
    " let g:airline_section_x = ''
    "let g:airline_section_y = ''
    " let g:airline_section_z = '%l:%v'
    "let g:airline_section_z = '%{LineNoIndicator()} :%2c'
    " let g:line_no_indicator_chars = [' ', '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█']
    let g:line_no_indicator_chars = ['⎺', '⎻', '⎼', '⎽', '_']
    let g:airline_mode_map = {
          \ 'n'  : '',
          \ 'i' : '',
          \ 'R' : '',
          \ 'v' : '',
          \ 'V' : '',
          \ 'c' : '',
          \ 's' : '',
          \ 'S' : '',
          \ ''  : '',
          \ 't' : '',
          \}
    let g:airline#extensions#tabline#buffer_idx_format = {
          \ '0': '0 ',
          \ '1': '1 ',
          \ '2': '2 ',
          \ '3': '3 ',
          \ '4': '4 ',
          \ '5': '5 ',
          \ '6': '6 ',
          \ '7': '7 ',
          \ '8': '8 ',
          \ '9': '9 ',
          \}
"}}}


"ultisnips config
    "Trigger configuration. Do not use <tab> if you use
    "https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<c-c>"
    let g:UltiSnipsJumpForwardTrigger="<c-d>"
    let g:UltiSnipsJumpBackwardTrigger="<c-a>"

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"

" you complete me custimization 
    let g:ycm_autoclose_preview_window_after_completion=1
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" show docstring on folded code
    let g:SimpylFold_docstring_preview=1

"NerdTree
    nmap <leader>t  :exe ":NERDTreeToggle"<CR>
	let NERDTreeIgnore = ['\.pyc$', '\.class$']


" vertical line indentation
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#09AA08'
    let g:indentLine_char = '│'

"FILETYPE SPECIFIC
"
"PYTHON 
    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set smarttab | 
        \ set fileformat=unix |
		\ nnoremap <F5> :w !python3<CR>
"nnoremap <F5> :w !python<CR>

 "Django shortkeys
    "let g:last_relative_dir = ''
    "nnoremap \1 :call RelatedFile ("models.py")<cr>
    "nnoremap \2 :call RelatedFile ("views.py")<cr>
    "nnoremap \3 :call RelatedFile ("urls.py")<cr>
    "nnoremap \4 :call RelatedFile ("admin.py")<cr>
    "nnoremap \5 :call RelatedFile ("tests.py")<cr>
    "nnoremap \6 :call RelatedFile ( "templates/" )<cr>
    "nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
    "nnoremap \8 :call RelatedFile ( "management/" )<cr>
    "nnoremap \0 :e settings.py<cr>
    "nnoremap \9 :e urls.py<cr>
    "fun! RelatedFile(file)
        "#This is to check that the directory looks djangoish
        "if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
            "exec "edit %:h/" . a:file
            "let g:last_relative_dir = expand("%:h") . '/'
            "return ''
        "endif
        "if g:last_relative_dir != ''
            "exec "edit " . g:last_relative_dir . a:file
            "return ''
        "endif
        "echo "Cant determine where relative file is : " . a:file
        "return ''
    "endfun
    "fun SetAppDir()
        "if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
            "let g:last_relative_dir = expand("%:h") . '/'
            "return ''
        "endif
    "endfun
    "autocmd BufEnter *.py call SetAppDir()


"PHP
    au BufNewFile,BufRead *.php
      \ inoremap <expr> <c-return> SemiColon()|
      \ inoremap $ 4|
      \ inoremap 4 $|
	  \	inoremap . <c-r>=PHPDot()<CR>|
	  \ call StartNeomake()
	  "\ call neomake#configure#automake('w')
      "\ inoremap . ->|
      "\ inoremap <a-.> .

let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

function! MyOnBattery()
  return readfile('/sys/class/power_supply/ACAD/online') == ['0']
endfunction

function StartNeomake()
	"if MyOnBattery()
	  call neomake#configure#automake('w')
	"else
	  "call neomake#configure#automake('nw', 1000)
	"endif
endfunction
	



" JAVA
    autocmd Filetype java setlocal omnifunc=eclim#java#complete#CodeComplete

    au BufNewFile,BufRead *.java
        \ :nmap <F9> :exe ":JavaImportOrganize"<CR>|
        \ :nmap <F8> :exe ":JavaCorrect"<CR>|
        \ :nmap <A-R>  :exe ":JavaRename " input("New name: ")<CR>|
        \ :inoremap <expr> <c-return> SemiColon()|
		\:nnoremap <leader>cg :exe ":GenerateConstructor"<CR>|
		\:nnoremap <leader>cc :exe ":ChainConstructor"<CR>|
		\:vnoremap <leader>cc :exe ":ChainConstructor"<CR>|
		\:nnoremap <leader>cC :exe ":ChainSuper"<CR>|
		:vnoremap <leader>cC :exe ":ChainSuper"<CR>

" mark extra whitespace
     "au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


let python_highlight_all=1


" WORKFLOW"

" semicolon behaviour
    inoremap <leader>; <C-o>m`<C-o>A;<C-o>``

" closing bracket behaviour
    "inoremap " ""<Esc>i
    "inoremap ' ''<Esc>i
    "inoremap ( ()<Esc>i
    "inoremap { {}<Esc>i
    "inoremap {% {%  %}<Esc>2hi
    "inoremap [ []<Esc>i
    "inoremap <leader>{ {
    "inoremap <leader>( (
    "inoremap <leader>[ [
    "inoremap ) <c-r>=ClosePair(')')<CR>
    "inoremap ] <c-r>=ClosePair(']')<CR>
    "inoremap } <c-r>=CloseBracket()<CR>
    "inoremap } <c-r>=ClosePair('}')<CR>
    "inoremap " <c-r>=QuoteDelim('"')<CR>
    "inoremap ' <c-r>=QuoteDelim("'")<CR>
    inoremap <% <%  %><Esc>2hi
    inoremap <%= <%=  %><Esc>2hi


    "inoremap { {<esc>o}<esc>kA
    "inoremap <C-{> {<CR>}<Esc>O

    function QuoteDelim(char)
     let line = getline('.')
     let col = col('.')
     if line[col - 2] == "\\"
     "Inserting a quoted quotation mark into the string
     return a:char
     elseif line[col - 1] == a:char
     "Escaping out of the string
     return "\<Right>"
     else
     "Starting a string
     return a:char.a:char."\<Esc>i"
     endif
    endf

    function ClosePair(char)
     if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
     else
     return a:char
     endif
    endf

    function CloseBracket()
     if match(getline(line('.') + 1), '\s*}') < 0
     return "\<CR>}"
     else
     return "\<Esc>j0f}a"
     endif
    endf

    "autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>

" Search and replace"
	nnoremap  U <C-R>
    "nnoremap <C-r>  :exe SearchAndReplaceLine()<CR>
	nnoremap <C-r>  :call SearchAndReplaceLine()<CR>
	vnoremap <C-r>  <esc>:call SearchAndReplaceSelection()<CR>
	":nmap <C-A-r>  :exe SearchAndReplace()<CR>
    let g:g_query = ""
    let g:g_replace = ""
    function SearchAndReplace()
        echo "Search and Replace (global)"
        let query = input("Search: ")
        let replace = input("Replace: ")
        if len(query) && len(replace)
            execute ':%s/'.query.'/'.replace.'/g'
        endif
    endfunction
	"Search and replace line or selection
    function SearchAndReplaceLine()
        echo "Search and Replace (line)"
        let query = input("Search: ", g:g_query)
        let replace = input("Replace: ")
        if len(query) && len(replace)
			let l:winview = winsaveview()
            let g:g_query = query
            execute ':s/'.query.'/'.replace.'/g'
			call winrestview(l:winview)
        endif
    endfunction
    function! SearchAndReplaceSelection() range
        echo "Search and Replace (selection)"
        let query = input("Search: ", g:g_query)
        let replace = input("Replace: ")
        if len(query) && len(replace)
            let g:g_query = query
            "execute ":'<, '>s/'.query.'/'.replace.'/g"
            call Preserve(":'<, '>s/'.query.'/'.replace.'/g")
        endif
    endfunction

" A wrapper function to restore the cursor position, window position,
" and last search after running a command.
    function! Preserve(command)
      " Save the last search
      let last_search=@/
      " Save the current cursor position
      let save_cursor = getpos(".")
      " Save the window position
      normal H
      let save_window = getpos(".")
      call setpos('.', save_cursor)

      " Do the business:
      execute a:command
      "call a:command

      " Restore the last_search
      let @/=last_search
      " Restore the window position
      call setpos('.', save_window)
      normal zt
      " Restore the cursor position
      call setpos('.', save_cursor)
    endfunction

"Semicolon
    function! SemiColon()
      let line = getline('.')
      let last_char =  line[strlen(line) - 1]
      "if last_char == '{' || last_char == '}'
      "  return "\<esc>o}\<esc>O"
      "else
      if last_char != ';'
        return "\<esc>A;\<esc>o"
      endif
    endfunction

" Enable folding
    set foldmethod=indent
    set foldlevel=99
" Enable folding with the spacebar
    nnoremap <space> za

" toggle F2 for paste
    nnoremap <F2> :set invpaste paste?<CR>
    set pastetoggle=<F2>
    set noshowmode

" tabs in gVim
    nnoremap <a-1> 1gt
    nnoremap <a-2> 2gt
    nnoremap <a-3> 3gt
    nnoremap <a-4> 4gt
    nnoremap <a-5> 5gt
    nnoremap <a-6> 6gt

" save
    nnoremap <C-s> :w<CR>
    inoremap <C-s> <ESC>:w<CR>

" navigations
     "nnoremap <C-J> <C-W><C-J>
     "nnoremap <C-K> <C-W><C-K>
     "nnoremap <C-L> <C-W><C-L>

" close line begin in new line
    inoremap <C-o> <ESC>o

" Custom functions
    fun! PySort() range
        py3file ~/Development/python/code_sorter/main.py
    endfun

    command! PySort call PySort()

" Remapping standard behaviour
    noremap H ^
    noremap L $
    nnoremap ; :
    vmap < <gv
    vmap > >gv
    nmap <a-c> <leader>c<space>
    vmap <a-c> <leader>c<space>
    nmap - @

" Remapping paste
    imap <leader>v <esc>"+pi
    vmap <leader>c "+y

"Split resizing
    nnoremap <silent> <Leader>+ :exe "resize +5 "<CR>
    nnoremap <silent> <Leader>- :exe "resize -5"<CR>

"Show constructor
	nnoremap <silent> <Leader>s :exe "call ShowConstructor()"<CR>

"Update plugins
    nnoremap <silent> <Leader>u :exe ":UpdateRemotePlugins"<CR>

"Remember cursor position between sessions
	try
		autocmd BufReadPost *
			\ if line("'\"") > 0 && line ("'\"") <= line("$") |
			\   exe "normal! g'\"" |
			\ endif
		autocmd BufRead * normal zz
	catch
	endtry

"Remember folds
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview

"set laststatus=2

let g:jchain_include_noargs = 0


function! PHPDot ()
    let l:region = synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
    if l:region == "Constant"
        return "."
    endif
    return "->"
endfunction

