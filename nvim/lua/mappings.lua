-- NOTE
-- more bindings are present in these plugin files:
-- gitsigns
-- autocomplete
-- telescope
-- autoformat

local map = vim.keymap

-- moving
map.set({ "n", "v" }, "j", "h")
map.set({ "n", "v" }, "k", "j")
map.set({ "n", "v" }, "l", "k")
map.set({ "n", "v" }, "é", "l")

-- basic
-- these are not instant? for some reason. and nowait doesnt work?
map.set("n", "<leader>w", ":w<enter>", { nowait = true, silent = true })
map.set("n", "<leader>q", ":q<enter>")
map.set("n", "<leader>pv", ":Ex<enter>")
map.set("n", "<leader>n", ":new<CR>")

-- move lines
map.set("n", "<A-k>", ":m .+1<CR>==")
map.set("n", "<A-l>", ":m .-2<CR>==")
map.set("v", "<A-k>", ":m '>+1<CR>gv=gv")
map.set("v", "<A-l>", ":m '<-2<CR>gv=gv")

-- center screen after jumps
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "<C-b>", "<C-b>zz")
map.set("n", "<C-f>", "<C-f>zz")

-- telescope
local builtin = require("telescope.builtin")
map.set("n", "<A-f>", builtin.find_files, {})
map.set("n", "<leader>ff", builtin.find_files, {})
map.set("n", "<leader>fg", builtin.live_grep, {})
map.set("n", "<leader>fb", builtin.buffers, {})
-- map.set("n", "<leader>fh", builtin.help_tags, {})
map.set("n", "<leader>ft", ":TodoTelescope<CR>")
map.set("n", "<leader>ts", builtin.treesitter, {})

-- file tree
map.set("n", "<A-s>", require("nvim-tree.api").tree.toggle, {
  silent = true,
  desc = "toggle nvim-tree",
})

-- code collapse (doesnt work tho)
map.set("n", "zR", require("ufo").openAllFolds)
map.set("n", "zM", require("ufo").closeAllFolds)

-- go back to dashboard
map.set("n", "<leader>d", ":Dashboard<CR>")

-- git
map.set("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git: show status" })

-- buffer move (like tabs but not)
map.set("n", "<A-e>", ":enew<CR>")
map.set("n", "<A-h>", ":Telescope scope buffers<CR>")
map.set("n", "<A-j>", ":bprev<CR>")
map.set("n", "<A-é>", ":bnext<CR>")
map.set("n", "<A-c>", ":bd<CR>") -- will not close if buffer is unsaved

-- more indentation
map.set("v", ">", ">gv")
map.set("v", "<", "<gv")

-- markdown
map.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>")
map.set("i", "<A-b>", "- [ ] ")

-- live-server
map.set("n", "<leader>ls", ":LiveServerToggle<CR>")

-- hop
map.set("n", "<leader>hw", ":HopWord<CR>")
map.set("n", "<leader>ha", ":HopAnywhere<CR>")
map.set("n", "<leader>hl", ":HopLine<CR>")
