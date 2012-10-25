#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

require 'coffee-script'
Mumpitz  = require 'mumpitz'
_        = require 'underscore'
express  = require 'express'
#connect  = require 'connect'
oppressor = require 'oppressor'
path     = require 'path'
filed = require 'filed'

configuration   = require './config'

{ config, rewrites, redirects, ignore: language } = configuration
process.title = 'stratha.us'

module.exports = app = express.createServer()


app.use (req, res, next) ->
  return do next unless language.test req.url
  res.redirect '/' + req.url.replace language, ''

# Redirection of legacy wordpress visitors (links are eternal!)
app.use (req, res, next) ->
  return do next unless redirects[req.url]
  res.redirect redirects[req.url]
  
app.use (req, res, next) ->
  return do next unless rewrites[req.url]
  req.url = rewrites[req.url]
  do next

# Look for html files by default
app.use (req, res, next) ->
  unless /\.(css|js|ico|json|jpg|jpeg|png|html)$/.test req.url
    req.url += '.html'
  do next

# Static assets
app.use (req, res) ->
  # Pipe chaining doesn't seem to work for some reason,
  # not even with substack's branch of filed.
  op = oppressor req
  filed(path.join __dirname, 'theme', req.url).pipe op
  op.pipe(res)

# Finally, logging unmatched urls
app.use (req, res, next) ->
  console.log 'not found', req.url, req.headers['user-agent']
  do next

blog = new Mumpitz config

blog.go ->

  console.log 'started at port', port
port = process.env.PORT or 7000
app.listen port
