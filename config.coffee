config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  public   : __dirname + '/theme'
  author   : 'Johann Philipp Strathausen <strathausen-at-gmail-dot-com>'

# Redirect legacy URLs (from my previous wordpress blog)
redirects =
  '/2011/12/15/culoar'              : '/culoare'
  '/2010/03/02/dracula'             : '/dracula_0.0.2alpha'
  '/2009/12/11/ein-tag-im-paradies' : '/paradies'
  '/2010/04/25/raphael-svg-tooltip' : '/raphael_js_tooltip'
  '/2010/08/04/sort_by_colour'      : '/sort_by_colour'

# Ignore language prefix
ignore = /^\/(en|ro|de|he)(\/|$)/

rewrites =
  '/' : '/index'

module.exports = { config, redirects, rewrites, ignore }
