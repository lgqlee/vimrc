call pathogen#infect()
let mapleader=","
noremap \ ,
set nocompatible
set viminfo='1000,f1,:1000,/1000
set history=1000
set lines=35
set columns=100
set background=dark
"------  Visual Options  ------
syntax on
set number
set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{fugitive#statusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

" Toggle whitespace visibility with ,s
nmap <Leader>s :set list!<CR>
set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×,eol:¬

" ,L = Toggle line numbers
map <Leader>L :set invnumber<CR>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
"------  Generic Behavior  ------
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent
"set expandtab
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,node_modules/*

"allow deletion of previously entered data in insert mode
set backspace=indent,eol,start

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! %!sudo tee > /dev/null %

" F2 = Paste Toggle (in insert mode, pasting indented text behavior changes)
set pastetoggle=<F2>

" ,v = Paste
map <Leader>v "+gP

" ,c = Copy
map <Leader>c "+y

" Accidentally pressing Shift K will no longer open stupid man entry
noremap K <nop>

" Edit and Reload .vimrc files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>

" When pressing ,cd switch to the directory of the open buffer
map ,cd :cd %:p:h<CR>

" Wtf is Ex Mode anyways?
nnoremap Q <nop>

"------  Text Navigation  ------
" Prevent cursor from moving to beginning of line when switching buffers
set nostartofline

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" H = Home, L = End
noremap H ^
noremap L $
vnoremap L g_


"------  Window Navigation  ------
" ,hljk = Move between windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


"------  Buffer Navigation  ------
" Ctrl Left/h & Right/l cycle between buffers
noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

" ,q Closes the current buffer
nnoremap <silent> <Leader>q :Bclose<CR>

" ,Q Closes the current window
nnoremap <silent> <Leader>Q <C-w>c


"------  Searching  ------
set incsearch
set ignorecase
set smartcase
set hlsearch

" Clear search highlights when pressing ,b
nnoremap <silent> <leader>b :nohlsearch<CR>

" http://www.vim.org/scripts/script.php?script_id=2572
" ,a will open a prmompt for a term to search for
noremap <leader>a :Ack 

" ,A will close the new window created for that ack search
noremap <leader>A <C-w>j<C-w>c<C-w>l

let g:ackprg="ack -H --nocolor --nogroup --column --type-add php=.tpl"

" When searching for words with * and navigating with N/n, keep line centered vertically
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" CtrlP will load from the CWD, makes it easier with all these nested repos
let g:ctrlp_working_path_mode = ''

"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s//g<LEFT><LEFT>
vmap S :s//g<LEFT><LEFT>


"------  NERDTree Options  ------
let NERDTreeIgnore=['CVS','\.dSYM$']

"setting root dir in NT also sets VIM's cd
let NERDTreeChDirMode=2

" Toggle visibility using ,n
noremap <silent> <Leader>n :NERDTreeToggle<CR>

" These prevent accidentally loading files while focused on NERDTree
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>

" Open NERDTree if we're executing vim without specifying a file to open
autocmd vimenter * if !argc() | NERDTree | endif

" Close if only NERDTree open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Hides "Press ? for help"
let NERDTreeMinimalUI=1

"------  Tagbar Plugin Options  ------
" http://adamyoung.net/Exuberant-Ctags-OS-X
" http://www.vim.org/scripts/script.php?script_id=273
"let g:tagbar_width=26
"noremap <silent> <Leader>y :TagbarToggle<CR>
"let g:tagbar_ctags_bin='/usr/bin/ctags'
" ,ct = Builds ctags
"map <Leader>ct :! /usr/local/bin/ctags -R *<CR>

"进行Tlist的设置
""TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> 
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

"------  Fugitive Plugin Options  ------
"https://github.com/tpope/vim-fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gm :Gmove 
nnoremap <Leader>gp :Ggrep 
nnoremap <Leader>gR :Gread<CR>
nnoremap <Leader>gg :Git 
nnoremap <Leader>gd :Gdiff<CR>


"------  Text Editing Utilities  ------
" ,T = Delete all Trailing space in file
map <Leader>T :%s/\s\+$//<CR>

" ,U = Deletes Unwanted empty lines
map <Leader>U :g/^$/d<CR>

" ,R = Converts tabs to spaces in document
map <Leader>R :retab<CR>

" Deletes trailing space in file upon write
" autocmd BufWritePre * :%s/\s\+$//e


"------  JSON Filetype Settings  ------
au BufRead,BufNewFile *.json set filetype=json
let g:vim_json_syntax_conceal = 0
nmap <silent> =j :%!python -m json.tool<CR>:setfiletype json<CR>


"------  CoffeeScript Filetype Settings  ------
au BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
au BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!


"------  PHP Filetype Settings  ------
" ,p = Runs PHP lint checker on current file
map <Leader>p :! php -l %<CR>

" ,P = Runs PHP and executes the current file
map <Leader>P :! php -q %<CR>

au FileType php set omnifunc=phpcomplete#CompletePHP

"------  GUI Options  ------
if has("gui_running")

	" Hides toolbar and scrollbars and File menu
	set guioptions=egt

	" Highlights the current line background
	set cursorline
	"colorscheme Tomorrow-Night

	"autocmd VimEnter * TagbarOpen

	"Invisible character colors
	highlight NonText guifg=#4a4a59
	highlight SpecialKey guifg=#4a4a59
	if has("gui_macvim") " OS X
		"set guifont=Monaco:h14
		set guifont=Monaco:h12
		"set noantialias
		"set transparency=15

		" Swipe to move between bufers :D
		map <silent> <SwipeLeft> :bprev<CR>
		map <silent> <SwipeRight> :bnext<CR>

		" Cmd+Shift+N = new buffer
		map <silent> <D-N> :enew<CR>

		" Cmd+t = new tab
		nnoremap <silent> <D-t> :tabnew<CR>

		" Cmd+w = close tab (this should happen by default)
		nnoremap <silent> <D-w> :tabclose<CR>

		" Cmd+1...9 = go to that tab
		map <silent> <D-1> 1gt
		map <silent> <D-2> 2gt
		map <silent> <D-3> 3gt
		map <silent> <D-4> 4gt
		map <silent> <D-5> 5gt
		map <silent> <D-6> 6gt
		map <silent> <D-7> 7gt
		map <silent> <D-8> 8gt
		map <silent> <D-9> 9gt

		" OS X probably has ctags in a weird place
		let g:tagbar_ctags_bin='/usr/bin/ctags'

	elseif has("gui_gtk2") " Linux
		set guifont=monospace\ 9

		" Alt+n = new buffer
		map <silent> <A-n> :enew<CR>

		" Alt+t = new tab
		nnoremap <silent> <A-t> :tabnew<CR>

		" Alt+w = close tab
		nnoremap <silent> <A-w> :tabclose<CR>

		" Alt+1...9 = go to that tab
		map <silent> <A-1> 1gt
		map <silent> <A-2> 2gt
		map <silent> <A-3> 3gt
		map <silent> <A-4> 4gt
		map <silent> <A-5> 5gt
		map <silent> <A-6> 6gt
		map <silent> <A-7> 7gt
		map <silent> <A-8> 8gt
		map <silent> <A-9> 9gt

	elseif has("gui_win32") " Windows
		" WHAT ARE YOU DOING WITH YOUR LIFE?!
	endif
else
	set t_Co=256
	"colorscheme Mustang
	set mouse=a
endif

"------  Local Overrides  ------
if filereadable($HOME.'/.vimrc_local')
	source $HOME/.vimrc_local
endif

filetype off                  " required!  
  
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'taglist.vim'

filetype plugin indent on

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"add dict
autocmd FileType javascript set dictionary+=$VIMFILES/bundle/vim-node/dict/node.dict
