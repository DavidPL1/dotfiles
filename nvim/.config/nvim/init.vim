syntax on
set nowrap
set encoding=utf8

""" START Vundle Config

    " Disable file type for vundle
    filetype off

    set rtp+=~/.config/nvim/bundle/Vundle.vim
    call vundle#begin()

    " Let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    
    """"" Utility
    " Directory tree
    Plugin 'scrooloose/nerdtree'
    " Autocompletion stuff
    Plugin 'ervandew/supertab'
    " Move windows without destroying the layout
    Plugin 'wesQ3/vim-windowswap'
    " Damn those snippets
    Plugin 'SirVer/ultisnips'
    " Align text
    Plugin 'godlygeek/tabular'
    " Search for 'TODO', 'FIXME' and 'XXX' in every file
    Plugin 'gilsondev/searchtasks.vim'
    " Next level autocompletion framework
    Plugin 'Shougo/neocomplete.vim'
    " Nord color theme
    Plugin 'arcticicestudio/nord-vim'

   
    """"" Generic Programming Support
    " ctags
    Plugin 'rentalcustard/exuberant-ctags'
    " Snippets for ultisnips
    Plugin 'honza/vim-snippets'
    " Autoclose parentheses etc.
    Plugin 'townk/vim-autoclose'
    " Syntax checking
    Plugin 'vim-syntastic/syntastic'
    

    """"" Git Support
    " Interactive git log viewing
    Plugin 'kablamo/vim-git-log'
    " Repository viewer
    Plugin 'gregsexton/gitv'
    " Nice git integration
    Plugin 'tpope/vim-fugitive'


    """"" Theme
    "Plugin 'vim-airline/vim-airline'
    "Plugin 'vim-airline/vim-airline-themes'
    "Plugin 'ryanoasis/vim-devicons'
    Plugin 'ajh17/spacegray.vim'

    call vundle#end()
    filetype plugin indent on
    """" End Vundle config

"""""""""
" NVIM CONFIG SECTION
"""""""""

" Show linenumbers
set number
set ruler

" Proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display statusline
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Arrows resize windows!
let g:elite_mode=1

" Theme/Style
"set t_Co=256
"set background=dark

if (has("termguicolors"))
"    set termguicolors
endif

" Vim-Airline Configuration
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1 
"let g:airline_theme='hybrid'
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" Vim-UtilSnips Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3


"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>



" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>
endif
