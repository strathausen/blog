#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

async    = require 'async'
fs       = require 'fs'
Blog     = require 'colbo'
vimifier = require './vimifier'
_        = require 'underscore'

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  public   : __dirname + '/theme'

# loading static files
fs.readdir (__dirname + '/theme'), (err, files) ->
  blog = new Blog config
  blog.plugins.splice 1, 0, vimifier
  blog.on 'ready', ->
    blog.app.listen process.env.PORT or 7000
    console.log 'started'
