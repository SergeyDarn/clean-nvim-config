return {
    telescope = {
        layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.95,
            height = 0.9,
            border = "none",
            {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = true },
                {
                    win = "input",
                    height = 1,
                    border = true,
                    title = "{title} {live} {flags}",
                    title_pos = "center",
                },
            },
            {
                win = "preview",
                title = "{preview:Preview}",
                width = 0.65,
                border = true,
                title_pos = "center",
            },
        },
    },
    default = {
        layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 90,
            min_height = 20,
            height = 0.8,
            {
                box = "vertical",
                border = "rounded",
                title = "{title} {live} {flags}",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.7 },
        },
    },
    dropdown = {
        layout = {
            backdrop = false,
            row = 1,
            width = 0.45,
            min_width = 60,
            height = 0.9,
            border = "none",
            box = "vertical",
            {
                win = "preview",
                title = "{preview}",
                height = 0.65,
                border = true,
            },
            {
                box = "vertical",
                border = true,
                title = "{title} {live} {flags}",
                title_pos = "center",
                { win = "input", height = 1, border = "bottom" },
                { win = "list", border = "none" },
            },
        },
    },
}
