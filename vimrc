""""""""""""""""""""""""""""""""""""""""
"  Don't bother with vi compatibility  "
""""""""""""""""""""""""""""""""""""""""
set nocompatible
nnoremap  - :
nnoremap j gj
nnoremap k gk
syntax on
nnoremap / /\V
vnoremap / /\V
setlocal foldmethod=indent

""""""""""""""""
" Disable keys "
"""""""""""""""
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" " yanked stack (also, in visual mode)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> dd "_dd

vnoremap <silent> dd "_dd

""""""""""""""""""""""
"  Configure Vundle  "
""""""""""""""""""""""
filetype on " without this vim emits a zero exit status, later, because of :ft off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ensure ftdetect et al work by including this after the Vundle stuff  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

"""""""""""""""""""""
"  Global keyboard  "
"""""""""""""""""""""

set autoindent
set linebreak
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamedplus                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show us line
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set hidden
set noerrorbells 
set visualbell
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set number relativenumber
set nospell
set splitbelow                                              " New split panel bottom
" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable
let g:session_autosave = 'no'

"" Past command
nnoremap P o<ESC>p
nnoremap <leader>p O<ESC>p

"""""""""""""""""""""""""""""""
"  Vim-latex-preview setting  "
"""""""""""""""""""""""""""""""
autocmd Filetype tex setl updatetime=5
let g:livepreview_previewer = 'mupdf'
let g:vimtex_view_method = 'mupdf'
"let g:livepreview_engine = 'xelatex'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Enable basic mouse behavior such as resizing buffers  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a
"if exists('$TMUX')  " Support resizing in tmux
"  set ttymouse=xterm2
"endif


"""""""""""""""""""""""
"  vim-tmux-navigator "
"""""""""""""""""""""""
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

""""""""""""""""""""""""
"  keyboard shortcuts  "
""""""""""""""""""""""""
inoremap jk <ESC>
let maplocalleader = ";"
let mapleader = ','

