return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- Go
        "go",
        "gomod",
        "gowork",
        "gosum",

        -- Rust
        "rust",
        "ron",

        -- TypeScript
        -- Astro
        "astro",
        "css",
        "svelte",
        "prisma",

        -- Git
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",

        -- Json
        "json5",

        -- Docker
        "dockerfile",

        -- Terraform
        "terraform",
        "hcl",
      },
    },
  },
}
