#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

require 'coffee-script'
express   = require 'express'
oppressor = require 'oppressor'
path      = require 'path'
filed     = require 'filed'
{ rewrites, redirects, ignore, config } = require './config'

app = express()

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
  # Leave typical file extensions allone (as to what I expect to have on my blog)
  unless /\.([a-z0-9]{1,5})$/i.test req.url
    console.error req.url
    req.url = req.url.replace(/\/$/, '') + '.html'
  do next

# Static assets
if typeof config.public is 'string'
  app.use express.static config.public
else
  for p in config.public
    app.use express.static p

# Finally, logging unmatched urls
app.use (req, res, next) ->
  console.log 'not found', req.url, req.headers['user-agent']
  do next

app.listen(process.env.PORT or 7000)
