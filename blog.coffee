#!/usr/bin/env coffee
# My personal blog
# Johann Philipp Strathausen

async    = require 'async'
fs       = require 'fs'
Blog     = require 'colbo'
vimifier = require './vimifier'
_        = require 'underscore'
express  = require 'express'

config =
  dir      : __dirname + '/articles'
  layout   : __dirname + '/theme/layout.mustache'
  template : __dirname + '/theme/article.mustache'
  public   : __dirname + '/theme'
  app      : express.createServer()

blog = new Blog config
blog.plugins.splice 1, 0, vimifier
# once finished loading
blog.on 'ready', ->
  # redirection of legacy wordpress visitors
  english = /^\/en[\/$]/
  blog.app.use (req, res, next) ->
    unless english.test req.url
      return do next
    res.redirect 'http://strathausen.eu/' + req.url.replace english, ''
  # finally, logging unmatched urls
  blog.app.use (req, res, next) ->
    console.log 'not found', req.url
    do next
  port = process.env.PORT or 7000
  blog.app.listen port
  console.log 'started at port', port
