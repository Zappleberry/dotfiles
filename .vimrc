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
	map <leader>fq :wq<CR>
	map <leader>p :read !xclip -o -selection clipboard<CR>
	map <leader>y :<C-u>exec "!echo \"" . GetVisualSelection() . "\" \| xclip -i -selection clipboard"<CR><CR>
	map <leader><tab> /<++><CR>4s

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
