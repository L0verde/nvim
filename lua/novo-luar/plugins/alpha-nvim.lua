return{
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.header.val = {
             [[      .:0          ·       ]],
             [[   .::::00\        |000\    ]],
             [[ .::::::000\       |0000\   ]],
             [[ |11:::::0000\     |00000\ 0000000000      ,o000000o.      0\ \           /0' ==         ,0.       ,0.         ]],
             [[ |111::::00000\    |000000| 0000          .0000     `00.    0\0\         /0'            ,000.     ,000.        ]],
             [[ |11111::000000\   |000000| 0000         ,00000       `01    0\0\       /0'   00       .`0000.   .`0000.       ]],
             [[ |111111:0000000\  |000000| 0000         000000        `01    0\0\     /0'    00      ,0.`0000. ,0.`0000.      ]],
             [[ |11111|  \000000\ :000000| 000000000000 000000         00     0\0\   /0'     00     ,0'0.`0000,0^0.`0000.     ]],
             [[ |11111|   \000000 :·00000| 0000         000000         00      0\0\ /0'      00    ,0' `0.`0000' `0.`0000.    ]],
             [[ |11111|    \000000:::0000| 0000         000000        ,01       0\0v0'       00   ,0'   `0.`00'   `0.`0000.   ]],
             [[ |11111|      \0000:::·00/  000o.          0 0 0000               0\0/        00  ,0'   0 0000          ,000.  ]],
             [[  \1111|       \00::::··/  000000000000     `0000000P'             `V         00 ,0'         `         `0.`000.]],

         }
         dashboard.section.buttons.val = {
             dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
             dashboard.button( "q", "󰅚  Quit NVIM" , ":qa<CR>"),
         }
         local handle = io.popen('fortune')
         local fortune = handle:read("*a")
         handle:close()
         dashboard.section.footer.val = fortune

         dashboard.config.opts.noautocmd = true

         vim.cmd[[autocmd User AlphaReady echo 'ready']]

         alpha.setup(dashboard.config)
     end
}
