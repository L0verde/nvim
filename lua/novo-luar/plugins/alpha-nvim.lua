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
      [[ |11:::::0000\     |00000\ 000000000000    .:00000000;,      .             .  ==         /\.        /\         ]],
      [[ |111::::00000\    |000000| 0000          .0000     `00.    0\.\         /./            /==\.      /..\        ]],
      [[ |11111::000000\   |000000| 0000         ,00000       `01    0\.\       /./   11       /====\.    /....\       ]],
      [[ |111111:0000000\  |000000| 0000         000000        `01    0\.\     /./    00      /======\.  /......\      ]],
      [[ |11111|  \000000\ :000000| 000000000000 000000         00     0\.\   /./     00     /=/\=====\./........\     ]],
      [[ |11111|   \000000 :·00000| 0000         000000         00      0\.\ /./      11    /=/  \=====v... ......\    ]],
      [[ |11111|    \000000:::0000| 0000         000000        ,01       0\.v./       01   /=/    \====/..   ......\   ]],
      [[ |11111|     \00000:::·00/  000o.          0 0 0000               0\./        10  /=/      \==/..     ..\...\  ]],
      [[  \1111|      \000::::··/  0000000000000    `0000000P'             `V         00 /=/        \/.         .\...\ ]],

    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞 Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
      dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "󰿅  Quit Neovim", ":qa<CR>"),
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
