---
title: 'Mumpitz - Stream Punk Blog Engine'
date: 'Mar 12, 2013'
tags: [ node, coffee, blog ]
description: 'Another minimalistic static html generator'
published: true
archived: true
layout: "../layouts/BlogPost.astro"
---

## Mumpitz, a Stream Punk Blog Engine

Here's a little static site generator I hacked together just for the fun of it.
I call it _mumpitz_.

### Features

As most static site generators,
Mumpitz can read markdown files annotated with yaml
and render them with associated template files (currently, mustache).

I don't like that many blog generators in nodejs make you
install the npm module globally or even clone their git repository
and start from there.

`mumpitz` can be installed via npm locally and reside in your `package.json`.

``` bash
npm i mumpitz
```

Here's how you would use it.

``` js
var Blog = require('mumpitz');
var blog = new Blog({
  dir: __dirname + '/articles'
});
blog.go(function(err) {
  if(err) {
    return console.log('Oh, there was an error:', err);
  }
  console.log('Done.');
});
```

Internally, it uses node's stream api
to set up an asynchroneous plugin pipe processing the content,
through the
<a href="https://npmjs.org/package/event-stream">awesome event stream module</a>,
which makes it really easy.
