return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.autopep8.with {
					extra_args = { "--ignore=E221" }
				},
				null_ls.builtins.diagnostics.flake8.with {
					extra_args = {
						"--max-line-length=120",
						"--ignore=E221",
					}
				},

				null_ls.builtins.formatting.shfmt,

				null_ls.builtins.diagnostics.shellcheck,
			},
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
