-- TODO: which_key
-- or just add descriptions to all of them.
-- you will probably forget some of them
-- NOTE:
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
-- to keep them instant, make sure you dont set a bind like <leader>ws so that it waits for it
map.set("n", "<leader>w", ":w<enter>")
map.set("n", "<leader>q", ":q<enter>")
map.set("n", "<leader>pv", ":Ex<enter>")
map.set("n", "<leader>n", ":enew<CR>")

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
map.set("n", "<leader>fs", ":Telescope persisted<CR>")

vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<A-s>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- code collapse (does it work tho?)
map.set("n", "zR", require("ufo").openAllFolds)
map.set("n", "zM", require("ufo").closeAllFolds)

-- go back to dashboard
map.set("n", "<leader>d", ":lua Snacks.dashboard()<CR>")

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

-- terminal
map.set("n", "<leader>tn", ":terminal<CR>")
map.set("t", "<Esc>", "<C-\\><C-n>")
map.set("t", "<A-j>", "<C-\\><C-n>:bprev<CR>")
map.set("t", "<A-é>", "<C-\\><C-n>:bnext<CR>")

-- sessions
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end) -- load the session for the current directory
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end) -- select a session to load
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load({ last = true })
end) -- load the last session
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end) -- stop Persistence => session won't be saved on exit
