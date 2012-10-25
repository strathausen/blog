#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

require 'coffee-script'
express  = require 'express'
oppressor = require 'oppressor'
path     = require 'path'
filed = require 'filed'

{ rewrites, redirects, ignore } = require './config'
app = express.createServer()

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

# Look for html files by default
app.use (req, res, next) ->
  unless /\.(css|js|ico|json|jpg|jpeg|png|html)$/.test req.url
    req.url = req.url.replace(/\/$/, '') + '.html'
  do next

# Static assets
app.use (req, res) ->
  console.error req.url
  # Pipe chaining doesn't seem to work for some reason,
  # not even with substack's branch of filed.
  op = oppressor req
  filed(path.join __dirname, 'theme', req.url).pipe op
  op.pipe(res)

# Finally, logging unmatched urls
app.use (req, res, next) ->
  console.log 'not found', req.url, req.headers['user-agent']
  do next

app.listen(process.env.PORT or 7000)
