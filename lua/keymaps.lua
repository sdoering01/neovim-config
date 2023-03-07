local bind = vim.keymap.set

bind('n', '<C-f>', function() vim.fn.system('tmux neww tmux-sessionizer') end, { silent = true })

bind('n', 'S', ':%s//g<Left><Left>')

bind('v', 'J', ":m '>+1<CR>gv")
bind('v', 'K', ":m '<-2<CR>gv")
bind('v', '<leader>j', "J")

bind('i', 'jk', '<Esc>')
bind('i', 'kj', '<Esc>')

-- Jump in quickfix list
bind('n', '<leader>j', ':cn<CR>', { silent = true })
bind('n', '<leader>k', ':cp<CR>', { silent = true })

bind('n', '<leader>x', function() vim.cmd('!chmod +x %') end)
bind('n', '<leader>e', function() vim.cmd('!./%') end)

bind({ 'n', 'v' }, '<leader>y', '"+y')

-- Write without running autocommands if for example formatting is not wanted
bind('n', '<leader>w', ':noautocmd w<CR>')
