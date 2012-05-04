# parses some text for <pre><code> tags and hands it over to vim
# for nice syntax highlighting

vimify = require 'vimify'
async  = require 'async'
_      = require 'underscore'

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
      console.log 'adding', parts[i]
      jobs.push i
    i++
  async.forEach jobs, ((job, next) ->
    source = parts[job]
    [ type, code ] = source.split '\n'
    type = type.replace '#!', ''
    vimify code, type, (err, css, html) ->
      parts[job] = html
      css = css.split '\n'
      allCss.push css...
      next err
  ), (err) ->
    article.content = parts.join ''
    article.css = (_.unique allCss).join '\n'
    do next

module.exports = ({ articles }, cb) ->
  async.forEach articles, vimifier
unless module.parent
  console.log 'doing the test'
  text = content: '''
    <p>Here comes the code</p>
    <pre><code>#!coffee
    x = (y) -> y
    </code></pre>
  '''
  vimifier text, ->
    console.log 'done', text
