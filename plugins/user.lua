return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- 'preservim/nerdcommenter',
    {
      "ggandor/leap.nvim",
      keys = {
        { "f", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap forwari to" },
        { "<s-f>", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        -- { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap forward till" },
        -- { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
        -- { "S", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
      },
    }
  }
