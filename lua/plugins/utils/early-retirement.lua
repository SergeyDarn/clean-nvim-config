require("early-retirement").setup({
    retirementAgeMins = 20,

    --
    -- Save and close buffers with unsaved changes
    --
    ignoreUnsavedChangesBufs = false,
    --
    -- Don't ignore last buffer (alternate file)
    --
    ignoreAltFile = false,
    --
    -- When a file is deleted, for example via an external program, delete the
    -- associated buffer as well. Requires Neovim >= 0.10.
    -- (This feature is independent from the automatic closing)
    --
    deleteBufferWhenFileDeleted = true,
})
