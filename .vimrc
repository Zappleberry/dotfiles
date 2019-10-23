let mapleader = " "

" Auto settup and install plugged

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin load

call plug#begin('~/.vim/bundle')

	" vim plugin to autoclose paranthesis
	Plug 'Townk/vim-autoclose'

	" vim plugin to add better support for LaTeX
	" Plug 'lervag/vimtex'
	
	" vim plugin for colors
	Plug 'chriskempson/base16-vim'

	" plugin for powerline
	" Plug 'powerline/powerline'

	" plugin for airline
	Plug 'vim-airline/vim-airline'

	" plugin for airline themes
	Plug 'vim-airline/vim-airline-themes'

	Plug 'junegunn/goyo.vim'

call plug#end()

" Basic settings

	syntax on
	set encoding=utf-8
	set number relativenumber
	set ai
	set wrap
	set linebreak
	set tabstop=5

	" Sets colorscheme to base16-ashes
	colorscheme base16-ashes
	let g:airline_theme='base16_ashes'
	" Removes Opaque background
	hi Normal guibg=NONE ctermbg=NONE
	hi LineNr ctermbg=NONE
	hi CursorLineNr ctermbg=NONE ctermfg=yellow

" Autocomplete

	set wildmode=longest,list,full

" Make window split emacs-like

	set splitbelow splitright

" Common keymaps

	noremap <leader>fs :w<CR>
	noremap <leader>fq :wq<CR>
	noremap <leader>p :read !xclip -o -selection clipboard<CR>
	noremap <leader>y :<C-u>exec "!echo \"" . GetVisualSelection() . "\" \| xclip -i -selection clipboard"<CR><CR>
	noremap <leader><tab> /<++><CR>4s
	noremap <leader>fr :e<CR>
	noremap <leader>fR :so $MYVIMRC<CR>

" Spellcheck keys

	noremap <leader>ss :setlocal spell! spelllang=en_us<CR>
	noremap <leader>sj ]s
	noremap <leader>sk [s
	noremap <leader>sr z=

" Get Visual Selection command

	function! GetVisualSelection()
		let [lnum1, col1] = getpos("'<")[1:2]
		let [lnum2, col2] = getpos("'>")[1:2]
		let lines = getline(lnum1, lnum2)
		let lines[-1] = lines[-1][:col2 - (&selection == 'inclusive' ? 1 : 2)]
		let lines[0] = lines[0][col1 - 1:]
		return join(lines, "\n")
	endfunction
