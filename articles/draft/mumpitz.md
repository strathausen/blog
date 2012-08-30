title: 'Mumpitz'
tags: [ node, coffee, blog ]
date: 'April 4th, 2012'


## Coffee powered

Here's a little blog engine I hacked together just for the fun of it. I call it _mumpitz_.

### Features

It can read markdown files.

Here's how you can use it.

```coffee
Blog = require 'colbo'
blog = new Blog dir: __dirname + '/articles'
blog.on 'ready', -> blog.listen 3000
```

### And now?
