vim.opt.colorcolumn = "80"

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



if vim.g.neovide then
  vim.g.neovide_transparency = 0.8
end
