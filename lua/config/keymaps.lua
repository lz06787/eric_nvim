-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

if vim.g.vscode then
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimKeymapsDefaults",
    callback = function()
      local vscode = require("vscode")

      keymap("n", "<leader>ff", function()
        vscode.action("workbench.action.quickOpen")
      end, { silent = true, desc = "Find Files" })

      keymap("n", "<leader>/", function()
        vscode.action("workbench.action.findInFiles")
      end, { silent = true, desc = "Find in Files" })

      keymap("n", "gd", vim.lsp.buf.definition, { silent = true, desc = "Goto Definition" })
      keymap("n", "gr", vim.lsp.buf.references, { silent = true, desc = "References" })
      keymap("n", "gi", vim.lsp.buf.implementation, { silent = true, desc = "Goto Implementation" })
      keymap("n", "K", vim.lsp.buf.hover, { silent = true, desc = "Hover" })
      keymap("n", "<F2>", vim.lsp.buf.rename, { silent = true, desc = "Rename" })
      keymap("n", "gca", vim.lsp.buf.code_action, { silent = true, desc = "Code Action" })
      keymap("n", "==", vim.lsp.buf.format, { silent = true, desc = "Format Document" })
    end,
  })
end

-- Ctrl 快捷键交给 VSCode 处理，不拦截

keymap("n", "<leader>d", '"_d', { noremap = true, silent = true, desc = "黑洞删除(operator，按motion如d/w等)" })
keymap("n", "<leader>dd", '"_dd', { noremap = true, silent = true, desc = "黑洞删除当前行" })
keymap("n", "<BS>", '"_dh', { noremap = true, silent = true, desc = "删除光标前字符" })
keymap("n", "<C-j>", "4j", { noremap = true, silent = true, desc = "向下移动4行" })
keymap("n", "<C-k>", "4k", { noremap = true, silent = true, desc = "向上移动4行" })
keymap("n", "H", "^", { noremap = true, silent = true, desc = "跳至行首" })
keymap("n", "L", "$", { noremap = true, silent = true, desc = "跳至行尾" })
keymap("n", "zR", "<cmd>set foldlevel=99<CR>", { noremap = true, silent = true, desc = "全部展开" })
keymap("n", "zC", "<cmd>set foldlevel=0<CR>", { noremap = true, silent = true, desc = "全部折叠" })
keymap("n", "zr", "<cmd>foldopen<CR>", { noremap = true, silent = true, desc = "展开当前" })
keymap("n", "zc", "<cmd>foldclose<CR>", { noremap = true, silent = true, desc = "折叠当前" })
keymap("n", "<Tab>", ">>", { noremap = true, silent = true, desc = "缩进当前行" })
keymap("n", "<S-Tab>", "<<", { noremap = true, silent = true, desc = "反缩进当前行" })

keymap("v", "<leader>d", '"_d', { noremap = true, silent = true, desc = "黑洞删除选中内容" })
keymap("v", "<BS>", '"_d', { noremap = true, silent = true, desc = "删除选中内容" })
keymap("v", "<Tab>", ">gv", { noremap = true, silent = true, desc = "缩进选中内容" })
keymap("v", "<S-Tab>", "<gv", { noremap = true, silent = true, desc = "反缩进选中内容" })
keymap("v", "H", "^", { noremap = true, silent = true, desc = "选至行首" })
keymap("v", "L", "$", { noremap = true, silent = true, desc = "选至行尾" })

local function escape_and_save()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", false)
  vim.cmd("write")
end

keymap("i", "jj", escape_and_save, { noremap = true, silent = true, desc = "退出插入模式并保存" })
keymap("i", "jk", "<ESC>", { noremap = true, silent = true, desc = "退出插入模式" })
