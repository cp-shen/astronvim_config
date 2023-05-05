return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup {
        style = 'dark',
        code_style = {
          comments = 'none',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
      }
    end
  },
}
