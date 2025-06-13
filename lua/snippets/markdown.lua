local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local date = function()
  return { os.date '%Y-%m-%d' }
end

return {
  -- YAML frontmatter
  s('front', {
    t { '---', 'title: ' },
    i(1, 'Title'),
    t { '', 'date: ' },
    f(date, {}),
    t { '', 'tags: [' },
    i(2, 'tag1, tag2'),
    t { ']', '---', '', '' },
    i(0),
  }),

  -- Code block
  s('code', {
    t '```',
    i(1, 'language'),
    t { '', '' },
    i(2, 'code here'),
    t { '', '```' },
    i(0),
  }),

  -- Table
  s('table', {
    t { '| ' },
    i(1, 'Header 1'),
    t ' | ',
    i(2, 'Header 2'),
    t ' |',
    t { '', '|----------|----------|' },
    t { '', '| ' },
    i(3, 'Cell 1'),
    t ' | ',
    i(4, 'Cell 2'),
    t ' |',
    i(0),
  }),

  -- Admonition/Callout
  s('note', {
    t '> [!NOTE]',
    t { '', '> ' },
    i(1, 'Note content'),
    i(0),
  }),

  s('warn', {
    t '> [!WARNING]',
    t { '', '> ' },
    i(1, 'Warning content'),
    i(0),
  }),

  -- Task list
  s('task', {
    t '- [ ] ',
    i(1, 'Task description'),
    t { '', '- [ ] ' },
    i(2, 'Another task'),
    i(0),
  }),

  -- Link with title
  s('link', {
    t '[',
    i(1, 'text'),
    t '](',
    i(2, 'url'),
    t ' "',
    i(3, 'title'),
    t '")',
    i(0),
  }),

  -- Image
  s('img', {
    t '![',
    i(1, 'alt text'),
    t '](',
    i(2, 'image.png'),
    t ')',
    i(0),
  }),

  -- Details/Summary
  s('details', {
    t '<details>',
    t { '', '<summary>' },
    i(1, 'Summary'),
    t '</summary>',
    t { '', '', '' },
    i(2, 'Content'),
    t { '', '', '</details>' },
    i(0),
  }),
}