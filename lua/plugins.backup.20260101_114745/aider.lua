return {
  "joshuavial/aider.nvim",
  event = "VeryLazy",
  opts = {
    auto_manage_context = true,
    default_bindings = false, -- Disable default bindings to avoid conflict with avante
    debug = false,
  },
  keys = {
    { "<leader>ia", "<cmd>AiderOpen<cr>", desc = "Aider Open" },
    { "<leader>ib", "<cmd>AiderBackground<cr>", desc = "Aider Background" },
    { "<leader>ih", "<cmd>AiderAddCurrentFile<cr>", desc = "Aider Add File" },
    { "<leader>id", "<cmd>AiderDrop<cr>", desc = "Aider Drop File" },
  },
}
