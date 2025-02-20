-- TODO dont auto open fold after save
-- according to my testing, it only happens on save with stylua
-- it has never happened in rust, markdown, html, js
-- if its only lua i might be able to live with it

-- cool arrow and line number fold indicator
local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = (" 󰁂 %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

vim.o.foldcolumn = "1" -- '0' is also not bad
vim.o.foldlevel = 99
vim.o.foldlevelstart = -1
vim.o.foldenable = true

local treesitter_provider = function()
  return { "treesitter", "indent" }
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter", -- in theory this isn't needed
  },
  event = "BufReadPost",
  opts = {
    fold_virt_text_handler = handler,
    provider_selector = treesitter_provider,
  },
}
