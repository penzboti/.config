return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "│" },
		},
		word_diff = true,
		on_attach = function(bufnr)
			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]c", function()
				if vim.wo.diff then
					return "]c"
				end
				vim.schedule(function()
					require("gitsigns").next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "next hunk" })

			map("n", "[c", function()
				if vim.wo.diff then
					return "[c"
				end
				vim.schedule(function()
					require("gitsigns").prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "previous hunk" })

			-- Actions
			map("n", "<leader>hp", require("gitsigns").preview_hunk)
			map("n", "<leader>hb", function()
				require("gitsigns").blame_line({ full = true })
			end)
		end,
	},
}
