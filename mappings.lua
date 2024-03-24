-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    ["<a-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<a-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- ["<a-o>"] = {
    --   function()
    --     if vim.bo.filetype == "neo-tree" then
    --       vim.cmd.wincmd "p"
    --       vim.cmd.Neotree "toggle"
    --     else
    --       vim.cmd.Neotree "focus"
    --     end
    --   end,
    -- },
    ["<a-o>"] = {
      "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer"
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<S-j>"] = { "<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>" },
    ["<S-k>"] = { "<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>" },
    [";"] = { "$" },
    ["<tab>"] = { "^i<tab><esc>" },
    ["<S-tab>"] = { "^i<BS><esc>" },
    ["d;"] = { ";$" },
    ["md"] = { "diw" },
    ["my"] = { "yiw" },
    ["ms"] = { "lbPldehyiw" },
    ["L"] = { "$" },
    ["H"] = { "^" },
    ["l"] = { "e" },
    ["h"] = { "b" },
    ["<a-left>"] = { "<C-o>" },
    ["<a-right>"] = { "<C-i>" },
    ["mm"] = {
      function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Toggle comment line",
    },
    -- ["/"] = { function() require("telescope.builtin").live_grep() end, desc = "Find words" },
    ["/"] = { 
      function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find words in current buffer" 
    },
    ["s"] = {
      ":s/"
    },
    ["\""] = {
      "viwdi\"<esc>pa\"<esc>"
    },
    ["S"] = {
      ":%s/"
    },
    ["zl"] = {
      "za"
    },
    ["zm"] = {
      -- function()
      --   require("nvim-treesitter.textobjects.move").goto_previous_start( "@function.outer") 
      --   require("aerial.command").tree_toggle({bang=true})
      -- end,
      "<right><cmd>lua require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')<cr>za"
    },
    ["r"] = {
      function()
            vim.lsp.buf.rename()
      end,
    },
  },
  v = {
    ["<tab>"] = { ">" },
    ["<S-tab>"] = { "<" },
    ["<S-j>"] = { "j" },
    ["<S-k>"] = { "k" },
    [";"] = { "$" },
    ["L"] = { "$" },
    ["H"] = { "^" },
    ["mm"] = {
      "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
      desc = "Toggle comment for selection",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["S-k"] = false
  },
}
