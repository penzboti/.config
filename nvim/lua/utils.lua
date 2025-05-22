-- TODO: rewrite this to a "dictionary"; windows: this folder, linux: this folder
Crossplatform = function(name)
  -- also this function relies on if i only have one windows machine
  local sys = vim.uv.os_uname()
  local folder = ""
  local sysname = sys.sysname

  if sysname == "Windows_NT" then
    folder = "E:/obsidian/"
  elseif sysname == "Linux" then
    folder = "~/obsidian/"
  else
    return "ERROR: The OS '" .. sys.sysname .. "' not found"
  end

  local response = folder .. name
  return response
end
