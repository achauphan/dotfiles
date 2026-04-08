"=== KEY BINDS"

" map ctrl+q to be same as ctrl+y
" for page scroll up
map <C-Q> <C-Y>

"=== SPACING
set tabstop=4
set shiftwidth=4
set expandtab

set number
set ruler
set wrap
set showmatch

" enable Python syntax highlighting
: let python_highlight_all=1

set guitablabel=\[%N\]\ %t\ %M

"splits
set splitright

"split navs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" fold blocks
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

set title
set statusline+=%F
set laststatus=2

set path+=**

syntax on
" redraw time infinite (ran into issue reading codeql typescript?)
"set rdt=0
set re=0
colorscheme default
set hlsearch
hi Search ctermbg=Green
hi Search ctermfg=Black
hi Comment ctermfg=LightBlue


" ===== PLUGINS ===== (https://github.com/junegunn/vim-plug)
" Install with :PlugInstall
call plug#begin()

" List your plugins here
Plug 'rust-lang/rust.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" vim-lsp configs
let g:lsp_diagnostics_enabled = 1
" disable the horrible in-line diagnostics
let g:lsp_diagnostics_virtual_text_enabled = 0
" echo diagnostics to status bar
let g:lsp_diagnostics_echo_cursor = 1
" enable diagnostic signs on the left grey thingy
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_loc_list_enabled = 1
" disable hover highlights for same symbols
let g:lsp_document_highlight_enabled = 0

augroup LspRustMappings
  autocmd!
  autocmd User lsp_buffer_enabled call s:lsp_buffer_maps()
augroup END

" Format Rust buffers on save using LSP (rust-analyzer -> rustfmt)
augroup RustFormatOnSave
  autocmd!
  autocmd BufWritePre *.rs silent! LspDocumentFormatSync
augroup END


function! s:lsp_buffer_maps() abort
  nnoremap <buffer> gd <plug>(lsp-definition)
  nnoremap <buffer> gD <plug>(lsp-declaration)
  nnoremap <buffer> gr <plug>(lsp-references)
  nnoremap <buffer> gi <plug>(lsp-implementation)
  nnoremap <buffer> K  <plug>(lsp-hover)
endfunction

" vim-lsp rust-analyzer registration
" REQUIERS rust-analyzer binary installed
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \   'initialization_options': {
        \     'cargo': {
        \       'buildScripts': {
        \         'enable': v:true,
        \       },
        \     },
		\ 	  'rustfmt': { 'overrideCommand': ['rustfmt'] },
        \     'procMacro': {
        \       'enable': v:true,
        \     },
        \   },
        \ })
endif

