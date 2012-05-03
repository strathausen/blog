title: Colbo - a fast blog engine for node
tags: [ node, coffee, blog, project ]
date: '2012-03-04'
author: 'Johann Philipp Strathausen <strathausen@gmail.com>'
indexed: true


## Coffee powered

Here's a little blog engine I hacked together just for the fun of it. I call it _colbo_.

### Features

It is fast, in-memory and does gzip and deflate. It can read markdown
files.

Here's how you can use it.

    #!coffee
    Blog = require 'colbo'
    blog = new Blog dir: __dirname + '/articles'
    blog.on 'ready', -> blog.listen 3000

## And now?
