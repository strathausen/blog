# My personal blog
# Johann Philipp Strathausen

async    = require 'async'
fs       = require 'fs'
Blog     = require 'colbo'
vimifier = require './vimifier'
_        = require 'underscore'

staticFiles = []

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  articles : staticFiles
  public   : __dirname + '/theme'

# loading static files
fs.readdir (__dirname + '/theme'), (err, files) ->
  blog = new Blog config
  blog.plugins.splice 1, 0, vimifier
  blog.on 'ready', ->
    #console.log _.pluck blog.articles, 'id'
    blog.app.listen 3000
    console.log 'started'
