local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = true,
  sources = {
    formatting.black.with({ extra_args = { "--fast" } }),
    -- formatting.prettier.with({
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    --   filetypes = {
    --     "javascript",
    --     "typescript",
    --     "css",
    --     "scss",
    --     "html",
    --     "json",
    --     "yaml",
    --     "markdown",
    --     "graphql",
    --     "md",
    --     "txt",
    --   },
    -- }),
    formatting.stylua,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
    end
    -- vim.cmd [[
    --   augroup document_highlight
    -- 	autocmd! * <buffer>
    -- 	autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
    -- 	autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    --   augroup END
    -- ]]
  end,
})
