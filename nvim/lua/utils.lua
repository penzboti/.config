---@param dictionary {linux?:string, windows?: string}
---@return string
Crossplatform = function(dictionary)
  local sys = vim.uv.os_uname()
  local sysname = sys.sysname

  if sysname == "Windows_NT" then
    return dictionary.windows
  elseif sysname == "Linux" then
    return dictionary.linux
  else
    error("The OS '" .. sysname .. "' not found")
  end
end

ObsidianPath = function(name)
  local windowspath = "E:/obsidian/"
  local linuxpath = "~/obsidian/"
  local folder = Crossplatform({ windows = windowspath, linux = linuxpath })
  local response = folder .. name
  return response
end
