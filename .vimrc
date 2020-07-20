set autoread
set smartindent
set tabstop=4
set expandtab
set shiftwidth=4
set hlsearch
set incsearch
set bs=2
set colorcolumn=80
set nocompatible
set cursorline
set number
set ttimeoutlen=0
set lazyredraw
set noswapfile
set nobackup
set wmnu
set completeopt-=preview " autocomplete preview 없애기
set tw=79
set fo+=t
set fo-=l
set list listchars=tab:·\ ,trail:·,extends:>,precedes:<
set background=dark

filetype plugin on

if has('mac') && filereadable('/usr/local/lib/libInputSourceSwitcher.dylib')
    let g:XkbSwitchEnabled = 1
    let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
endif

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.vim/plugged')

Plug 'powerman/vim-plugin-ansiesc'

" VimWiki
Plug 'vimwiki/vimwiki'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'galooshi/vim-import-js'

" TypeScript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" Vue
Plug 'posva/vim-vue'

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'

" JSON
Plug 'elzr/vim-json'

" YAML
Plug 'stephpy/vim-yaml'

"" Theme
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'lyokha/vim-xkbswitch'
Plug 'jszakmeister/vim-togglecursor'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'majutsushi/tagbar'
" Plug 'valloric/youcompleteme', { 'do': 'python3 ./install.py --clang-completer --go-completer --js-completer'}
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
" Plug 'Chiel92/vim-autoformat'

" Rust
Plug 'rust-lang/rust.vim'

" Python
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Coc
Plug 'neoclide/coc.nvim', {'tag': '*'}

" Terraform
Plug 'hashivim/vim-terraform'

call plug#end()

"VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Color
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_indent_guides = 1
let g:gruvbox_invert_tabline = 1
colorscheme gruvbox

" Keymap
let mapleader = "\<Space>"
let maplocalleader = "\\"
nnoremap <CR> :

" FileTypes
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0
autocmd Filetype vue setlocal ts=2 sw=2 sts=0

" Typescript
let g:tsuquyomi_shortest_import_path = 1

" Go
" GoVim
" let g:go_fmt_command = "goimports"
let g:go_jump_to_error = 0
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_operators = 1
let g:go_auto_type_info = 0
let g:go_auto_sameids = 1

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<enter>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/ultisnips']

" youcompleteme
" let g:ycm_key_list_select_completion = ['<C-n>']    " 본래 <Tab> 이지만 ultisnip 과 충돌을 막기 위해 변경
" let g:ycm_key_list_previous_completion=['<C-p>']
" let g:ycm_server_python_interpreter = '/usr/local/Cellar/python/3.7.3/bin/python3.7'

" startify
let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   Recent files']            },
            \ ]
let g:startify_bookmarks = [
            \ {'vimrc': '~/.vimrc'}
            \ ]

" NERDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapible = '▾'

" gutentags
" let g:gutentags_ctags_exclude=["node_modules"]
" let g:gutentags_resolve_symlinks = 1

" EayMotion
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
map  <Leader>  <Plug>(easymotion-prefix)
vmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap <Leader>f <Plug>(easymotion-overwin-f2)
nmap <Leader>v <Plug>(easyoperator-line-select)
nmap <Leader>d <Plug>(easyoperator-line-delete)
nmap <Leader>y <Plug>(easyoperator-line-yank)
nmap <Leader>l <Plug>(easymotion-lineforward)
vmap <Leader>l <Plug>(easymotion-lineforward)
nmap <Leader>j <Plug>(easymotion-j)
vmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
vmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>h <Plug>(easymotion-linebackward)
vmap <Leader>h <Plug>(easymotion-linebackward)

" NERDTree
vmap <Leader>1 :NERDTreeToggle<CR>
nmap <Leader>1 :NERDTreeToggle<CR>
vmap <Leader>b :NERDTreeFocus<CR>
nmap <Leader>b :NERDTreeFocus<CR>

" Tagbar
nnoremap <LocalLeader>t :TagbarToggle<CR>
nnoremap <Leader>w :exe 'tjump ' . expand("<cword>")<CR>

" Multicursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ALE
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
"             \     'javascript': ['eslint'],
"             \     'typescript': ['tslint'],
"             \     'vue': ['eslint'],
"             \     'python': ['yapf']
"             \ }
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 0

" Emmet
let g:user_emmet_leader_key=','

" Hooks
au BufWritePost *.html silent :call Pretty(expand("%:p"))

" augroup jsOnSave
"     autocmd!
"     au BufWritePre *.js silent execute ":ImportJSFix"
"     au BufWritePost *.js silent :call JS(expand("%:p"))
" augroup END

