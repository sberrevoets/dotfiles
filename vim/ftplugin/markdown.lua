-- Define highlight and colors
vim.api.nvim_set_hl(0, "Normal", { fg = "fg", bold = false, underline = false, italic = false })
vim.api.nvim_set_hl(0, "Bold", { bold = true, underline = true })
vim.api.nvim_set_hl(0, "Dim", { fg = "gray", italic = true })
vim.api.nvim_set_hl(0, "Red", { fg = vim.g["terminal_color_1"] or "red" })
vim.api.nvim_set_hl(0, "Green", { fg = vim.g["terminal_color_2"] or "green" })
vim.api.nvim_set_hl(0, "Blue", { fg = vim.g["terminal_color_4"] or "blue" })

local ansi_patterns = {
  { pattern = "\27%[0m", highlight = "Normal" },
  { pattern = "\27%[1m", highlight = "Bold" },
  { pattern = "\27%[2m", highlight = "Dim" },
  { pattern = "\27%[91m", highlight = "Red" },
  { pattern = "\27%[92m", highlight = "Green" },
  { pattern = "\27%[94m", highlight = "Blue" },
}

-- Find the highlight group for a given ANSI escape code
local function find_ansi_pattern(text)
  for _, entry in pairs(ansi_patterns) do
    if text:find(entry.pattern) then
      return entry.highlight
    end
  end
  return nil
end

-- Apply ANSI highlighting to a line of text in the given buffer
local function apply_ansi_highlighting(buf, line_num, text)
  text = text:gsub("\27%[0m$", "")
  local pattern = "\27%[[0-9]+m"

  local start_pos, end_pos, match = text:find("(" .. pattern .. ")")
  local cursor = 1
  local pos_in_stripped = 0

  local next = text
  while start_pos do
    if next:find("^" .. pattern) then
      start_pos, end_pos, match = next:find("(" .. pattern .. ")")
      cursor = end_pos + 1
      vim.api.nvim_buf_add_highlight(
        buf,
        -1,
        find_ansi_pattern(match) or "Normal",
        line_num,
        pos_in_stripped,
        -1
      )
    else
      start_pos = next:find(pattern)
      if start_pos then
        pos_in_stripped = pos_in_stripped + start_pos - 1
        cursor = start_pos
      end
    end

    next = next:sub(cursor, -1)
  end
end

-- Create a new buffer with the given message and apply ANSI highlighting
local function create_buf(message)
  local buf = vim.api.nvim_create_buf(false, true)

  local lines = vim.split(message, "\n", { plain = true })
  for i, line in ipairs(lines) do
    local stripped = line:gsub("\27%[[0-9;]+m", "")
    vim.api.nvim_buf_set_lines(buf, i - 1, i, false, { stripped })
    apply_ansi_highlighting(buf, i - 1, line)
  end

  return buf
end

-- Show a popup window with the given buffer
local function show_popup(buf)
  vim.g.popup_window = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    width = 100,
    height = 15,
    row = 1,
    col = 0,
    anchor = "NW",
    style = "minimal",
    border = "single",
  })
end

-- Close the popup window
local function close_popup()
  local window = vim.g.popup_window
  if vim.g.popup_window and vim.api.nvim_win_is_valid(window) then
    vim.api.nvim_win_close(window, true)
    vim.g.popup_window = nil
  end
end

-- Look up the definition of the word under the cursor
local function lookup()
  local word = vim.fn.expand("<cword>")

  local file = assert(io.popen("dict " .. word, "r"))
  local definition = assert(file:read("*a"))
  file:close()
  show_popup(create_buf(definition))
end

-- Create a command to look up the word under the cursor
vim.api.nvim_create_user_command("Dict", lookup, { nargs = 1 })

-- Close the popup window when the cursor moves
vim.api.nvim_create_autocmd("CursorMoved", {
  pattern = "*",
  callback = close_popup,
})
