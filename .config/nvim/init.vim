" Plugins
	call plug#begin('/home/user/.config/nvim/vim-plug')
		Plug 'preservim/nerdtree'						" File browser
		Plug 'vim-airline/vim-airline'					" Statusline
		Plug 'wakatime/vim-wakatime'					" Time tracker
		Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'} " Smart syntax highlighting
		Plug 'catppuccin/nvim', {'as': 'catppuccin'}	" Catppuccin theme
	call plug#end()

lua <<EOF
	require 'nvim-treesitter.configs'.setup {
		highlight = {
			enable = true,
			custom_captures = {},
			-- Setting this to true will run `:h syntax` and tree-sitter at the
			-- same time. Set this to `true` if you depend on 'syntax' being
			-- enabled (like for indentation). Using this option may slow down
			-- your editor, and you may see some duplicate highlights. Instead
			-- of true it can also be a list of languages
			additional_vim_regex_highlighting = true,
		},
		ensure_installed = {
			"bash",
			"c",
			"css",
			"fish",
			"html",
			"javascript",
			"lua",
			"markdown",
			"python",
			"rust",
			"scss",
			"toml",
			"vim",
			"yaml",
		},
	}

	local catppuccin_settings = {
		transparent_background = true,
		term_colors = true,
	}

	local catppuccin = require("catppuccin")
	catppuccin.setup(catppuccin_settings)
EOF

" Theme
	let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
	colorscheme catppuccin

" Includes
	" File settings (tabs, syntax, etc)
		" Assembly
		execute 'source $HOME/.config/nvim/patches/asm.vim'

" Plugin options
	" NerdTree
		" Start NerdTree. If a file is specified, move the cursor to its window.
			autocmd StdinReadPre * let s:std_in=1
			autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
			\ !exists('s:std_in') |
			\ execute 'NERDTree' argv()[0] | wincmd p | enew |
			\ execute 'cd '.argv()[0] |
			\ endif
			autocmd VimEnter * if argc() > 0 && !isdirectory(argv()[0]) ||
			\ exists('s:std_in') | execute 'NERDTree'
			\ fnamemodify(argv()[0], ':p:h') | wincmd p | endif

		" Exit Vim if NERDTree is the only window left.
			autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
			\ exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit |
			\ endif

		" If another buffer tries to replace NerdTree, put it in another window,
		" and bring back NerdTree.
			autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' &&
			\ bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" |
			\ execute 'buffer'.buf |
			\ endif


	
	" Airline
		let g:airline#extensions#tabline#enabled = 1				" Enable tabline (top line)
		let g:airline#tabline#formatter = 'unique_tail_improved'	" Tabline filename format
		let g:airline#extensions#tabline#enabled = 1				" Displays all buffers when only one tab is open

		let g:airline_left_sep = "\uE0B0"	" Fancy separators
		let g:airline_right_sep = "\uE0B2"	" Fancy separators
		let g:airline_powerline_fonts = 1	" Use special symbols from powerline fonts



" Workarounds (for neovim and tty)
	if empty($DISPLAY)		" Check if we ARE in a tty
	
		" Airline tty compatibility
		let g:airline_left_sep = '►'		" ASCII separators '►'
		let g:airline_right_sep = '◄'		" ASCII separators '◄'
		let g:airline_symbols_ascii = 1		" ASCII symbols

	endif



" Settings
	" Tabs
		set smarttab		" Insert amount of blanks (spaces) according to shiftwidth. <BS> will delete shitfwidth of space
		set tabstop=4		" Set tab width to 4 spaces
		set shiftwidth=4	" Tabs still act as 1 char

	" Search
		set ignorecase	" Searching GNU will also search for gnu and Gnu
		set hlsearch	" Highlights search results for better visibility
		set incsearch	" Highlight while typing, not after search is complete
	
	" File
		set encoding=utf-8		" Load all files as UTF-8 as opposed to ASCII or UTF-16
		set colorcolumn=80		" Put a line at column 80 to wrap text
		set textwidth=0			" Max width of text being inserted
		hi ColorColumn ctermbg=darkblue guibg=darkblue

	" Cursor
		set sidescrolloff=20	" Space from each vertical edge to start scrolling
		set scrolloff=10		" Space from each horizontal edge te start scrolling
		set cursorline			" Mark the line the cursor is on
		set nowrap				" Don't wrap lines, scroll them
		set ruler				" Show the line and column of the cursor on statusline

	" UI
		set laststatus=2	" Show the statusline
		set noerrorbells	" Don't play a sound on error
		set visualbell		" Flash on error
		"set mouse=a		" Enable mouse interaction in terminal emulator
		set number			" Hybrid line numbering
		set relativenumber	" Hybrid line numbering
		syntax on			" Enable syntax highlighting
		set title			" Window title set to '(filename) [+=-] (path) - NVIM'

	" Misc
		set backspace=indent,eol,start		" Delete indents, newlines, and pre-existing characters
		set confirm							" Ask before closing a file without writing
		set history=10000					" Undo history
		set noswapfile						" Don't use swap files, goes with confirm
		set wildignore+=*.pyc,.git,.git/*	" Ignore items in search
		set wildignore+=*.so,*.dll,*.o,		" Ignore items in search
		set wildignore+=*.exe				" Ignore items in search


" Keybinds
	" Leader key
		let mapleader = ","

	" Visual mode
	
	" Normal mode
		" Buffer resizing
			noremap <silent> <S-Left> :vertical resize +10<CR>
			noremap <silent> <S-Right> :vertical resize -10<CR>
			noremap <silent> <S-Up> :resize -10<CR>
			noremap <silent> <S-Down> :resize +10<CR>

			" noremap <silent> <A-Left> :vertical resize +2<CR>
			" noremap <silent> <A-Right> :vertical resize -2<CR>
			" noremap <silent> <A-Up> :resize -2<CR>
			" noremap <silent> <A-Down> :resize +2<CR>

		" Search
			nnoremap <silent> <ESC> :noh<CR>
		
		" Buffer navigatino and management
			nnoremap <silent> <leader>bd :b#<bar>bd#<CR>
	" Insert mode
