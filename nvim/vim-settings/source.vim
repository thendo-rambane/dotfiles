if !exists('g:vscode')
	source ~/dotfiles/nvim/vim-settings/plugins.vim
	source ~/dotfiles/nvim/vim-settings/keys.vim
	source ~/dotfiles/nvim/vim-settings/settings.vim
	source ~/dotfiles/nvim/vim-settings/nvim-lsp.vim
	source ~/dotfiles/nvim/vim-settings/treesitter-colors.vim
else
	source ~/dotfiles/nvim/vscodeInitFile.vim
endif
