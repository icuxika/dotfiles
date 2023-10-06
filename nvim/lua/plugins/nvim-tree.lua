-- 默认不开启
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  update_focused_file = {
    enable = true
  },
  git = {
    enable = true,
    -- ignore = false,
    timeout = 400
  },
  filters = {
    git_ignored = false
  }
})
