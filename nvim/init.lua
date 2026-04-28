-- La mayoria de configuraciones y funciones inteligentes son de:
-- @https://github.com/hugoocoto
-------------------------------------------------------------------------------
-- Options
-------------------------------------------------------------------------------
vim.g.did_install_default_menus = 1 -- avoid stupid menu.vim (saves ~100ms)
vim.g.loaded_netrwPlugin = 0        -- Disable netrw. 🚮 (comment from justinmk)

vim.g.mapleader = " "               -- leader key (Space)
vim.o.tabstop = 4                   -- tab display width
vim.o.shiftwidth = 4                -- indent width
vim.o.softtabstop = -1              -- follow shiftwidth
vim.o.expandtab = true              -- tabs -> spaces
vim.o.smartindent = true            -- auto-indent new lines
vim.o.relativenumber = true         -- relative line numbers
vim.o.number = true                 -- absolute current line number
vim.o.wrap = false                  -- disable line wrapping
vim.o.scrolloff = 4                 -- keep context around cursor
vim.o.hlsearch = false              -- don't persist search highlight
vim.o.incsearch = true              -- incremental search
vim.o.ignorecase = true             -- case-insensitive search
vim.o.smartcase = true              -- smart case when uppercase used
vim.o.updatetime = 1000             -- slower idle update events
vim.o.conceallevel = 0              -- show concealed text plainly
vim.o.lazyredraw = true             -- skip some intermediate redraws

--vim.o.colorcolumn = "+0"            -- highlight at textwidth
vim.o.textwidth = 80                -- preferred line width
vim.o.signcolumn = "yes"            -- always show sign column

vim.o.swapfile = false              -- disable swap files
vim.o.backup = false                -- disable backup files
vim.o.undofile = true               -- persistent undo

vim.o.undodir = vim.fn.expand("$XDG_CACHE_HOME/nvim/undodir")
vim.cmd("set path+=/usr/lib/gcc/**/include,**")

vim.o.clipboard = "unnamedplus"    -- use system clipboard
vim.o.ruler = false                -- hide ruler
--vim.o.showcmd = false              -- hide partial command display
--vim.o.showmode = false             -- hide default mode text
vim.opt.spelllang = { "en", "es" } -- spellcheck languages
-------------------------------------------------------------------------------
-- Diagnostics
-------------------------------------------------------------------------------
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
    severity_sort = true,
})
-------------------------------------------------------------------------------
-- Remap
-------------------------------------------------------------------------------
vim.keymap.set('n', '<leader>e', ":Oil<cr>")
-------------------------------------------------------------------------------
-- Transformar lo seleccionado a negrita o cursiva en markdown
-------------------------------------------------------------------------------
vim.keymap.set('x', '<C-b>', [[c**<esc>P]])
vim.keymap.set('x', '<C-_>', [[c__<esc>P]])
-------------------------------------------------------------------------------
-- Pickers
-------------------------------------------------------------------------------
-- Buscar archivos del proyecto
vim.keymap.set('n', '<Leader>ff', '<Cmd>Pick files<CR>', { desc = 'Files' })
-- Buscar texto dentro de los archivos del proyecto
vim.keymap.set('n', '<Leader>fg', '<Cmd>Pick grep_live<CR>', { desc = 'Grep live' })
-- Buscar la palabra que tengas bajo el cursor en todo el proyecto
vim.keymap.set('n', '<Leader>fG', '<Cmd>Pick grep pattern="<cword>"<CR>', { desc = 'Grep current word' })
-- Ver lista de archivos que tienes abiertos con nvim
vim.keymap.set('n', '<Leader>fb', '<Cmd>Pick buffers<CR>', { desc = 'Buffers' })
-- Buscar errores en el código del archivo
vim.keymap.set('n', '<Leader>fd', '<Cmd>Pick diagnostic scope="current"<CR>', { desc = 'Diagnostic buffer' })
-- Buscar errores en el código de los archivos del proyecto
vim.keymap.set('n', '<Leader>fD', '<Cmd>Pick diagnostic scope="all"<CR>', { desc = 'Diagnostic workspace' })
-- Cosas de git
-- vim.keymap.set('n', '<Leader>fc', '<Cmd>Pick git_commits<CR>', { desc = 'Commits (all)' })
-- vim.keymap.set('n', '<Leader>fC', '<Cmd>Pick git_commits path="%"<CR>', { desc = 'Commits (buf)' })
-- vim.keymap.set('n', '<Leader>fa', '<Cmd>Pick git_hunks scope="staged"<CR>', { desc = 'Added hunks (all)' })
-- Historial de nvim
vim.keymap.set('n', '<Leader>f:', '<Cmd>Pick history scope=":"<CR>', { desc = '":" history' })
-- Historial de busqueda
vim.keymap.set('n', '<Leader>f/', '<Cmd>Pick history scope="/"<CR>', { desc = '"/" history' })
-- Busqueda en el manual de ayuda de nvim
vim.keymap.set('n', '<Leader>fh', '<Cmd>Pick help<CR>', { desc = 'Help tags' })
-- Recuperar ultima busqueda
vim.keymap.set('n', '<Leader>fr', '<Cmd>Pick resume<CR>', { desc = 'Resume' })
-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------
vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",

    "https://github.com/stevearc/oil.nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/nvim-mini/mini.extra",
})
-------------------------------------------------------------------------------
-- Plugin setup
-------------------------------------------------------------------------------
-- Funcion que desplega el menu
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = false })
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
    end,
})

-- Funcion especial cuando el menu es desplegado para Tab
vim.keymap.set('i', '<Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-n>' end
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local text_before_cursor = string.sub(line, 1, col)
    if string.match(text_before_cursor, "/$") then return '<C-x><C-f>' end
    return '<C-x><C-o>'
end, { expr = true, replace_keycodes = true })

-- Funcion especial cuando el menu es desplegado para Shift + Tab
vim.keymap.set('i', '<S-Tab>', function()
    if vim.fn.pumvisible() == 1 then return '<C-p>' end
    return '<S-Tab>'
end, { expr = true, replace_keycodes = true })

-- Funcion especial cuando el menu es desplegado para enter
vim.keymap.set('i', '<CR>', function()
    if vim.fn.pumvisible() == 1 then return '<C-y>' end
    return '<CR>'
end, { expr = true, replace_keycodes = true })

-- Completion menu trigger on triggerCharacters
vim.api.nvim_create_autocmd("InsertCharPre", {
    callback = function(ev)
        local char = vim.v.char
        local clients = vim.lsp.get_clients({ bufnr = ev.buf })

        for _, client in ipairs(clients) do
            local provider = client.server_capabilities.completionProvider
            if provider and provider.triggerCharacters then
                if vim.tbl_contains(provider.triggerCharacters, char) then
                    vim.schedule(function()
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true),
                            "n",
                            false
                        )
                    end)
                    break
                end
            end
        end
    end,
})

require 'mini.extra'.setup()
require 'mini.pick'.setup()
require 'oil'.setup()
-------------------------------------------------------------------------------
-- LSP
-------------------------------------------------------------------------------
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true), }
        }
    }
})

vim.lsp.enable({
    'clangd',
    'lua_ls',
    'bashls',
    'html',
    'cssls',
    'dockerls',
    'rust_analyzer',
})
-------------------------------------------------------------------------------
-- Misc
-------------------------------------------------------------------------------
