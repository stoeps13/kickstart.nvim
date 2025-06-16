local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local getPath = function()
  local current_file_path = vim.fn.expand '%:p'
  local parent_path = vim.fn.fnamemodify(current_file_path, ':h:h')
  return parent_path
end

local date = function()
  return { os.date '%Y-%m-%d' }
end

return {
  s('meta', {
    t { '---', 'title: ' },
    i(1, 'note_title'),
    t { '', 'author: ' },
    i(2, 'author'),
    t { '', 'date: ' },
    f(date, {}),
    t { '', 'categories: [' },
    i(3, ''),
    t { ']', 'lastmod: ' },
    f(date, {}),
    t { '', 'tags: [' },
    i(4),
    t { ']', 'comments: true', '---', '' },
    i(0),
  }),

  s('home', {
    t '[[/index|Home]]',
  }),

  s('to_back', {
    t '[[',
    t '//',
    f(getPath),
    t '/',
    i(1, 'back directory'),
    t '|Back]]',
  }),

  s('h1', {
    t '# ',
    i(1, 'Name header'),
  }),

  s('h2', {
    t '## ',
    i(1, 'Name header'),
  }),

  s('h3', {
    t '### ',
    i(1, 'Name header'),
  }),

  s('h4', {
    t '#### ',
    i(1, 'Name header'),
  }),

  s('link', {
    t '[',
    i(1, 'Linktitle'),
    t '](',
    i(2, 'Location'),
    t ')',
  }),

  s('todo_incomp', {
    t '- [ ] ',
    i(1, 'reminder'),
  }),

  s('todo_done', {
    t '- [X] ',
    i(1, 'reminder'),
  }),

  s('todo_notyet', {
    t '- [.] ',
    i(1, 'reminder'),
  }),

  s('comingsoon', {
    t { '[[/index|Home]]', '', '' },
    t 'Coming Soon...',
  }),

  s('InterlocUpdate', {
    t { '## ' },
    f(date, {}),
    t { ' Interloc Call', '* ' },
    i(1, 'updates'),
  }),

  s('todo_open', {
    t '## Open tasks | status:pending -VISIBLE',
  }),
}

