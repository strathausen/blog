# parses some text for <pre><code> tags and hands it over to vim
# for nice syntax highlighting

vimify     = require 'vimify'
async      = require 'async'
_          = require 'underscore'
{ decode } = require 'entities'

# used to find code snippets
regex = /(<pre><code>|<\/code><\/pre>)/

# most beautiful parser in the world!
vimifier = (article, next) ->
  parts = article.content.split regex
  i = 0
  jobs = []
  allCss = []
  while i < parts.length
    if parts[i] is '<pre><code>'
      i++
      jobs.push i
    i++
  async.forEach jobs, ((job, next) ->
    source = decode parts[job]
    [ type, code... ] = source.split '\n'
    type = type.replace '#!', ''
    vimify (code.join '\n'), type, (err, css, html) ->
      return next err if err
      parts[job] = html
      css = css.split '\n'
      allCss.push css...
      do next
  ), (err) ->
    article.content = parts.join ''
    article.css = (_.unique allCss).join '\n'
    do next

module.exports = ({ articles }, cb) ->
  async.forEach articles, vimifier, cb

unless module.parent
  console.log 'doing the test'
  text = content: '''
    <p>Here comes the code</p>
    <pre><code>#!coffee
    x = (y) -> y
    </code></pre>
  '''
  vimifier text, -># [ 'set nonumber' ], ->
    console.log 'done', text
