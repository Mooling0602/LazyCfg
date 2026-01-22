-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>uz", function()
  local is_on = vim.wo.signcolumn == "no"
  if is_on then
    vim.opt.signcolumn = "yes"
    vim.opt.number = true
    vim.opt.laststatus = 3
    pcall(function()
      Snacks.toggle.indent():toggle()
    end)
    print("Copy Mode: OFF")
  else
    vim.opt.signcolumn = "no"
    vim.opt.foldcolumn = "0"
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt.laststatus = 0
    vim.opt.breakindent = false
    pcall(function()
      Snacks.toggle.indent():toggle()
    end)
    print("Copy Mode: ON (Code is now flush left)")
  end
end, { desc = "Toggle Copy Mode (Flush Left)" })
