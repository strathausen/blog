
Mumpitz  = require 'mumpitz'
{ config }   = require './config'
blog = new Mumpitz config

blog.go ->
  console.log 'compiling...'
process.on 'exit', ->
  console.log 'done.'
