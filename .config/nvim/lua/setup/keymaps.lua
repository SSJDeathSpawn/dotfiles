return {
    -- Useful plugin to show you pending keybinds.
    { 
        'folke/which-key.nvim', 
        opts = {},
        config = function()
            require('config.keymaps')
        end
    },

}
