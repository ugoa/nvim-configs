return {
  "siduck/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    -- REF: https://github.com/nvzone/showkeys/blob/main/lua/showkeys/state.lua
    timeout = 2,
    maxkeys = 2,
    show_count = true,
    position = "bottom-left",
    excluded_modes = { "i", "t" },
  },
}
