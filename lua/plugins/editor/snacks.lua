-- Snacks: disable image integration (Warp lacks kitty graphics protocol).
return {
  {
    "folke/snacks.nvim",
    opts = {
      image = { enabled = false },
    },
  },
}
