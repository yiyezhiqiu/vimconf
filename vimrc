set nocompatible
set number
filetype on
set history=1000
set background=dark
syntax on
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set showmatch
set guioptions-=T
set ruler
set nohls
set incsearch
set hlsearch

set pastetoggle=<F9>
"set list
"set listchars=tab:>-,trail:-

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on " load filetype plugins/indent settings
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType c setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType cpp setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType sh setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2 

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

nmap <F8> :TagbarToggle<CR>

" NerdTree {
 nmap <F3> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
 
 let NERDTreeShowBookmarks=1
 let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
 let NERDTreeChDirMode=0
 let NERDTreeQuitOnOpen=1
 let NERDTreeMouseMode=2
 let NERDTreeShowHidden=1
 let NERDTreeKeepTreeInNewTab=1
 let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

set completeopt=menu

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
