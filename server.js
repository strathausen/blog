// Generated by CoffeeScript 1.3.3
var Blog, async, blog, config, express, fs, vimifier, _;

async = require('async');

fs = require('fs');

Blog = require('colbo');

vimifier = require('./vimifier');

_ = require('underscore');

express = require('express');

process.title = 'strablo';

config = {
  dir: __dirname + '/articles',
  layout: __dirname + '/theme/layout.mustache',
  template: __dirname + '/theme/article.mustache',
  "public": __dirname + '/theme',
  app: express.createServer()
};

blog = new Blog(config);

blog.plugins.splice(1, 0, vimifier);

blog.on('ready', function() {
  var english, port;
  english = /^\/en[\/$]/;
  blog.app.use(function(req, res, next) {
    if (!english.test(req.url)) {
      return next();
    }
    return res.redirect('http://strathausen.eu/' + req.url.replace(english, ''));
  });
  blog.app.use(function(req, res, next) {
    console.log('not found', req.url);
    return next();
  });
  port = process.env.PORT || 7000;
  blog.app.listen(port);
  return console.log('started at port', port);
});
