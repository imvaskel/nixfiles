{
  vim.luaConfigRC.exrc = ''
    if vim.opt.exrc:get() then
      local path = vim.fn.getcwd() .. "/.nvim.lua"
      if vim.uv.fs_stat(path) then
        local read = vim.secure.read(path)
        if read ~= nil then
          load(read)()
        end
      end
    end
  '';
}
