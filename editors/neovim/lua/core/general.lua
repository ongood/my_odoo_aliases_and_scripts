-- general
vim.opt.mouse = ""
vim.g.mapleader = " "
vim.keymap.set("n", "-", vim.cmd.Ex)

-- editor
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
-- turn off search higlight on <leader><space>
vim.keymap.set('n', '<leader> ', vim.cmd.nohlsearch, {})
-- show search result in the middle of the screen
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})
-- highlight last inserted text
vim.keymap.set('n', 'gV', '`[v`]', {})

-- style
vim.opt.number = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.showcmd = true
vim.opt.list = true
-- with this, copying bits of code (with the mouse) includes dots as spaces,
-- use "*y to cleanly (properly) copying to the clipboard
vim.opt.listchars = 'trail:+,tab:>-,nbsp:␣,space:.'


-- other remapping
vim.keymap.set('i', 'jkjk', '<Esc>')
vim.keymap.set('i', 'jjj', '<Esc>')
vim.keymap.set('i', 'kkk', '<Esc>')

-- other
vim.opt.wildmenu = true
