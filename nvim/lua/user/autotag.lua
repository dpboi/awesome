local status_ok, ntags = pcall(require, "nvim-ts-autotag")
if not status_ok then
  return
end

require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  }
}
