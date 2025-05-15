local language_id_mapping = {
  bib = 'bibtex',
  pandoc = 'markdown',
  plaintex = 'tex',
  rnoweb = 'rsweave',
  rst = 'restructuredtext',
  tex = 'latex',
  text = 'plaintext',
}

local function get_language_id(_, filetype)
  return language_id_mapping[filetype] or filetype
end

return {
  cmd = { 'ltex-ls-plus' },
  filetypes = {
    'markdown',
    'pandoc',
    'latex',
    'text',
    'norg',
    'gitcommit',
    'jj',
    'rst',
    'typst',
  },
  get_language_id = get_language_id,
  single_file_support = true,
  settings = {
    ltex = {
      language = 'en_US',
      checkFrequency = 'save',
      sentenceCacheSize = 2000,
      additionalRules = {
        enablePickyRules = true,
        motherTongue = 'de_DE',
      },
      enabledRules = {
        en = { 'EN_CONSISTENT_APOS' },
      },
      disabledRules = {
        en = { 'WHITESPACE_RULE', 'DASH_RULE', 'TWO_HYPHENS', 'CHANGE', 'ISSUE', 'CHECK', 'ACTUALLY', 'CONSISTENT' },
      },
      dictionary = {
        de = {
          'CryptPad',
          'Chouhartem',
          -- field names
          'authors',
          'categories',
          'created',
          'updated',
          'title',
          'meta',
          'CryptPad',
          'Stoettner',
          'OpenSearch',
          'Vegard',
        },
        en = {
          'CryptPad',
          'Stoettner',
          'OpenSearch',
          'Vegard',
        },
      },
    },
  },
}
