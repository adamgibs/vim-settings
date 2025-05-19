return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- Add this dependency
	},
	config = function()
		-- Enable lsp_lines
		require("lsp_lines").setup()

		local lspconfig = require("lspconfig")

		local mason_lspconfig = require("mason-lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Configure diagnostics
		vim.diagnostic.config({
			virtual_text = true,
			float = {
				border = "rounded",
				source = "always",
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local client = vim.lsp.get_client_by_id(ev.data.client_id)
				
				if client and client.supports_method("textDocument/publishDiagnostics") then
					vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
						vim.lsp.diagnostic.on_publish_diagnostics, {
							virtual_text = true,
							signs = true,
							underline = true,
							update_in_insert = false,
						}
					)
				end
			end,
		})

		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end
		})
	end,
}
