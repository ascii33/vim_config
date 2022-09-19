
" 标准设置
" Typing ":set xxx" sets the option "xxx".  Some options are:
"       'ic' 'ignorecase'       ignore upper/lower case when searching
"      'is' 'incsearch' show partial matches for a search phrase
"      'hls' 'hlsearch' highlight all matching phrases
" Prepend "no" to switch an option off:   :set noic

set shortmess=atI " disable start hint
syntax enable
syntax on

" syntax enable
" set re=1
" set lazyredraw
" set synmaxcol=128
" syntax sync minlines=256


" set ic " Ignore case, To disable ignoring case enter: set noic
set hls " hlsearch, remove the highlighting: nohlsearch
set nu " set number
set ts=4       "tabstop Tab键替换的空格长度，默认8
" set softtabstop=4   " 退格键退回缩进空格的长度
set shiftwidth=4    " 表示每一级缩进的长度
set expandtab       " 设置缩进用空格来表示;空格替换为TAB set noexpandtab 
 
 set autoindent 
 set cindent 
 set smartindent 

" set list " display tabs and white space


" set fillchars=vert:\ ,stl:\ ,stlnc:\ 

" set font
" set guifont=dejaVu\ Sans\ MONO\ 10
" set guifont=Courier_New:h10:cANSI


"------ 代码折叠功能 ------
"激活折叠功能"
set foldenable
"set nofen（这个是关闭折叠功能）"

"设置按照语法方式折叠（可简写set fdm=XX）"
"有6种折叠方法：
"manual   手工定义折叠"
"indent   更多的缩进表示更高级别的折叠"
"expr     用表达式来定义折叠"
"syntax   用语法高亮来定义折叠"
"diff     对没有更改的文本进行折叠"
"marker   对文中的标志进行折叠"
" set foldmethod=manual
"set fdl=0（这个是不选用任何折叠方法）"

"设置折叠区域的宽度"
"如果不为0，则在屏幕左侧显示一个折叠标识列
"分别用“-”和“+”来表示打开和关闭的折叠
" set foldcolumn=0

"设置折叠层数为3"
" setlocal foldlevel=3

"设置为自动关闭折叠"
" set foldclose=all

"用空格键来代替zo和zc快捷键实现开关折叠"
"zo O-pen a fold (打开折叠)
"zc C-lose a fold (关闭折叠)
"zf F-old creation (创建折叠)
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

set ruler
" set statusline=%F%m%r%h%w\ %=#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%
" set rulerformat=%43(%=%m%r%h%w#%n\ [%{&fileformat}:%{(&fenc==\"\"?&enc:&fenc).((exists(\"\+bomb\")\ &&\ &bomb)?\"\+B\":\"\").\"\"}:%{strlen(&ft)?&ft:'**'}]\ [%L\\%l,%c]\ %p%%%)
set laststatus=1 " 0:disable 1:only one 2:always      

" ------ mouse ------
" set mouse=a  " always use mouse
" set mousehide " 设置隐藏鼠标光标。

if has('nvim')
set clipboard=unnamed " 与windows共享剪贴板
else
set clipboard=autoselect  " 可视模式下选择的文本就会被放到系统剪切板中
endif

" if exists('$TMUX')
"     let s:isTmux=1
" else
"     let s:isTmux=0
" endif
" if has('clipboard')
"     if s:isTmux
"         set clipboard=
"     elseif has ('unnamedplus')
"         When possible use + register for copy-paste
"         set clipboard=unnamedplus
"         " <Leader>{P,p},鼠标中键 粘贴'+'寄存器内容
"         nnoremap <silent> <Leader>P "+P
"         nnoremap <silent> <Leader>p "+p
"         nnoremap <silent> <MiddleMouse> "+P
"         inoremap <silent> <MiddleMouse> <C-R>+
"     else
"         " On Mac and Windows, use * register for copy-paste
"         set clipboard=unnamed
"         " <Leader>{P,p},鼠标中键 粘贴'*'寄存器内容
"         nnoremap <silent> <Leader>P "*P
"         nnoremap <silent> <Leader>p "*p
"         nnoremap <silent> <MiddleMouse> "*P
"         inoremap <silent> <MiddleMouse> <C-R>*
"     endif
" endif


" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

set scrolloff=2 " 上下可视行数

" ------ plug ------
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" taglist.vim : Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)
" created by Yegappan Lakshmanan, The Github repository https://github.com/yegappan/taglist
Plug 'yegappan/taglist', { 'tag':  'v4.6' }

" The NERD tree : A tree explorer plugin for navigating the filesystem
" created by Marty Grenfell, https://github.com/preservim/nerdtree.git
Plug 'preservim/nerdtree', { 'tag': '6.10.16', 'on': 'NERDTreeToggle' }

" Explorer extension for coc.nvim
" https://github.com/weirongxu/coc-explorer.git
Plug 'weirongxu/coc-explorer'

