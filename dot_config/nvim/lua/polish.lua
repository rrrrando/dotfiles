-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    -- Detect line endings and handle accordingly
    local ff = vim.bo.fileformat
    if ff == "dos" then
      -- Optionally set different behavior for DOS files
      vim.notify("File uses CRLF line endings", vim.log.levels.INFO)
    elseif ff == "mac" then
      vim.notify("File uses CR line endings", vim.log.levels.INFO)
    end
  end,
})
