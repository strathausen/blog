title: 'Mumpitz'
date: 'April 4th, 2012'
tags: [ node, coffee, blog ]
description: 'Another minimal static html generator'
published: true


## Coffee powered

Here's a little blog engine I hacked together just for the fun of it. I call it _mumpitz_.

### Features

It can read markdown files annotated with yaml. I don't think anyone has ever thought of this before!

Here's how you can use it.

``` coffee
Blog = require 'mumpitz'
blog = new Blog dir: __dirname + '/articles'
```

