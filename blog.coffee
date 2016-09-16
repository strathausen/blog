#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

require 'coffee-script'
require 'coffee-script/register'
require 'culoare'
express   = require 'express'
path      = require 'path'
moment    = require 'moment'
{ rewrites, redirects, ignore, config } = require './config'

app = express()

app.post '/canvas.md', (req, res) ->
  res.send 'I got this: ' + JSON.stringify(req.query)

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
    console.error req.url.green, moment().format().lightblue
    base = req.url.replace(/\/$/, '')
    unless /^curl/.test req.headers['user-agent']
      req.url = base + '.html'
    else
      req.url = base + '.md'
  do next

# Static assets
app.use express.static config.public
app.use express.static config.static

# Finally, logging unmatched urls
app.use (req, res, next) ->
  console.log 'not found', req.url, req.headers['user-agent']
  do next

port = process.env.PORT or 7000
app.listen port
console.log 'listening at port', port
