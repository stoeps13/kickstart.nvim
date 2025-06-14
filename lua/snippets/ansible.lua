local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic playbook structure
  s('play', {
    t { '---', '- name: ' },
    i(1, 'Playbook description'),
    t { '', '  hosts: ' },
    i(2, 'all'),
    t { '', '  become: ' },
    i(3, 'yes'),
    t { '', '  vars:', '    ' },
    i(4, 'variable_name: value'),
    t { '', '  tasks:', '    - name: ' },
    i(5, 'Task description'),
    t { '', '      ' },
    i(6, 'module_name'),
    t ':',
    t { '', '        ' },
    i(7, 'parameter: value'),
    i(0),
  }),

  -- Task with common structure
  s('task', {
    t '- name: ',
    i(1, 'Task description'),
    t { '', '  ' },
    i(2, 'module_name'),
    t ':',
    t { '', '    ' },
    i(3, 'parameter: value'),
    t { '', '  tags:', '    - ' },
    i(4, 'tag'),
    i(0),
  }),

  -- Package installation
  s('pkg', {
    t '- name: Install ',
    i(1, 'package'),
    t { '', '  package:', '    name: ' },
    i(2, 'package_name'),
    t { '', '    state: ' },
    i(3, 'present'),
    i(0),
  }),

  -- Service management
  s('svc', {
    t '- name: ',
    i(1, 'Start and enable service'),
    t { '', '  service:', '    name: ' },
    i(2, 'service_name'),
    t { '', '    state: ' },
    i(3, 'started'),
    t { '', '    enabled: ' },
    i(4, 'yes'),
    i(0),
  }),

  -- Copy file
  s('copy', {
    t '- name: Copy ',
    i(1, 'file'),
    t { '', '  copy:', '    src: ' },
    i(2, 'source/path'),
    t { '', '    dest: ' },
    i(3, '/destination/path'),
    t { '', '    owner: ' },
    i(4, 'root'),
    t { '', '    group: ' },
    i(5, 'root'),
    t { '', '    mode: ' },
    i(6, '0644'),
    i(0),
  }),

  -- Template
  s('tmpl', {
    t '- name: Deploy ',
    i(1, 'template'),
    t { '', '  template:', '    src: ' },
    i(2, 'template.j2'),
    t { '', '    dest: ' },
    i(3, '/path/to/destination'),
    t { '', '    backup: yes' },
    i(0),
  }),

  -- Command/Shell
  s('cmd', {
    t '- name: ',
    i(1, 'Run command'),
    t { '', '  command: ' },
    i(2, 'command_here'),
    t { '', '  register: ' },
    i(3, 'result'),
    t { '', '  changed_when: ' },
    i(4, 'false'),
    i(0),
  }),

  -- User creation
  s('user', {
    t '- name: Create user ',
    i(1, 'username'),
    t { '', '  user:', '    name: ' },
    i(2, 'username'),
    t { '', '    group: ' },
    i(3, 'group'),
    t { '', '    home: ' },
    i(4, '/home/username'),
    t { '', '    shell: ' },
    i(5, '/bin/bash'),
    t { '', '    create_home: yes' },
    i(0),
  }),

  -- Conditional task
  s('when', {
    t '- name: ',
    i(1, 'Conditional task'),
    t { '', '  ' },
    i(2, 'module'),
    t ':',
    t { '', '    ' },
    i(3, 'parameter: value'),
    t { '', '  when: ' },
    i(4, 'condition'),
    i(0),
  }),

  -- Loop task
  s('loop', {
    t '- name: ',
    i(1, 'Task with loop'),
    t { '', '  ' },
    i(2, 'module'),
    t ':',
    t { '', '    ' },
    i(3, 'parameter: "{{ item }}"'),
    t { '', '  loop:', '    - ' },
    i(4, 'item1'),
    t { '', '    - ' },
    i(5, 'item2'),
    i(0),
  }),

  -- Handler
  s('handler', {
    t { 'handlers:', '  - name: ' },
    i(1, 'Handler description'),
    t { '', '    ' },
    i(2, 'module'),
    t ':',
    t { '', '      ' },
    i(3, 'parameter: value'),
    t { '', '    listen: ' },
    i(4, 'handler_name'),
    i(0),
  }),

  -- Block with rescue
  s('block', {
    t '- block:',
    t { '', '    - name: ' },
    i(1, 'Task in block'),
    t { '', '      ' },
    i(2, 'module: parameter'),
    t { '', '  rescue:', '    - name: ' },
    i(3, 'Rescue task'),
    t { '', '      ' },
    i(4, 'debug: msg="Something failed"'),
    i(0),
  }),
}