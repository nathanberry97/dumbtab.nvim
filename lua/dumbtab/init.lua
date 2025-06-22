local dumbtab = require 'dumbtab.tabline'
local M = {}

M.setup = function()
    -- Check if the plugin was loaded, disabled or compatible is set
    if vim.g.loaded_dumbtab_nvim or vim.o.compatible then return end

    vim.g.loaded_dumbtab_nvim = 1

    -- Tab configuration
    dumbtab.tabline()
    dumbtab.settings()
end

return M
