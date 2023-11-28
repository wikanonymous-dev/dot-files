return {
  "rcarriga/nvim-notify",
  config = function ()
    require("notify").setup({
      background_color = "#000000",
      enabled = false
    })
  end
}
