local toggleterm = require("toggleterm")
MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })

-- TODO: Figure out how to add triple backtick proper to mini.pairs
-- MiniPairs.map_buf(0, "i", "```", { action = "closeopen", pair = "``````"})

vim.api.nvim_buf_create_user_command(0, 'TypstWatch', function(opts)
    local oldid = vim.fn.win_getid()
    local file = vim.fn.expand("%:")

    vim.cmd.ToggleTerm("direction=horizontal size=5 name=typst-watch")
    vim.api.nvim_paste("typst watch " .. '"' .. file .. '" --open\n', false, -1)
    vim.fn.win_gotoid(oldid)
end, {})
