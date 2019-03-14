let mapleader = " "

" Basic settings

	syntax on
	set encoding=utf-8
	set number relativenumber
	set ai
	set tabstop=5

" Autocomplete

	set wildmode=longest,list,full

" Make window split emacs-like

	set splitbelow splitright

" Common keymaps

	map <leader>fs :w<CR>
	map <leader>p :read !xclip -o<CR>
