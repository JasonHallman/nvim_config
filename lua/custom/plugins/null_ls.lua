return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.autopep8.with {
				-- 	extra_args = { "--ignore=E221" }
				-- },
				null_ls.builtins.formatting.black.with {
					extra_args = {
						"--line-length",
						"88",
						"--preview",
						"--enable-unstable-feature", 
						"string_processing",
					}
				},
				null_ls.builtins.formatting.isort,
				null_ls.builtins.diagnostics.flake8.with {
					extra_args = {
						"--max-line-length=88",
						"--ignore=E221",
					}
				},

				-- null_ls.builtins.formatting.shfmt.with({
				-- 	extra_args = { "-i", "4" },
				-- }),
				null_ls.builtins.formatting.shfmt.with({
				    extra_args = function(params)
					return {
						"-i", vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
						"-ci"
					}
				    end,
				}),

				null_ls.builtins.diagnostics.shellcheck,
			},
		})
	end,
	dependencies = { "nvim-lua/plenary.nvim" },
}
