local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

--this is to run flutter lsp, this plugin does not require flutter lsp servers
--   to be configured using lsp config or installer
local ok, _= pcall(require, "flutter-tools")
if not ok then
  return
end
require("flutter-tools").setup{} -- use defaults


