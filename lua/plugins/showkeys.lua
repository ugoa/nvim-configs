return {
	"siduck/showkeys",
	cmd = "ShowkeysToggle",

	opts = {
		-- REF: https://github.com/nvzone/showkeys/blob/main/lua/showkeys/state.lua
		timeout = 2,
		maxkeys = 4,
		show_count = true,
		excluded_modes = { "i" },
	},
}
