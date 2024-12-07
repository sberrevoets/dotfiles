-- Create a command to look up the word under the cursor
vim.api.nvim_create_user_command("Dict", DictionaryLookup, { nargs = 1 })

-- Close the popup window when the cursor moves
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = ClosePopup,
})
