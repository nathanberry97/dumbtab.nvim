local dumbtab = require 'dumbtab.tabline'
local M = {}

M.setup = function(config)
    -- Check if the plugin was loaded, disabled or compatible is set
    if vim.g.loaded_dumbtab_nvim or vim.o.compatible then
        return
    end

    vim.g.loaded_dumbtab_nvim = 1

    -- Default configuration
    local currentTab = config.currentTabColour or '13'
    local otherTab = config.otherTabColour or '8'

    -- Tab configuration
    dumbtab.tabline()
    dumbtab.keymappings()
    dumbtab.colours({
        currentTab = currentTab,
        otherTab = otherTab,
    })
end

return M
