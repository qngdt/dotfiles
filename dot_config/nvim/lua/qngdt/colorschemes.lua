-- change colorscheme based on time
local status_ok, theme = pcall(require, "catppuccin")
if not status_ok then
	return
end

local current_hour = tonumber(os.date("%H"))

if 6 < current_hour and current_hour < 18 then
	vim.g.catppuccin_flavour = "frappe"
else
	vim.g.catppuccin_flavour = "macchiato"
end

theme.setup({})

vim.cmd([[colorscheme catppuccin]])
