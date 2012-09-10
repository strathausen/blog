#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

async    = require 'async'
fs       = require 'fs'
Blog     = require 'mumpitz/Mumpitz'
vimifier = require './vimifier'
_        = require 'underscore'
process.title = 'strablo'

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  public   : __dirname + '/public'

blog = new Blog config
#blog.plugins.splice 1, 0, vimifier
# once finished loading
blog.go (err) ->
  console.log 'started'
