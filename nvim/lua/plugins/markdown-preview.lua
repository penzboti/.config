-- Q: also this: https://github.com/MeanderingProgrammer/render-markdown.nvim
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.g.mkdp_open_to_the_world = 1
    vim.g.mkdp_open_ip = "127.0.0.1"
    vim.g.mkdp_port = 8089
    vim.g.mkdp_browser = "zen"
    vim.g.mkdp_echo_preview_url = 1
  end,
}
