vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.cmd("source ~/.vimrc")

require("catppuccin").setup({
  term_colors = true,
})
vim.cmd.colorscheme("catppuccin-mocha")

vim.g.python3_host_prog = vim.fn.expand("$HOME") .. "/.pyenv/versions/nvim-venv/bin/python"

-- Map leader + rl to reload config
vim.keymap.set("n", "<leader>rl", function()
  local config_file = vim.fn.stdpath("config") .. "/init.lua"
  vim.cmd("luafile " .. config_file)
end, { desc = "Reload config" })

local nvim_lsp = require("lspconfig")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>o", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope find git files" })
vim.keymap.set("n", "<leader>s", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.keymap.set("n", "<leader>0", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set("n", "<leader>b", "<cmd>XcodebuildBuild<CR>", { desc = "Build Project" })
vim.keymap.set("n", "<leader>r", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
vim.keymap.set("n", "<leader>1", "<cmd>XcodebuildTestExplorerToggle<cr>", { desc = "Toggle test explorer" })
vim.keymap.set("n", "<leader>Y", function()
  require("dapui").toggle()
end, { desc = "Toggle Console" })

local on_attach = function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  -- local function buf_set_option(...)
  --   vim.api.nvim_buf_set_option(bufnr, ...)
  -- end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "<space>fx", "<cmd>lua vim.lsp.buf.code_action({apply = true})<CR>", opts)
  buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local cmp = require("cmp")

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<Tab>"] = function(fallback)
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" and type(copilot_keys) == "string" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
      elseif cmp.visible() then
        local entry = cmp.get_selected_entry()

        if not entry then
          cmp.select_next_item()
        end

        cmp.confirm()
      else
        fallback()
      end
    end,
    -- Accept currently selected item.
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }),
})

cmp.setup({
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
})

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = { "pyright", "ts_ls", "eslint", "sourcekit", "bashls", "marksman" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

require("lspconfig").lua_ls.setup({
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
  on_attach = on_attach,
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
    },
  },
})

require("nvim-tree").setup({
  update_focused_file = { enable = true },
})

require("xcodebuild").setup({
  -- put some options here or leave it empty to use default settings
  code_coverage = {
    enabled = true,
  },
  logs = {
    logs_formatter = nil,
  },
})

vim.api.nvim_create_autocmd({"VimEnter", "BufReadPost"}, {
  callback = function()
    local is_git_repo = vim.fn.systemlist("git rev-parse --is-inside-work-tree")[1] == "true"
    local is_git_commit_file = vim.fn.expand("%:t") == "COMMIT_EDITMSG"

    if not is_git_commit_file and is_git_repo then
      require("nvim-tree.api").tree.toggle({ focus = false })
    end
  end,
})

-- Make :bd and :q behave as usual when tree is visible
vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
  nested = false,
  callback = function(e)
    local tree = require("nvim-tree.api").tree

    -- Nothing to do if tree is not opened
    if not tree.is_visible() then
      return
    end

    -- How many focusable windows do we have? (excluding e.g. incline status window)
    local winCount = 0
    for _, winId in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_config(winId).focusable then
        winCount = winCount + 1
      end
    end

    -- We want to quit and only one window besides tree is left
    if e.event == "QuitPre" and winCount == 2 then
      vim.api.nvim_cmd({ cmd = "qall" }, {})
    end

    -- :bd was probably issued an only tree window is left
    -- Behave as if tree was closed (see `:h :bd`)
    if e.event == "BufEnter" and winCount == 1 then
      -- Required to avoid "Vim:E444: Cannot close last window"
      vim.defer_fn(function()
        -- close nvim-tree: will go to the last buffer used before closing
        tree.toggle({ find_file = true, focus = true })
        -- re-open nivm-tree
        tree.toggle({ find_file = true, focus = false })
      end, 10)
    end
  end,
})

local dap = require("dap")
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-vscode",
  name = "lldb",
}

dap.configurations.swift = {
  {
    type = "lldb",
    request = "launch",
    name = "Launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    args = {},
    env = { "OS_ACTIVITY_DT_MODE=enable" },
  },
}

require("dapui").setup({
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "",
    current_frame = "",
    expanded = "",
  },
  layouts = {
    {
      elements = {
        {
          id = "console",
          size = 0.7,
        },
        {
          id = "repl",
          size = 0.3,
        },
      },
      position = "bottom",
      size = 10,
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
})
