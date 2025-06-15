local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('grid', {
    t '#slide[',
    t { '', '  #grid(' },
    t { '', '    columns: (2fr, 2fr),' },
    t { '', '    gutter: 0.1em,' },
    t { '', '    [' },
    t { '', '- ' },
    i(1, 'column 1'),
    t { '', '    ],[' },
    t { '', '- ' },
    i(2, 'column 2'),
    t { '', '    ])' },
    t { '', '- ' },
    i(3, 'spans both columns'),
    t { '', ']' },
  }),
  s('figure', {
    t '#figure(',
    t { '', '  image("' },
    i(1, 'image path'),
    t '", width: ',
    i(2, '80%'),
    t '),',
    t { '', 'caption: [' },
    t { '', '    ' },
    i(3, 'caption text'),
    t { '', '  ]' },
    t { '', ')' },
  }),
  s('speaker', {
    t '#pdfpc.speaker-note(',
    t { '', '  ```md' },
    t { '', '  ' },
    i(1, 'speaker notes'),
    t { '', '  ```' },
    t { '', ')' },
  }),
}
