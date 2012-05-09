Blog = require 'colbo'
vimifier = require './vimifier'
connect = require 'connect'

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'

blog = new Blog config
blog.plugins.splice 1, 0, vimifier
blog.app.use connect.static __dirname + '/theme/'
blog.on 'ready', ->
  blog.app.listen 3000
  console.log 'started'
