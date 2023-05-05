return {
  n = {
        ["<C-q>"] = false,
        ["<leader><space>"] = { function() require("telescope.builtin").find_files() end, desc = "Find files" }
  },
  t = {
        ["<C-\\>"] = "<C-\\><C-n>",
  },
}
