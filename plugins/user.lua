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
    -- {
    --   "ggandor/leap.nvim",
    --   keys = {
    --     { "f", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "Leap forwari to" },
    --     { "<s-f>", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "Leap backward to" },
    --     -- { "x", "<Plug>(leap-forward-till)", mode = { "x", "o" }, desc = "Leap forward till" },
    --     -- { "X", "<Plug>(leap-backward-till)", mode = { "x", "o" }, desc = "Leap backward till" },
    --     -- { "S", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "Leap from window" },
    --   },
    -- },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      vscode = true,
      opts = {
        modes = {
          char = {
            keys = {  "t", "T", "," },
          }
        },
      },
      keys = {
        {
          "f",
          mode = { "n", "x", "o" },
          function() require("flash").jump() end,
          desc = "Flash",
        },
        {
          "F",
          mode = { "n", "o", "x" },
          function() require("flash").treesitter() end,
          desc = "Flash Treesitter",
        },
        -- {
        --   "r",
        --   mode = "o",
        --   function() require("flash").remote() end,
        --   desc = "Remote Flash",
        -- },
        -- {
        --   "R",
        --   mode = { "o", "x" },
        --   function() require("flash").treesitter_search() end,
        --   desc = "Treesitter Search",
        -- },
      },
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl", 
      event = "User AstroFile",
      opts = {
        indent = {
          char = "│",
        },
        scope = {
          enabled = false,
        },
        exclude = {
          filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "neo-tree" },
        },
        whitespace = {
          remove_blankline_trail = true,
        },
      },
    },
  }
