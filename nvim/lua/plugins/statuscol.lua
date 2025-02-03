-- it is meant for code folding (with ufo)

-- only show fold level up to this level
local fold_level_limit = 3
local function foldfunc(args)
  local foldinfo = require("statuscol.ffidef").C.fold_info(args.wp, args.lnum)
  if foldinfo.level > fold_level_limit then
    return " "
  end

  return require("statuscol.builtin").foldfunc(args)
end

return {
  "luukvbaal/statuscol.nvim",
  config = function()
    require("statuscol").setup({
      relculright = false,
      segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { require("statuscol.builtin").lnumfunc, " " }, click = "v:lua.ScLa" },
        {
          text = { foldfunc, " " },
          condition = { true, require("statuscol.builtin").not_empty },
          click = "v:lua.ScFa",
        },
      },
    })
  end,
}
