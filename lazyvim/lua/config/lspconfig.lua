-- disable the autoformating because it's should be handled by other
require("lspconfig").vtsls.setup({
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
  end,
})
