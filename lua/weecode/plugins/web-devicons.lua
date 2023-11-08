return {
  "nvim-tree/nvim-web-devicons",
  config = function ()
    require("nvim-web-devicons").setup({
      gql = {
        icon = "",
        color = "e535ab",
        cterm_color = "199",
        name = "GraphQL"
      }
    })
  end
}