" Defx is a dark powered plugin for Neovim/Vim to browse files. It replaces the deprecated vimfiler plugin.
" https://github.com/Shougo/defx.nvim.git
if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" checksyntax : Check for syntax errors (r, javascript, php, ruby, tex ...)
" created by Tom Link, http://github.com/tomtom/checksyntax_vim/
Plug 'tomtom/checksyntax_vim', { 'tag': '5.00' }

Plug 'honza/vim-snippets'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" LeaderF: An efficient fuzzy finder that helps to locate files, buffers, mrus, gtags, etc. on the fly.
" https://github.com/Yggdroot/LeaderF.git
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" 
" " Any valid git URL is allowed
" Plug 'junegunn/vim-github-dashboard'
 
" The NERD Commenter : A plugin that allows for easy commenting of code for many filetypes.
" created by Marty Grenfell https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Command-T : Fast file navigation for VIM
" created by Greg Hurrell: https://github.com/wincent/command-t
Plug 'wincent/command-t'

Plug './project'
Plug './global-6.6.8'
Plug './cscope-15.9'

" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim' 

" https://github.com/vim-airline/vim-airline.git
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" molokai : A port of the monokai scheme for TextMate
" created by Tomas Restrepo: https://github.com/tomasr/molokai
Plug 'tomasr/molokai'

" gruvbox is heavily inspired by badwolf, jellybeans and solarized.
" https://github.com/morhetz/gruvbox.git
Plug 'morhetz/gruvbox'

" Fugitive is the premier Vim plugin for Git
" https://github.com/tpope/vim-fugitive.git
Plug 'tpope/vim-fugitive'

" Solarized Colorscheme for Vim 
" https://github.com/altercation/vim-colors-solarized.git
Plug 'altercation/vim-colors-solarized'

" Initialize plugin system
call plug#end()



" ------ Project ------

" Project set
 let g:proj_flags="icstg"
 nmap <silent> <F9> <Plug>ToggleProject

" ------ Taglist ------

 let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的
 let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim
 let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联

 let Tlist_Use_Left_Window = 1
 let Tlist_Use_Right_Window = 0
 let Tlist_Sort_Type = "order" "sort order by setting to 'name' or 'order'

" creates a normal mode mapping for the <F10> key to toggle the taglist window.
 nnoremap <silent> <F10> :TlistToggle<CR>


" ------ NERD Tree ------

" How can I open a NERDTree automatically when vim starts up?
" autocmd VimEnter * NERDTree

" How can I open a NERDTree automatically when vim starts up if no files were specified?
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" How can I map a specific key or shortcut to open NERDTree?
 map <F12> :NERDTreeToggle<CR>

" How can I close vim if the only window left open is a NERDTree?
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" How can I change default arrows?
" Use these variables in your vimrc. Note that below are default arrow symbols
 let g:NERDTreeDirArrows = 1
 let g:NERDTreeDirArrowExpandable = '▸'
 let g:NERDTreeDirArrowCollapsible = '▾'

 let g:NERDTreeWinPos='right'
 let NERDTreeShowHidden=0


" -------- coc-explorer -------- 
" nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

" ------ cscope taglist path ------
 set cscopequickfix=s-,c-,d-,i-,t-,e-
 set tags=./tags;,tags
"  cs add ~/work/btstack/cscope.out ~/work/btstack
"  set tags+=~/work/btstack/tags

"  cs add ~/work/fluoride/cscope.out ~/work/fluoride
"  set tags+=~/work/fluoride/tags


" ------ global tags ------
 let $GTAGSCONF = '/usr/share/gtags/gtags.conf'
 set cscopetag " 使用 cscope 作为 tags 命令
 set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

 let GtagsCscope_Auto_Load = 1
 let CtagsCscope_Auto_Map = 1
 let GtagsCscope_Quiet = 1


" ------ FZF ------ 
" "<Leader>f在当前目录搜索文件
" nnoremap <silent> <Leader>f :Files<CR>
" "<Leader>b切换Buffer中的文件
" nnoremap <silent> <Leader>b :Buffers<CR>
" "<Leader>p在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
" nnoremap <silent> <Leader>p :Lines<CR>
" "<Leader>h在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
" nnoremap <silent> <Leader>h :History<CR>
" "调用Rg进行搜索，包含隐藏文件
" "command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)


" ------ nerdcomment ------ 
" " Create default mappings
" let g:NERDCreateDefaultMappings = 1
"
" " Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
"
" " Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
"
" " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
"
" " Set a language to use its alternate delimiters by default
" let g:NERDAltDelims_java = 1
"
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
"
" " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
"
" " Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 1
"
" " Enable NERDCommenterToggle to check all selected lines is commented or not
" let g:NERDToggleCheckAllLines = 1


" ------ Molokai ------
" If you prefer the scheme to match the original monokai background color, put this in your .vimrc file:
" let g:molokai_original = 1
" There is also an alternative scheme under development for color terminals which attempts to bring the 256 color version as close as possible to the the default (dark) GUI version. To access, add this to your .vimrc:
" let g:rehash256 = 1
"
"
"
