-- change colorscheme based on time
current_hour = tonumber(os.date("%H"))
if 6 < current_hour and current_hour < 18 then
  vim.opt.background= "light"
  vim.cmd('colorscheme one-nvim')
else
  vim.cmd('colorscheme onedark')
end
