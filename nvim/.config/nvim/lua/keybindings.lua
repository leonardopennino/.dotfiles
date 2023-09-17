local map = require("utils").map

vim.g.mapleader = " "

-- Exit insert mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
-- wrap
--map("n", "<Leader>wr", ":set wrap! linebreak!<cr>")
map("n", "j", "gj")
map("n", "k", "gk")

-- navigation
--- behave like other capitals
map("n", "Y", "y$")

--- keeping it centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

--- moving text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")

-- Better window navigation
-- map("n", "<C-S-h>", "<C-w>h")
-- map("n", "<C-S-j>", "<C-w>j")
--map("n", "<C-S-k>", "<C-w>k")
--map("n", "<C-S-l>", "<C-w>l")

-- Resize with arrows
--map("n", "<C-Up>", ":resize -2<CR>")
--map("n", "<C-Down>", ":resize +2<CR>")
--map("n", "<C-Left>", ":vertical resize -2<CR>")
--map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Navigate and reorder buffers using bufferline
map("n", "<S-l>", ":bn<CR>")
map("n", "<S-h>", ":bp<CR>")
-- Buffer Actions
map("n", "<leader>w", ":w!<CR>:bdelete<CR>")
map("n", "<leader>s", ":w<CR>")
map("n", "<leader>qq", ":wqall!<CR>")
-- telescope
map("n", "<Leader>ff", "<cmd>Telescope fd<cr>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<Leader>fd", "<cmd>Telescope lsp_document_symbols<cr>")

-- quicklist
map("n", "<leader>qn", "<cmd>:cnext<cr>")
map("n", "<leader>qp", "<cmd>:cprev<cr>")
map("n", "<leader>qo", "<cmd>:copen<cr>")

-- lua tree
map("n", "<Leader>tt", "<cmd>NvimTreeToggle<cr>")
map("n", "<Leader>tf", "<cmd>NvimTreeFindFileToggle<cr>")
map("n", "<Leader>tr", "<cmd>NvimTreeRefresh<cr>")

-- Trouble
map("n", "<Leader>dw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<Leader>dd", "<cmd>Trouble document_diagnostics<cr>")
-- language server
map("n", "<Leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader>lsh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Leader>lrr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<Leader>lrn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<Leader>lca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<Leader>lsd", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "<Leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<Leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
map("n", "<Leader>lf", "<cmd>Format<CR>")

-- neogit
map("n", "<Leader>go", "<cmd>Neogit<CR>")
map("n", "<Leader>gc", "<cmd>Neogit commit<CR>")
map("n", "<Leader>gws", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>")
map("n", "<Leader>gwc", "<cmd>:lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>")

--- zen-mode
map("n", "<leader>z", "<cmd>ZenMode<cr>")
