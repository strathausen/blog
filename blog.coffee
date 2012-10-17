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

blog = new Mumpitz config

blog.go ->
  # Redirection of legacy wordpress visitors (links are eternal)
  english = /^\/(en|ro|de|he)(\/|$)/
  blog.blog.app.use (req, res, next) ->
    unless english.test req.url
      return do next
    res.redirect 'http://stratha.us/' + req.url.replace english, ''
  # Finally, logging unmatched urls
  blog.blog.app.use (req, res, next) ->
    console.log 'not found', req, req.headers['user-agent']
    do next
  blog.blog.app.use connect.static __dirname + '/theme'
  port = process.env.PORT or 7000
  blog.blog.app.listen port
  console.log 'started at port', port
