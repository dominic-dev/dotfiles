"General settings
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
    "   \ set smartindent |
        \ set smarttab | 
        \ set fileformat=unix
" Django shortkeys
    let g:last_relative_dir = ''
    nnoremap \1 :call RelatedFile ("models.py")<cr>
    nnoremap \2 :call RelatedFile ("views.py")<cr>
    nnoremap \3 :call RelatedFile ("urls.py")<cr>
    nnoremap \4 :call RelatedFile ("admin.py")<cr>
    nnoremap \5 :call RelatedFile ("tests.py")<cr>
    nnoremap \6 :call RelatedFile ( "templates/" )<cr>
    nnoremap \7 :call RelatedFile ( "templatetags/" )<cr>
    nnoremap \8 :call RelatedFile ( "management/" )<cr>
    nnoremap \0 :e settings.py<cr>
    nnoremap \9 :e urls.py<cr>
    fun! RelatedFile(file)
        #This is to check that the directory looks djangoish
        if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
            exec "edit %:h/" . a:file
            let g:last_relative_dir = expand("%:h") . '/'
            return ''
        endif
        if g:last_relative_dir != ''
            exec "edit " . g:last_relative_dir . a:file
            return ''
        endif
        echo "Cant determine where relative file is : " . a:file
        return ''
    endfun
    fun SetAppDir()
        if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
            let g:last_relative_dir = expand("%:h") . '/'
            return ''
        endif
    endfun
    autocmd BufEnter *.py call SetAppDir()


"PHP
    au BufNewFile,BufRead *.php
      \ inoremap <expr> <c-return> SemiColon()|
      \ inoremap $ 4|
      \ inoremap 4 $|
      \ inoremap . ->|
      \ inoremap <a-.> .

" JAVA
    autocmd Filetype java setlocal omnifunc=eclim#java#complete#CodeComplete

    au BufNewFile,BufRead *.java
        \ :nmap <F9> :exe ":JavaImportOrganize"<CR>|
        \ :nmap <F8> :exe ":JavaCorrect"<CR>|
        "\ :command Jet JavaGet|
        "\ :command Jset JavaSet|
        "\ :command Jgetset JavaGetSet|
        "\ :command GC JavaConstructor|
        \ :nmap <A-R>  :exe ":JavaRename " input("New name: ")<CR>|
        \ inoremap <expr> <c-return> SemiColon()

        " \ :nmap <F9> :exe ":Ant jar"<CR> :exe ":Ant run"<CR> |
        " \ :nmap <F11> :exe ":Ant jar"<CR> |
        " \ :nmap <F12> :exe ":Ant run"<CR> |

" mark extra whitespace
     "au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


let python_highlight_all=1


" WORKFLOW"

" semicolon behaviour
    inoremap <leader>; <C-o>m`<C-o>A;<C-o>``

" closing bracket behaviour
    inoremap " ""<Esc>i
    inoremap ' ''<Esc>i
    inoremap ( ()<Esc>i
    inoremap { {<esc>o}<esc>kA
    inoremap {% {%  %}<Esc>2hi
    inoremap [ []<Esc>i
    "inoremap <C-{> {<CR>}<Esc>O
    inoremap <leader>{ {
    inoremap <leader>( (
    inoremap <leader>[ [
    inoremap ) <c-r>=ClosePair(')')<CR>
    inoremap ] <c-r>=ClosePair(']')<CR>
    inoremap } <c-r>=CloseBracket()<CR>
    inoremap } <c-r>=ClosePair('}')<CR>
    inoremap " <c-r>=QuoteDelim('"')<CR>
    inoremap ' <c-r>=QuoteDelim("'")<CR>

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
    :nmap <C-H>  :exe SearchAndReplaceLine()<CR>
    :nmap <C-A-H>  :exe SearchAndReplace()<CR>
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
    function SearchAndReplaceLine()
        echo "Search and Replace (line)"
        let query = input("Search: ", g:g_query)
        let replace = input("Replace: ")
        if len(query) && len(replace)
            let g:g_query = query
            execute ':s/'.query.'/'.replace.'/g'
        endif
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
    set showmode

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

" split navigations
    " nnoremap <C-J> <C-W><C-J>
    " nnoremap <C-K> <C-W><C-K>
    " nnoremap <C-L> <C-W><C-L>
    " nnoremap <C-H> <C-W><C-H>

" close line begin in new line
    inoremap <C-o> <ESC>o

" Custom functions
    fun! PySort() range
        py3file ~/Development/python/code_sorter/main.py
    endfun

    command! PySort call PySort()

" Remapping standard behaviour
    noremap H ^
    noremap L g_ 
    nnoremap ; :
    vmap < <gv
    vmap > >gv

" Remapping paste
    imap <leader>v <esc>"+pi
    vmap <leader>c "+y

"Remember cursor position between sessions
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
    autocmd BufRead * normal zz

"Remember folds
    augroup remember_folds
        autocmd!
        autocmd BufWinLeave *.* mkview
        autocmd BufWinEnter *.* loadview
    augroup END