noremap <silent> <leader>R :RMarkdown pdf<CR> 
noremap ;; :%s:::g<Left><Left><Left>
noremap ;' :%s:::cg<Left><Left><Left><Left>
"noremap <C-h> <C-W>h
"noremap <C-j> <C-W>j
"noremap <C-k> <C-W>k
"noremap <C-l> <C-W>l
noremap <leader>l :Align
nnoremap <leader>a :Ack<space>
nnoremap <leader>s :CtrlSF<space>
nnoremap <leader>r :Rg<space>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
noremap <silent> <leader>v :e ~/.vimrc<CR>
noremap <silent> <leader>vb :e ~/.vimrc.bundles<CR>
noremap <silent> <leader>E :setlocal spell spelllang=en_us<CR>
inoremap <leader><leader> <Esc>/<<Enter>"_c4l
inoremap < <><space><++><ESC>5hi
inoremap ( ()<space><++><ESC>5hi
inoremap [ []<space><++><ESC>5hi
inoremap { {}<space><++><ESC>5hi
inoremap º \
nnoremap <C-t> :tabnew<cr>
"nnoremap <C-w> :bd<cr>
nnoremap <Leader>dd :call delete(expand('%'))\| bdelete! \| :exe ":echo 'file deleted'"<CR>
nnoremap <leader>S :r! sed -n 1,8p<space>
map <leader><Tab> :bp<CR>
map <Tab> :bn<CR>
nnoremap <leader>x :bd<CR> 
""map <Tab> <C-W>W:cd %:p:h<CR>:<CR>

"""""""""""""""""
" YouCompleteMe "
"""""""""""""""""

let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_python_binary_path = 'python'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Goto definition with F3
 map <F3> :YcmCompleter GoTo<CR>
"""""""""""""""""""""""""
"  Rename current file  "
"""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
  endif
endfunction
nnoremap <silent> <Leader>n :call RenameFile()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Shortcut to reference the current file's path in command line mode "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:p:h').'/' : '%%'

"""""""""""""""""""""""""""""""
"  In case you forgot to sudo "
"""""""""""""""""""""""""""""""
cnoremap w!! %!sudo tee > /dev/null %

""""""""""""""""""""
"  Plugin settings "
""""""""""""""""""""
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 0

""""""""""""""""""""""
"  airlaine settings "
""""""""""""""""""""""
colorscheme onehalfdark
set cursorline
set t_Co=256
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='onehalfdark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

""""""""""""""""""""
"  unicode symbols "
""""""""""""""""""""
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = 'ᚠ'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:notes_directories = ['~/Notes']

""""""""""""""""""""""""""""
"  Use The Silver Searcher "
""""""""""""""""""""""""""""
"if executable('ag')
"  " Use Ag over Grep
"  set grepprg=ag\ --nogroup\ --nocolor
"
"  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"  let g:FZF_DEFAULT_COMMAND = 'rg %s -l --nocolor -g ""'
"endif

"""""""""""""""""
"  fdoc is yaml "
"""""""""""""""""
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

"""""""""""""""""""""""""
"  extra rails.vim help "
"""""""""""""""""""""""""
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb

""""""""""""""""""""""""""""""""""""""""""""""""""
"  automatically rebalance windows on vim resize "
""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimResized * :wincmd =

"""""""""""""""""""""""
"  Fix Cursor in TMUX "
"""""""""""""""""""""""
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Don't copy the contents of an overwritten selection "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap p "_dP

" Go crazy!
"if filereadable(expand("~/.vimrc.local"))
  " In your .vimrc.local, you might like:
  "
  " set autowrite
  " set nocursorline
  " set nowritebackup
  " set whichwrap+=<,>,h,l,[,] " Wrap arrow keys between lines
  "
  " autocmd! bufwritepost .vimrc source ~/.vimrc
  " noremap! jj <ESC>
"  source ~/.vimrc.local
"endif

""""""""""""""""""""""""
"  Plug plugin manager "
""""""""""""""""""""""""
call plug#begin('~/.vim/plugged') 
Plug 'iamcco/markdown-preview.vim'
Plug 'lervag/vimtex'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'wikitopian/hardmode'
Plug 'francoiscabrol/ranger.vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'dyng/ctrlsf.vim'
Plug 'tpope/vim-eunuch'
Plug 'Shougo/neocomplete' "file completion
Plug 'easymotion/vim-easymotion' "movement

"deoplete
if  has ( ' nvim ' )
  Plug ' Shougo / deoplete.nvim ' , { ' do ' : ' : UpdateRemotePlugins ' }
 else 
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'roxma/nvim-yarp'
 endif 
let g:deoplete#enableable_at_startup =  1

call plug#end()
""""""""""""""""
"  Neocomplete "
""""""""""""""""
let g:neocomplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

"""""""""""""""""""""""""
"  Python mode settings "
"""""""""""""""""""""""""
"let g:pymode = 1
"let g:pymode_options = 1
"let g:pymode_indent = 1
"let g:pymode_python = 'python3.7'
"let g:pymode_virtualenv = 1
"let g:pymode_run = 1
"let g:pymode_run_bind = '<leader>r'
"let g:pymode_lint_on_write = 1

"""""""""""""""
"  Ag and ack "
"""""""""""""""
let g:ackprg = 'rg --vimgrep --smart-case'

"""""""""""""""""""
"  Seoul256 color "
"""""""""""""""""""
"let g:seoul256_background = 236
"let g:seoul256_srgb = 1
"colo seoul256

"""""""""""""""""""
"  Goyo Stettings "
"""""""""""""""""""
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

""""""""""""""""""""""
"  Jedi-vim settings "
""""""""""""""""""""""
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#use_splits_not_buffers = "left"
"let g:jedi#popup_select_first = 0
"let g:jedi#completions_command = "<C-l>"

"""""""""""""""""
"  FZF settings "
"""""""""""""""""
let g:fzf_files_options =
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

command! -bang -nargs=* -complete=buffer Buffers
  \ call fzf#vim#buffers(<q-args>, {'options': '--color bw'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'), <bang>0)

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, fzf#vim#with_preview('right'),<bang>0)

fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>
nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fff :Files ~<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>ll :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>

"""""""""""""""
"  ALE syntax "
"""""""""""""""

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_enabled = 1
let g:ale_set_quickfix = 1
let g:ale_python_auto_pipenv = 1
let g:jedi#completions_enabled=1
"""""""""""""""""""
"  Md is markdown "
"""""""""""""""""""
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell


"""""""""""""
"  Markdown "
"""""""""""""
let g:pandoc#modules#disabled = ["folding", "spell"]
let g:pandoc#syntax#conceal#use = 0
autocmd Filetype rmd set filetype=rmarkdown
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![]()<Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a []()<Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""""""""""
"  Latex "
""""""""""
	" Word count:
        let g:tex_flavor = "latex"
	autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
	autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
	" Compile document using xelatex:
	autocmd FileType tex inoremap <F5> <Esc>:!xelatex<space><c-r>%<Enter>a
	autocmd FileType tex nnoremap <F5> :!xelatex<space><c-r>%<Enter>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><Enter><Enter>\end{frame}<Enter><Enter><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><Space>\\<Enter><Space>\\<Enter>\trans{``''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter> 
        cnoreabbrev ag Ack<Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><Enter>\end{tabular}<Enter><Enter><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{}<Tab>\const{}<Tab><Enter><Enter>\end{tableau}<Enter><Enter><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{}<Space><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><Enter>\end{DELRN}<Enter><Enter><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<Esc>F}i

""""""""""""""""""""""""
"  THIS IS A CATEGORY  "
""""""""""""""""""""""""
"" Autofolding .vimrc
" see http://vimcasts.org/episodes/writing-a-custom-fold-expression/
""" defines a foldlevel for each line of code
function! VimFolds(lnum)
  let s:thisline = getline(a:lnum)
  if match(s:thisline, '^"" ') >= 0
    return '>2'
  endif
  if match(s:thisline, '^""" ') >= 0
    return '>3'
  endif
  let s:two_following_lines = 0
  if line(a:lnum) + 2 <= line('$')
    let s:line_1_after = getline(a:lnum+1)
    let s:line_2_after = getline(a:lnum+2)
    let s:two_following_lines = 1
  endif
  if !s:two_following_lines
      return '='
    endif
  else
    if (match(s:thisline, '^"""""') >= 0) &&
       \ (match(s:line_1_after, '^"  ') >= 0) &&
       \ (match(s:line_2_after, '^""""') >= 0)
      return '>1'
    else
      return '='
    endif
  endif
endfunction

""" defines a foldtext
function! VimFoldText()
  " handle special case of normal comment first
  let s:info = '('.string(v:foldend-v:foldstart).' l)'
  if v:foldlevel == 1
    let s:line = ' ◇ '.getline(v:foldstart+1)[3:-2]
  elseif v:foldlevel == 2
    let s:line = '   ●  '.getline(v:foldstart)[3:]
  elseif v:foldlevel == 3
    let s:line = '     ▪ '.getline(v:foldstart)[4:]
  endif
  if strwidth(s:line) > 80 - len(s:info) - 3
    return s:line[:79-len(s:info)-3+len(s:line)-strwidth(s:line)].'...'.s:info
  else
    return s:line.repeat(' ', 80 - strwidth(s:line) - len(s:info)).s:info
  endif
endfunction

""" set foldsettings automatically for vim files
augroup fold_vimrc
  autocmd!
  autocmd FileType vim 
                   \ setlocal foldmethod=expr |
                   \ setlocal foldexpr=VimFolds(v:lnum) |
                   \ setlocal foldtext=VimFoldText() |
     "              \ set foldcolumn=2 foldminlines=2
augroup END

nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <leader><Space> zm


if has ('nvim') 
  tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
  set inccommand=split


 " Terminal mode:
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
  " Insert mode:
  inoremap <M-h> <Esc><c-w>h
  inoremap <M-j> <Esc><c-w>j
  inoremap <M-k> <Esc><c-w>k
  inoremap <M-l> <Esc><c-w>l
  " Visual mode:
  vnoremap <M-h> <Esc><c-w>h
  vnoremap <M-j> <Esc><c-w>j
  vnoremap <M-k> <Esc><c-w>k
  vnoremap <M-l> <Esc><c-w>l
  " Normal mode:
  nnoremap <M-h> <c-w>h
  nnoremap <M-j> <c-w>j
  nnoremap <M-k> <c-w>k
  nnoremap <M-l> <c-w>l
endif

