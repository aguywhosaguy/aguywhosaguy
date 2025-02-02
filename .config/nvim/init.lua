require("config.lazy")
require('lualine').setup({options = { theme = 'night-owl' }})
require'nvim-treesitter.configs'.setup {
	highlight = {
      		enable = true
	},
	ident = {
      		enable = true
	}
	
}
require("nvim-ts-autotag").setup()
minimods = { "animate", "icons", "pairs", "starter" }
for _, mod in pairs(minimods) do
	require("mini."..mod).setup()
end

local config_path = vim.fn.stdpath("config")
vim.cmd.source(config_path .. "/vimrc.vim")
