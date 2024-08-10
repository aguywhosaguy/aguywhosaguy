require("config.lazy")
require('lualine').setup({options = { theme = 'gruvbox' }})
require'nvim-treesitter.configs'.setup {
	highlight = {
      		enable = true
	},
	ident = {
      		enable = true
	}
	
}
require("nvim-ts-autotag").setup()
minimods = { "animate", "files", "icons", "pairs", "starter" }
for _, mod in pairs(minimods) do
	require("mini."..mod).setup()
end
