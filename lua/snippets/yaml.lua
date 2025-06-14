local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Basic key-value
  s('kv', {
    i(1, 'key'),
    t ': ',
    i(2, 'value'),
    i(0),
  }),

  -- List item
  s('li', {
    t '- ',
    i(1, 'item'),
    i(0),
  }),

  -- Docker Compose service
  s('service', {
    i(1, 'service_name'),
    t { ':', '  image: ' },
    i(2, 'image:tag'),
    t { '', '  ports:', '    - "' },
    i(3, '8080'),
    t ':',
    i(4, '80'),
    t '"',
    t { '', '  environment:', '    - ' },
    i(5, 'ENV_VAR=value'),
    t { '', '  volumes:', '    - ' },
    i(6, './data:/data'),
    i(0),
  }),

  -- Kubernetes metadata
  s('meta', {
    t { 'metadata:', '  name: ' },
    i(1, 'resource-name'),
    t { '', '  namespace: ' },
    i(2, 'default'),
    t { '', '  labels:', '    app: ' },
    i(3, 'app-name'),
    i(0),
  }),

  -- Kubernetes deployment
  s('deploy', {
    t { 'apiVersion: apps/v1', 'kind: Deployment', 'metadata:', '  name: ' },
    i(1, 'app-deployment'),
    t { '', 'spec:', '  replicas: ' },
    i(2, '3'),
    t { '', '  selector:', '    matchLabels:', '      app: ' },
    i(3, 'app'),
    t { '', '  template:', '    metadata:', '      labels:', '        app: ' },
    i(4, 'app'),
    t { '', '    spec:', '      containers:', '      - name: ' },
    i(5, 'container'),
    t { '', '        image: ' },
    i(6, 'image:tag'),
    t { '', '        ports:', '        - containerPort: ' },
    i(7, '80'),
    i(0),
  }),

  -- GitHub Actions workflow trigger
  s('trigger', {
    t { 'on:', '  push:', '    branches:', '      - ' },
    i(1, 'main'),
    t { '', '  pull_request:', '    branches:', '      - ' },
    i(2, 'main'),
    i(0),
  }),

  -- GitHub Actions job
  s('job', {
    i(1, 'job_name'),
    t { ':', '  runs-on: ' },
    i(2, 'ubuntu-latest'),
    t { '', '  steps:', '    - uses: actions/checkout@v4', '    - name: ' },
    i(3, 'Step name'),
    t { '', '      run: ' },
    i(4, 'echo "Hello World"'),
    i(0),
  }),
}