// Redirect legacy URLs (from my previous wordpress blog)
const redirects = {
  '/2011/12/15/culoar'              : '/culoare',
  '/2010/03/02/dracula'             : '/dracula_0-0-2alpha',
  '/2010/03/02/dracula.html'        : '/dracula_0-0-2alpha',
  '/2009/12/11/ein-tag-im-paradies' : '/paradies',
  '/2010/04/25/raphael-svg-tooltip' : '/raphael_js_tooltip',
  '/2010/04/25/raphael-svg-tooltip.html' : '/raphael_js_tooltip',
  '/2010/08/04/sort_by_colour'      : '/sort_by_colour',
  '/2010/08/17/drei'                : '/threetomic',
}

// Ignore language prefix
const ignore = /^\/(en|ro|de|he)(\/|$)/

const rewrites = {
  '/'            : '/index',
  '/feed'        : '/feed.xml',
  '/feed.rss'    : '/feed.xml',
  '/feed.html'   : '/feed.xml',
}

export default { redirects, rewrites, ignore }
