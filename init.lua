local opt = vim.opt

opt.colorcolumn = "100"
opt.whichwrap = ""

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.api.nvim_command('set relativenumber')
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.api.nvim_command('set norelativenumber')
  end,
})

