local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.plugins-config.lsp.lsp-installer"
require("user.plugins-config.lsp.lsp-setup")()
require "user.plugins-config.lsp.null-ls"

--this is to run flutter lsp, this plugin does not require flutter lsp servers
--   to be configured using lsp config or installer
local ok, _= pcall(require, "flutter-tools")
if not ok then
  return
end


