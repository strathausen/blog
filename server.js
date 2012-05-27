var Blog, async, config, fs, vimifier, _;

async = require('async');

fs = require('fs');

Blog = require('colbo');

vimifier = require('./vimifier');

_ = require('underscore');

config = {
  dir: __dirname + '/articles',
  layout: __dirname + '/theme/layout.mustache',
  template: __dirname + '/theme/article.mustache',
  public: __dirname + '/theme'
};

fs.readdir(__dirname + '/theme', function(err, files) {
  var blog;
  blog = new Blog(config);
  blog.plugins.splice(1, 0, vimifier);
  return blog.on('ready', function() {
    blog.app.listen(process.env.PORT || 7000);
    return console.log('started');
  });
});
