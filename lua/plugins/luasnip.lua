return {
	"L3MON4D3/LuaSnip",
	config = function()
		require("luasnip").filetype_extend("htmldjango", { "html" })
	end,
}
