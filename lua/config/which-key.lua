local wk = require('which-key')

-- Document existing key chains (v3 API)
wk.add({
  { "<leader>c", group = "[C]ode" },
  { "<leader>d", group = "[D]ocument" },
  { "<leader>g", group = "[G]it" },
  { "<leader>h", group = "Git [H]unk" },
  { "<leader>r", group = "[R]ename" },
  { "<leader>s", group = "[S]earch" },
  { "<leader>t", group = "[T]oggle" },
  { "<leader>w", group = "[W]orkspace" },
  { "<leader>x", group = "[X]ray" },
})

-- Register visual mode mappings
wk.add({
  { "<leader>h", group = "Git [H]unk", mode = "v" },
})
