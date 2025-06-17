-- i would use the Markdown Viewer extension (both chrome and firefox)
-- https://github.com/simov/markdown-viewer
-- i custom commanded it (open file in browser);
-- mappings.lua; markdown; <space>md
return {}

-- this works on LINUX but not on WINDOWS
-- any update regarding windows has not happened since aug 2024
-- return { "jannis-baum/vivify.vim" }

-- Knyffen's fork should work better than iamcco's, but it didn't build
-- both projects have been abandoned
-- return {
--   "Knyffen/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   ft = { "markdown" },
--   build = function()
--     vim.fn["mkdp#util#install"]()
--   end,
--   config = function()
--     vim.g.mkdp_open_to_the_world = 1
--     vim.g.mkdp_open_ip = "127.0.0.1"
--     vim.g.mkdp_port = 8089
--     vim.g.mkdp_browser = "zen"
--     vim.g.mkdp_echo_preview_url = 1

--     -- don't auto close would not work, because you cant stop it when not in md file
--     -- and also it wont follow you trough other buffers; you're stuck to that one file
--     -- you can use the buffer number to switch pages; /page/{N}
--     -- but then it wont auto close anymore
--     vim.g.mkdp_auto_close = 1
--   end,
-- }
