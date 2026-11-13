return {
    settings = {
        pylsp = {
            plugins = {
                -- Linter / Style Overrides (Disabling older/redundant tools)
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },

                -- Code Formatters (Enable black & isort if installed via pip)
                black = { enabled = true },
                isort = { enabled = true },

                -- Type Checking
                pylsp_mypy = {
                    enabled = true,
                    live_mode = true,
                },

                rope_completion = {
                    enabled = true,
                },
                rope_autoimport = { enabled = true },
            },
        },
    },
}
