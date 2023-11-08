return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function ()
		require("catppuccin").setup({
      color_overrides = {
        mocha = {
          base = "#161b22"
        }
      }
		})
		-- load colorscheme
		vim.cmd([[colorscheme catppuccin]])

    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='#edff19', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
	end
}
