local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
  return
end

local kind_icons = {
  Class       = " ",
  Color       = " ",
  Constant    = " ",
  Constructor = " ",
  Enum        = " ",
  EnumMember  = " ",
  Event       = " ",
  Field       = " ",
  File        = " ",
  Folder      = " ",
  Function    = " ",
  Interface   = " ",
  Keyword     = " ",
  Method      = " ",
  Module      = " ",
  Operator    = " ",
  Package     = " ",
  Property    = " ",
  Reference   = " ",
  Snippet     = " ",
  String      = "s]",
  Struct      = " ",
  Text        = " ",
  Unit        = "塞",
  Value       = " ",
  Variable    = " ",
  Collapsed   = " ",
}

aerial.setup {
  backends = { "treesitter", "lsp" },
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  icons = kind_icons,
}
