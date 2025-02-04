return {
  "barrett-ruth/live-server.nvim",
  -- this might not work on nixos
  -- mayb it wont let trough a builderror even if we dont need it
  build = "pnpm add -g live-server",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  config = true,
}
