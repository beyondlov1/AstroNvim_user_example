return {
  {
    "git@gitee.com:beyondlov1/bookmarks.nvim.git",
    dependencies = {
      { "stevearc/dressing.nvim" }, -- optional: to have the same UI shown in the GIF
    },
    event = "VimEnter",
    config = function()
      require("bookmarks").setup {
        json_db_path = vim.fs.normalize(vim.fn.stdpath "config" .. "/bookmarks.db.json"),
        signs = {
          mark = { icon = "⚑", color = "grey" },
        },
      }
      vim.keymap.set(
        { "n", "v" },
        "bb",
        "<cmd>BookmarksMarkSimple<cr>",
        { desc = "Mark current line into active BookmarkList." }
      )
      vim.keymap.set(
        { "n", "v" },
        "bl",
        "<cmd>BookmarksGoto<cr>",
        { desc = "Go to bookmark at current active BookmarkList" }
      )
      -- vim.keymap.set({ "n", "v" }, "ma", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })
      -- vim.keymap.set({ "n", "v" }, "mg", "<cmd>BookmarksGotoRecent<cr>", { desc = "Go to latest visited/created Bookmark" })
    end,
  },
  -- {
  --   "tomasky/bookmarks.nvim",
  --   event = "VimEnter",
  --   after = "telescope.nvim",
  --   config = function()
  --     -- require('bookmarks').setup()
  --     require('telescope').load_extension('bookmarks')
  --     require('bookmarks').setup {
  --       -- sign_priority = 8,  --set bookmark sign priority to cover other sign
  --       save_file = vim.fn.expand "$HOME/.bookmarks", -- bookmarks save file path
  --       keywords =  {
  --         ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
  --         ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
  --         ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
  --         ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
  --       },
  --       on_attach = function(bufnr)
  --         local bm = require "bookmarks"
  --         local tel = require "telescope"
  --         local map = vim.keymap.set
  -- map("n","bm",bm.bookmark_toggle) -- add or remove bookmark at current line
  --         map("n","bi",bm.bookmark_ann) -- add or edit mark annotation at current line
  --         map("n","bc",bm.bookmark_clean) -- clean all marks in local buffer
  --         map("n","bn",bm.bookmark_next) -- jump to next mark in local buffer
  --         map("n","bp",bm.bookmark_prev) -- jump to previous mark in local buffer
  --         map("n","bl",tel.extensions.bookmarks.list) -- show marked file list in quickfix window
  --         map("n","bx",bm.bookmark_clear_all) -- removes all bookmarks
  --       end
  --     }
  --   end
  -- },
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
          keys = { "t", "T", "," },
        },
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
  {
    "git@gitee.com:beyondlov1/fcitx.nvim.git",
    event = "User AstroFile",
  },
  {
    "stevearc/conform.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    event = { "BufWritePre" },
    -- Customize or remove this keymap to your liking
    keys = {
      {
        -- "<leader>f",
        "<C-F>",
        function() require("conform").format { async = true } end,
        mode = "",
        desc = "格式化代码",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
      },
    },
  },
}
