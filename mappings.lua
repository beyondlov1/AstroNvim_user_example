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
    ["<S-j>"] = { "<C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>" },
    ["<S-k>"] = { "<C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>" },
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
    ["v\'"] = { "vi\"" },
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
    -- ["gl"] = { 
    --   function() require("telescope.builtin").resume() end, desc = "Find words in current buffer" 
    -- },
    ["gl"] = {
      "*"
    },
    ["s"] = {
      ":s/"
    },
    ["\""] = {
      "viwdi\"<esc>pa\"<esc>"
    },
    -- ["zd"] = {
    --   function()
    --     -- local lnum,col = vim.fn.searchpairpos('{', 'col', '}', 'n')
    --     -- local lnum,col = vim.fn.searchpos('{', 'col', '}', 'n')
    --     -- local b = vim.fn.search('"', 'b', vim.fn.line("."))
    --     local e = vim.fn.search('[".\'\\)\\]\\}\n$]', '', vim.fn.line("."))
    --     -- "hello word"  ("yes
    --   end
    -- },
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
    ["gp"] = {
      "<cmd>!copyq paste;copyq next;<cr><cr>"
    },
    ["gsue"] = {
      -- 暂未完成
      function ()
        local startpos = vim.fn.getpos('v')
        -- local endpos = vim.fn.getcurpos()
        -- vim.fn.printf("%d %d", startpos[2], endpos[2])
        local endpos = vim.api.nvim_win_get_cursor(0)
        print(endpos[2])
        -- return vim.fn.getcurpos()
      end,
    },
    ["gsu"] = {
      "vaw:s/\\<\\u\\|\\l\\u\\|\\d\\u/\\= join(split(tolower(submatch(0)), '\\zs'), '_')/g<cr>"
    },
    ["gsc"] = {
      "vaw:s/_\\l/\\= join(split(toupper(submatch(0)), '_'), '')/g<cr>"
    },
    ["gss"] = {
      "yiw:s/"
    }
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
    ["s"] = {
      ":s/"
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["S-k"] = false
  },
}
