return {
	"SirVer/ultisnips",
	config = function()
		-- Enable UltiSnips
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
		vim.g.UltiSnipsEditSplit = "vertical"

		-- Set the snippets directory
		vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
	end,
}
