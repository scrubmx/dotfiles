-------------------------------------------------
-- Notes & Tips
-------------------------------------------------

-- Add plugins to ~/.config/nvim/lua/plugins.lua, then run :PackerSync
-- Press 'zz' to instantly center the line where the cursor is located
-- Change quotes with cs'" or cs"'
-- Press "*y to copy to system clipboard

-------------------------------------------------
-- General
-------------------------------------------------

-- Move selected lines Up/Down in Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-------------------------------------------------
-- Tabs
-------------------------------------------------

-- Switch between tabs
-- 1gt, 2gt, 3gt, ...
--
-- Switch tabs with Ctrl + [Left|Right]
-- https://superuser.com/questions/410982/in-vim-how-can-i-quickly-switch-between-tabs#answer-884981
-- You may need to disable the default Mission Control spaces keyboard shortcuts
-- https://stackoverflow.com/questions/15719135/how-to-disable-keyboard-shortcuts-in-mac-os-x#answer-15719195
vim.keymap.set('n', '<C-Left>', '<Cmd>tabprevious<CR>', { noremap = true })
vim.keymap.set('n', '<C-Right>', '<Cmd>tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<Tab>', '<Cmd>tabnext<CR>', { noremap = true })
vim.keymap.set('n', '<S-Tab>', '<Cmd>tabprevious<CR>', { noremap = true })

-------------------------------------------------
-- Splits
-------------------------------------------------

-- Split window and move focus to new splits
vim.keymap.set('n', 'ss', '<Cmd>split<CR><C-w>w', { noremap = true })
vim.keymap.set('n', 'sv', '<Cmd>vsplit<CR><C-w>w', { noremap = true })

-- Move between splits
vim.keymap.set('n', 's<Left>', '<C-w>h', { noremap = true })
vim.keymap.set('n', 's<Down>', '<C-w>j', { noremap = true })
vim.keymap.set('n', 's<Up>', '<C-w>k', { noremap = true })
vim.keymap.set('n', 's<Right>', '<C-w>l', { noremap = true })

vim.keymap.set('n', 'sh', '<C-w>h', { noremap = true })
vim.keymap.set('n', 'sj', '<C-w>j', { noremap = true })
vim.keymap.set('n', 'sk', '<C-w>k', { noremap = true })
vim.keymap.set('n', 'sl', '<C-w>l', { noremap = true })

-------------------------------------------------
-- NeoTree
-------------------------------------------------

-- Press <leader>1 to reveal neo-tree
-- Press (a) to add a new file
-- Press (A) to add a new directory
-- Press (c) to copy a file
-- Press (C) to close tree node
-- Press (d) to delete a file
-- Press (m) to move a file
-- Press (q) to quit
-- Press (r) to rename a file
-- Press (R) to refresh
-- Press (s) to open file in v-split
-- Press (S) to open file in split
-- Press (t) to open file in a new tab

-------------------------------------------------
-- Code Folding
-------------------------------------------------

-- ,zf#j creates a fold from the cursor down # lines
-- ,zf/ string creates a fold from the cursor to string
-- ,zj moves the cursor to the next fold
-- ,zk moves the cursor to the previous fold
-- ,za toggle a fold at the cursor
-- ,zo opens a fold at the cursor
-- ,zO opens all folds at the cursor
-- ,zc closes a fold under cursor
-- ,zm increases the foldlevel by one
-- ,zM closes all open folds
-- ,zr decreases the foldlevel by one
-- ,zR decreases the foldlevel to zero -- all folds will be open
-- ,zd deletes the fold at the cursor
-- ,zE deletes all folds
-- ,[z move to start of open fold
-- ,]z move to end of open fold

-------------------------------------------------
-- LSP
-------------------------------------------------

-- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
-- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
-- gD: Jumps to the declaration of the symbol under the cursor. See :help vim.lsp.buf.declaration().
-- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
-- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
-- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
-- <Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
-- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
-- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
-- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
-- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
-- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().


-------------------------------------------------
-- Telescope File Broweser
-------------------------------------------------

-- <Leader>b  open                  Open Telescope file browser (Defined in after/plugins/telescope.lua)
-- <A-c>/c    create                Create file/folder at current path (trailing path separator creates folder)
-- <S-CR>     create_from_prompt    Create and open file/folder from prompt (trailing path separator creates folder)
-- <A-r>/r    rename                Rename multi-selected files/folders
-- <A-m>/m    move                  Move multi-selected files/folders to current path
-- <A-y>/y    copy                  Copy (multi-)selected files/folders to current path
-- <A-d>/d    remove                Delete (multi-)selected files/folders
-- <C-o>/o    open                  Open file/folder with default system application
-- <C-g>/g    goto_parent_dir       Go to parent directory
-- <C-e>/e    goto_home_dir         Go to home directory
-- <C-w>/w    goto_cwd              Go to current working directory (cwd)
-- <C-t>/t    change_cwd            Change nvim's cwd to selected folder/file(parent)
-- <C-f>/f    toggle_browser        Toggle between file and folder browser
-- <C-h>/h    toggle_hidden         Toggle hidden files/folders
-- <C-s>/s    toggle_all            Toggle all entries ignoring ./ and ../
-- <Tab>      see telescope.nvim    Toggle selection and move to next selection
-- <S-Tab>    see telescope.nvim    Toggle selection and move to prev selection

-------------------------------------------------
-- CMP
-------------------------------------------------

-- <Ctrl-y>: Confirms selection
-- <Ctrl-e>: Toggles the completion (Okay, in vim the default just cancels the completion. I set it to toggle)
-- <Up>: Navigate to previous item on the list
-- <Down>: Navigate to the next item on the list
-- <Ctrl-p>: Navigate to previous item on the list
-- <Ctrl-n>: Navigate to the next item on the list
--
-- <Enter>: Confirms selection
-- <Ctrl-d>: Go to the next placeholder in the snippets
-- <Ctrl-b>: Go to the previous placeholder in the snippets
-- <Tab>: Complete when the cursor is inside a word (When menu is visible it'll navigate to the next item in the list)
-- <S-Tab>: When the completion menu is visible navigate to the previous item in the list

-------------------------------------------------
-- Delete Commands
-------------------------------------------------

-- x            Delete the current character
-- 10x          Delete ten characters
-- dw           Delete the current word
-- 4dw          Delete the next four words
-- dd           Delete the current line
-- 5dd          Delete five lines
-- d$           Delete to the end of line
-- d0           Delete to the beginning of line
-- <Cmd>1,.d    Delete to beginning of file
-- <Cmd>.,$d    Delete to end of file
