local parsers = {
    "vim",
    "vimdoc",
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "jsdoc",
    "bash",
    "c_sharp",
    "python",
    "xml",
    "liquid",
    "markdown",
    "markdown_inline",
    "latex",
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({})

        -- This is a no-op for parsers that are already installed. New parsers
        -- are installed asynchronously into Neovim's data directory.
        treesitter.install(parsers)

        -- The rewritten plugin supplies parsers and queries. Neovim itself now
        -- starts highlighting when a matching file type is opened.
        vim.api.nvim_create_autocmd("FileType", {
            desc = "Enable Tree-sitter highlighting",
            pattern = {
                "vim",
                "bash",
                "c",
                "cs",
                "help",
                "javascript",
                "liquid",
                "lua",
                "markdown",
                "python",
                "rust",
                "tex",
                "typescript",
                "xml",
            },
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
