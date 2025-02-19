-- TODO: https://github.com/folke/persistence.nvim

-- test autoload
vim.api.nvim_create_user_command("Test", function()
  local sessions_path = vim.fn.stdpath("data") .. "\\sessions\\"
  local session_dir, dir_pat = "", "^cd%s*"
  for file, type in vim.fs.dir(sessions_path) do
    if type == "file" then
      -- no "cd%" present
      -- had to manually add it in to go on
      -- an nvim issue?
      for line in io.lines(sessions_path .. file) do
        if string.find(line, dir_pat) then
          session_dir = vim.uv.fs_realpath(vim.fs.normalize((line:gsub("cd%s*", ""))))
          local a = line:gsub("cd%s*", "")
          local b = vim.fs.normalize(a)
          -- breaks at c
          local c = vim.uv.fs_realpath(b)
          print(c)
          print(vim.fn.getcwd())
          if session_dir == vim.fn.getcwd() then
            print(file)
          end
        end
      end
    end
  end
end, {})

-- FIX: session autoload
-- probably will need to do an issue
-- originally was merged in
-- does-it-work-on-linux?
return {
  "gennaro-tedesco/nvim-possession",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  lazy = false,
  opts = {
    autoload = true,
    sessions = {
      -- TODO: cross-platform
      sessions_path = vim.fn.stdpath("data") .. "\\sessions\\",
    },
    autoswitch = {
      enable = true,
    },
  },
  config = true,
  keys = {
    {
      "<leader>sl",
      function()
        require("nvim-possession").list()
      end,
      desc = "📌list sessions",
    },
    {
      "<leader>sn",
      function()
        require("nvim-possession").new()
      end,
      desc = "📌create new session",
    },
    {
      "<leader>su",
      function()
        require("nvim-possession").update()
      end,
      desc = "📌update current session",
    },
    {
      "<leader>sd",
      function()
        require("nvim-possession").delete()
      end,
      desc = "📌delete selected session",
    },
  },
}
