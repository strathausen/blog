Handlebars = require 'handlebars'
moment    = require 'moment'
Mumpitz  = require 'mumpitz'
Handlebars.registerHelper 'toRFC822', (rawDate) ->
  date = rawDate.replace /([0-9]+)(st|nd|rd|th|)/g, '$1'
  moment(date).format 'ddd, mm MMM YYYY HH:mm:ss'

{ config }   = require './config'
blog = new Mumpitz config

blog.go ->
  console.log 'compiling...'
process.on 'exit', ->
  console.log 'done.'
