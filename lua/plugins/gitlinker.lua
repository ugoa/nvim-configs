return {
	"linrongbin16/gitlinker.nvim",
	cmd = "GitLink",
	opts = {
		router = {
			browse = {
				["gitlab.myteksi.net"] = "https://gitlab.myteksi.net/"
					.. "{_A.ORG}/"
					.. "{_A.REPO}/blob/"
					.. "{_A.REV}/"
					.. "{_A.FILE}"
					.. "#L{_A.LSTART}"
					.. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
			},
		},
	},
}