au BufWritePost *.scss silent :call Pretty(expand("%:p"))
au BufWritePost *.yaml silent :call PrettyYAML(expand("%:p"))
au BufWritePost *.yml silent :call PrettyYAML(expand("%:p"))
" autocmd BufWritePost *.ts silent :call TsLint(expand("%:p"))
autocmd BufWritePost *.go silent :call GoImport(expand("%:p"))

function! JS(filePath)
    silent execute '!prettier --write --single-quote --jsx-single-quote ' . '--trailing-comma es5 --tab-width 2 '. a:filePath
    let path = system('pwd')[:-2]
    let rootPath = path . "/node_modules/.bin/eslint"
    silent execute '!' . rootPath . ' --fix ' . a:filePath
    execute ':redraw!'
    execute ':e!'
endfunction

function! Spell()
    let l:oldReg = getreg('"')
    normal! gv"ay
    let l:text = getreg('"')
    silent call setreg('"', l:oldReg)

    let l:result = system("spell-checker '" . l:text . "'")

    execute "new"
    silent call setline(1, l:result)

    execute ':%s/\%x00/\r/g'
    execute ':AnsiEsc'
endfunction

function! OpenTerminal()
    term_start("NONE", {"term": "open"})
endfunction

command! Spell call Spell()
command! Ot call OpenTerminal()

function! Pretty(filePath)
    execute "!prettier --write --tab-width 2 ". a:filePath
    execute ":redraw!"
endfunction

function! PrettyYAML(filePath)
    execute "!prettier --write ". a:filePath
    execute ":redraw!"
endfunction

function! GoImport(filePath)
    let path = system("pwd")
    let idx = stridx(path, 'src/')
    let localPath = path[idx+4:-2]
    execute "!goimports -local " . localPath . " -w " . a:filePath
endfunction

function! TsLint(filePath)
    let path = system("pwd")
    execute "!tslint " . a:filePath . " --fix -p " . path
    execute ":redraw!"
endfunction

function! DeleteWithCount()
    execute 'normal! v' . strchars(getreg("")) . 'l"_d'
endfunction

function! OpenTerminalInCurrentPath()
    let path = system("pwd")
    execute ":cd " . expand("%:p:h")
    execute ":below terminal"
    execute ":cd " . path
endfunction

function! RunTest()
    let path = system("pwd")
    execute ":cd " . expand("%:p:h")
    execute ":below term ginkgo watch -v -r"
    execute ":cd " . path
endfunction

function! RunTestFunc()
    let test = search('It', "bcnW")
    if test == 0
        echo "vim-go: [test] no test found immediate to cursor"
        return
    end
    let line = getline(test)
    let name = split(split(line, "It(")[1], ",")[0]
    echo name
    let path = system("pwd")
    execute ":cd " . expand("%:p:h")
    execute ":below term ginkgo watch -v -r --focus=" . name
    execute ":cd " . path
endfunction

function! ShowCoverage()
    abc path = system("pwd")
    execute ":cd " . expand("%:p:h")
    execute ":!ginkgo -cover -coverprofile=coverage.out;go tool cover -html=coverage.out"
    execute ":cd " . path
endfunction

" Run
nnoremap <leader>t :call OpenTerminalInCurrentPath()<CR>
nnoremap <leader>r :call RunTest()<CR>
nnoremap <leader>e :call RunTestFunc()<CR>
nnoremap <leader>n :NERDTreeFind "%p"<CR>
nnoremap <leader>c :call ShowCoverage()<CR>
nnoremap <leader><Esc> :below terminal<CR>

" 편집기 기능
nmap <leader>s :wa<CR>
nmap <LocalLeader>s :Startify<CR>
nmap <LocalLeader><LocalLeader>s :SSave<CR>
nmap <leader>i :vs<CR><c-w>l

" 탐색
nnoremap <leader>a :call fzf#vim#ag('', {'options': '--delimiter : --nth 4..'})<CR>
nnoremap <leader>o :call fzf#vim#tags('^', {'options': '--exact --select-1 --exit-0 +i'})<CR>
nnoremap <c-p> :Files<CR>

" 편집
nnoremap Y y$
nnoremap <c-k> ddkkp
nnoremap <c-j> ddp
nnoremap <leader>p "*p
" nnoremap <leader>y "*y
vnoremap <leader>p "*p
vnoremap <leader>y "*y
nnoremap dv :call DeleteWithCount()<CR>p
vnoremap dp "_dP


" Abbr
iabbr tset test
iabbr blcokchain blockchain
iabbr blcok block
iabbr BlockHader BlockHeader
iabbr conosle console
iabbr exapmle example

