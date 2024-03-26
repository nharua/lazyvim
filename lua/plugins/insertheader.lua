return {
	"SirVer/ultisnips",
	config = function()
		-- Define a Lua function to get the git global email

		-- Enable UltiSnips
		vim.g.UltiSnipsExpandTrigger = "<tab>"
		vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
		vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
		vim.g.UltiSnipsEditSplit = "vertical"

		-- Set the snippets directory
		vim.g.UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

		-- Define a command to update Modify Date field
		vim.cmd([[
			command! UpdateModifyDate lua updateModifyDate()
		]])
	end,
}
