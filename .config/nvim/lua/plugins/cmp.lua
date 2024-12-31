vim.g.cmp_enabled = true

return {
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = { impersonate_nvim_cmp = true },
  },
  {
    'saghen/blink.cmp',
    dependencies = { dir = "/users/jacob/src/ink-nvim", name = "ink-nvim" },

    -- use a release tag to download pre-built binaries
    version = 'v0.8.2',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { "ink", 'lsp', 'path', 'snippets', 'buffer' },
        providers = {
          ink = {
            name = 'ink',
            module = 'blink.compat.source',
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  },
}
