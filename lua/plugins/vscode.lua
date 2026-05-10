return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      if vim.g.vscode then
        opts.colorscheme = function() end
      end
    end,
  },
}
