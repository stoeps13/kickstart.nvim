local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Function definition
  s('def', {
    t 'def ',
    i(1, 'function_name'),
    t '(',
    i(2, 'args'),
    t '):',
    t { '', '    """' },
    i(3, 'Docstring'),
    t '"""',
    t { '', '    ' },
    i(4, 'pass'),
    i(0),
  }),

  -- Class definition
  s('class', {
    t 'class ',
    i(1, 'ClassName'),
    t '(',
    i(2, 'object'),
    t '):',
    t { '', '    """' },
    i(3, 'Class docstring'),
    t '"""',
    t { '', '    ', '    def __init__(self' },
    i(4, ', args'),
    t '):',
    t { '', '        ' },
    i(5, 'pass'),
    i(0),
  }),

  -- If main
  s('main', {
    t { 'if __name__ == "__main__":', '    ' },
    i(1, 'main()'),
    i(0),
  }),

  -- Try-except
  s('try', {
    t 'try:',
    t { '', '    ' },
    i(1, 'code'),
    t { '', 'except ' },
    i(2, 'Exception'),
    t ' as e:',
    t { '', '    ' },
    i(3, 'handle_exception(e)'),
    i(0),
  }),

  -- List comprehension
  s('lc', {
    t '[',
    i(1, 'item'),
    t ' for ',
    i(2, 'item'),
    t ' in ',
    i(3, 'iterable'),
    t ' if ',
    i(4, 'condition'),
    t ']',
    i(0),
  }),

  -- Dictionary comprehension
  s('dc', {
    t '{',
    i(1, 'key'),
    t ': ',
    i(2, 'value'),
    t ' for ',
    i(3, 'item'),
    t ' in ',
    i(4, 'iterable'),
    t '}',
    i(0),
  }),

  -- Logger setup
  s('log', {
    t { 'import logging', '', 'logger = logging.getLogger(__name__)' },
    i(0),
  }),

  -- Property
  s('prop', {
    t '@property',
    t { '', 'def ' },
    i(1, 'property_name'),
    t '(self):',
    t { '', '    return self._' },
    i(2, 'property_name'),
    i(0),
  }),

  -- Dataclass
  s('dc', {
    t { 'from dataclasses import dataclass', '', '@dataclass' },
    t { '', 'class ' },
    i(1, 'ClassName'),
    t ':',
    t { '', '    ' },
    i(2, 'field: str'),
    i(0),
  }),

  -- Test function
  s('test', {
    t 'def test_',
    i(1, 'function_name'),
    t '():',
    t { '', '    # Arrange', '    ' },
    i(2, 'setup'),
    t { '', '    ', '    # Act', '    ' },
    i(3, 'result = function_call()'),
    t { '', '    ', '    # Assert', '    assert ' },
    i(4, 'result == expected'),
    i(0),
  }),
}