-------------------------------------------------
-- Notes & Tips
-------------------------------------------------

-- Press 'zz' to instantly center the line where the cursor is located
-- Change quotes with cs'" or cs"'
-- Press "*y to copy to the system clipboard
-- Configure iTerm2 Profiles > Keys > Key Mappings
--  * https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
--  * https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797#keyboard-strings

-------------------------------------------------
-- General
-------------------------------------------------

-- Press (gcc) To comment a line or selection. Plugin mini.comment
-- Press <leader>bd To close a buffer without altering the window layout. Plugin mini.buffremove

-- Press (dt{char}) To delete up to the next {char}
-- Press (df{char}) To delete up to and including the next {char}
-- Press (dT{char}) To delete up to the previous {char}
-- Press (dF{char}) To delete up to and including the previous {char}
-- Press (d/) To delete up to the next match of the {pattern}
-- This also works with c (change) and y (yank)

-- Remove Lines Matching a Pattern
-- https://vimtricks.com/p/remove-lines-matching-a-pattern-in-vim/
-- :g/pattern/d     Remove lines matching pattern
-- :g!/pattern/d    Remove lines that do NOT match the pattern
-- :v/pattern/d     Also removes lines that do not match the pattern

-- Move selected lines Up/Down in Visual mode
-- vim.keymap.set('v', 'J', "<Cmd>m '>+1<Return>gv=gv")
-- vim.keymap.set('v', 'K', "<Cmd>m '<-2<Return>gv=gv")

-- Increment/Decrement
vim.keymap.set('n', '+', '<C-a>', { noremap = true, silent = true })
vim.keymap.set('n', '-', '<C-x>', { noremap = true, silent = true })

-- Clear search highlight
-- vim.keymap.set('n', '<Esc>', ':nohlsearch <CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader><Space>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Reselect last visual selection after indent/outdent
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Jump half page up/down and center cursor on screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- :bd          - deletes the current buffer, error if there are unwritten changes
-- :bd!         - deletes the current buffer, no error if unwritten changes
-- :bufdo bd    - deletes all buffers, stops at first error (unwritten changes)
-- :bufdo! bd   - deletes all buffers except those with unwritten changes
-- :bufdo! bd!  - deletes all buffers, no error on any unwritten changes
--
-- :bw          - completely deletes the current buffer, error if there are unwritten changes
-- :bw!         - completely deletes the current buffer, no error if unwritten changes
-- :bufdo bw    - completely deletes all buffers, stops at first error (unwritten changes)
-- :bufdo! bw   - completely deletes all buffers except those with unwritten changes
-- :bufdo! bw!  - completely deletes all buffers, no error on any unwritten changes
--
-- :b N         - open buffer number N (as shown in ls)
-- :tabe +Nbuf  - open buffer number N in new tab
-- :bnext       - go to the next buffer (:bn also)
-- :bprevious   - go to the previous buffer (:bp also)

-- Resize window
-- vim.keymap.set('n', '<C-w><Left>', '<C-w><')
-- vim.keymap.set('n', '<C-w><Right>', '<C-w>>')
-- vim.keymap.set('n', '<C-w><Up>', '<C-w>+')
-- vim.keymap.set('n', '<C-w><Down>', '<C-w>-')

-- Prevent 'change' commands from yanking text
-- https://stackoverflow.com/questions/62675763/how-can-i-stop-a-change-from-copying-to-my-paste-buffer#answer-62676339
vim.keymap.set('n', 'c', '"_c', { noremap = true, silent = true })

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
--
-- !! Comented in favor of akinsho/bufferline.nvim plugin
-- vim.keymap.set('n', '<C-Left>', '<Cmd>tabprevious<CR>', { noremap = true })
-- vim.keymap.set('n', '<C-Right>', '<Cmd>tabnext<CR>', { noremap = true })
-- vim.keymap.set('n', '<Tab>', '<Cmd>tabnext<CR>', { noremap = true })
-- vim.keymap.set('n', '<S-Tab>', '<Cmd>tabprevious<CR>', { noremap = true })

-------------------------------------------------
-- Splits/Tabs
-------------------------------------------------

-- Create a new tab
vim.keymap.set('n', 'te', '<Cmd>tabedit<Return>', { silent = true })

-- Split window and move focus to new splits
vim.keymap.set('n', 'ss', '<Cmd>split<Return><C-w>j', { silent = true })
vim.keymap.set('n', 'sv', '<Cmd>vsplit<Return><C-w>l', { silent = true })

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
-- Telescope File Browser
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
-- <Ctrl-e>: Toggles the completion (Okay, in Vim the default just cancels the completion. I set it to toggle)
-- <Up>: Navigate to the previous item on the list
-- <Down>: Navigate to the next item on the list
-- <Ctrl-p>: Navigate to the previous item on the list
-- <Ctrl-n>: Navigate to the next item on the list
--
-- <Enter>: Confirms selection
-- <Ctrl-d>: Go to the next placeholder in the snippets
-- <Ctrl-b>: Go to the previous placeholder in the snippets
-- <Tab>: Complete when the cursor is inside a word (When the menu is visible it'll navigate to the next item in the list)
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
-- d$           Delete to the end of the line
-- d0           Delete to the beginning of line
-- <Cmd>1,.d    Delete to beginning of file
-- <Cmd>.,$d    Delete to end of file
