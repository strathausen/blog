#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

require 'coffee-script'
Mumpitz  = require 'mumpitz'
_        = require 'underscore'
connect  = require 'connect'

process.title = 'blog'

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  public   : __dirname + '/theme'
  author   : 'Johann Philipp Strathausen <strathausen-at-gmail-dot-com>'

# Legacy URLs
rewriteMap =
  '2011/12/15/culoar'              : 'culoare'
  '2010/03/02/dracula'             : 'dracula_0.0.2alpha'
  '2009/12/11/ein-tag-im-paradies' : 'paradies'
  '2010/04/25/raphael-svg-tooltip' : 'raphael_js_tooltip'
  '2010/08/04/sort_by_colour'      : 'sort_by_colour'

blog = new Mumpitz config

blog.go ->
  app = blog.blog.app
  blog.blog.app.use connect.static __dirname + '/theme'
  # Redirection of legacy wordpress visitors (links are eternal)
  english = /^\/(en|ro|de|he)(\/|$)/
  blog.blog.app.use (req, res, next) ->
    unless english.test req.url
      return do next
    res.redirect '/' + req.url.replace english, ''
  app.use (req, res, next) ->
    return do next unless rewriteMap[req.url]
    res.redirect '/' + rewriteMap[req.url]
  # Finally, logging unmatched urls
  blog.blog.app.use (req, res, next) ->
    console.log 'not found', req.url, req.headers['user-agent']
    do next
  port = process.env.PORT or 7000
  blog.blog.app.listen port
  console.log 'started at port', port
