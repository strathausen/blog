###

Some generic file server boilerplate with simple routing and logging.

Because I found this easier to write than to get .htaccess do what I wanted.

Options:
  rewrites  - hash of string to string, e.g. { '/': '/index.html' }
  ignore    - regex, generic redirect, e.g. /^\/en/ will redirect
              /en/profile to /profile
  redirects - hash map with aliases of URLS; like rewrites, but redirecting;
              like ignore, but a hashmap with strings
  config    - { static, public } folders that serve static content whereas
              both are identical (static content vs. generated static content)

###
express = require 'express'
path    = require 'path'
express = require 'express'
morgan  = require 'morgan'
chalk   = require 'chalk'

module.exports = (options) ->
  { rewrites, redirects, ignore, config, app } = options
  app or= express()

  app.use (req, res, next) ->
    return do next unless ignore.test req.url
    res.redirect '/' + req.url.replace ignore, ''

  # Redirection of legacy wordpress visitors (links are eternal!)
  app.use (req, res, next) ->
    return do next unless redirects[req.url]
    res.redirect redirects[req.url]

  app.use (req, res, next) ->
    return do next unless rewrites[req.url]
    req.url = rewrites[req.url]
    do next

  app.use morgan 'combined', skip: (req) ->
    /\.(css|jpg|jpeg|pdf|png)$/.test req.url

  # Look for html files by default
  app.use (req, res, next) ->
    # Leave typical file extensions allone (as to what I expect to have on my blog)
    unless /\.([a-z0-9]{1,5})$/i.test req.url
      base = req.url.replace(/\/$/, '')
      unless /^curl/.test req.headers['user-agent']
        req.url = base + '.html'
      else
        req.url = base + '.md'
    do next

  # Static assets
  app.use express.static config.static
  app.use express.static config.public

  port = process.env.PORT or 7000
  app.listen port
  console.log "http://localhost:#{port}"
