local servers = {
	"astro",
	"dockerls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"marksman",
	"pyright",
	"regal",
	"ruff",
	"rumdl",
	"tailwindcss",
	"ts_ls",
	"vale_ls",
	"yamlls",
}

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{
				"mason-org/mason.nvim",
				opts = {},
			},
		},
		config = function()
			vim.lsp.config("*", {
				capabilities = require("blink.cmp").get_lsp_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
						diagnostics = {
							disable = { "missing-fields", "inject-fields" },
							globals = { "vim", "Snacks" },
						},
					},
				},
			})

			vim.lsp.config("vale_ls", {
				init_options = {
					installVale = false,
				},
			})

			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/docker/sandbox-kit-spec/refs/heads/main/schema/kit.schema.json"] = {
								"**/kit/**.yaml",
								"**/kit/**.yml",
								"**/kits/**.yaml",
								"**/kits/**.yml",
							},
						},
					},
				},
			})

			vim.lsp.enable(servers)
			vim.lsp.inlay_hint.enable(true)

			vim.diagnostic.config({
				virtual_text = true,
				virtual_lines = false,
			})

			vim.api.nvim_create_user_command("Format", function()
				vim.lsp.buf.format({ async = true })
			end, { desc = "Format current buffer with LSP" })

			vim.keymap.set("", "<leader>l", function()
				local virtual_lines = not vim.diagnostic.config().virtual_lines
				vim.diagnostic.config({
					virtual_text = not virtual_lines,
					virtual_lines = virtual_lines,
				})
			end, { desc = "Toggle diagnostic lines" })
		end,
	},
}
