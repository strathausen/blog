Handlebars = require 'handlebars'
moment     = require 'moment'
Mumpitz    = require 'mumpitz'

Handlebars.registerHelper 'toRFC822', (date) ->
  return moment(date, 'MMM Do, YYYY').format 'ddd, D MMM YYYY HH:mm:ss'

{ config } = require './config'

blog = new Mumpitz config

blog.go ->
  console.log 'compiling...'
process.on 'exit', ->
  console.log 'done.'
