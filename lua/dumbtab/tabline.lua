local M = {}

M.tabline = function()
    function Tabline()
        local tabline = ''

        for tab = 1, vim.fn.tabpagenr('$') do
            local win = vim.fn.tabpagewinnr(tab)
            local buf = vim.fn.tabpagebuflist(tab)[win]
            local bufname = vim.fn.bufname(buf)

            tabline = tabline ..
                          (tab == vim.fn.tabpagenr() and '%#TabLineSel#' or
                              '%#TabLine#')

            local bufModified = vim.fn.getbufvar(buf, '&mod')
            local tabName = ''

            if bufModified == 1 then
                tabName = '*[' .. vim.fn.fnamemodify(bufname, ':t') .. '] '
            else
                tabName = '[' .. vim.fn.fnamemodify(bufname, ':t') .. '] '
            end

            tabline = tabline .. (bufname ~= '' and tabName or '[No Name] ')
        end

        return tabline
    end

    vim.o.showtabline = 2
    vim.o.tabline = '%!v:lua.Tabline()'
end

M.keymappings =
    function() vim.keymap.set('n', '<leader>t', ':tabedit .<CR>') end

return M
