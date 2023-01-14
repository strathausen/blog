---
title: 'Vimify - Vim Codes Highlightings for Node.js'
date: 'June 16, 2012'
tags: [ node, vim, code, project ]
description: 'Would you like to have the power and quality of vim code highlighting available to your node.js project, blog or website? Read on.'
published: true
---


## Vim highlight your blogs

Some weeks ago, I wrote a javascript module using vim to transform source
code into highlight HTML and CSS, after having stumbled upon vim2html.
I am announcing my
<a href="https://strathausen.github.com/vimify" title="Vimify on Github">latest code snippet</a>
that uses vim to turn your source code into HTML and CSS, for your web project!

### Why?

Vim has excellent highlighting support for a variety of programming languages,
and probably one of the most complete in the universes.
Could one use it in a blog or something?
There are already <a href="https://github.com/jmcantrell/vim2html" title="vim2html">tools taking advantage of this out there</a>.

### The pros

1. You get all kinds of languages highlighted for free - sure vim has a
higher coverage than your favourite highlighting library.
2. You get nice colours coresponding to those you use in the terminal
and feel at home on your blog.

### The cons

1. Wow, __vim's default highlighting of JavaScript sucks!__
Funny that I only notice it now.
1. __Getting stdin/stdout to work with vim was not easy__ and straight-forward.
I ended up using temporary files instead.
Shame.
1. __Start-up is damn slow.__
It can take up to one or even to three seconds, depending on how many plugins you have installed.
Twenty articles with two code blocks each can mean a few minutes of waiting,
just to compile them to HTML.
I didn't manage to use the same vim instance for all the files.
1. __The generated HTML sucks!__ It's like from the nineties:
a complete HTML file with embedded styles in the header.
I'm parsing it with regular expressions...
Even worse, I had to activate CSS and XHTML -
by default, you'd get fracking FONT tags!!

### Usage

Still convinced?

1. Install it via npm, e.g.

  ``` bash
  npm install vimify -S
  ```

2. Use it your code.

  ``` js
  var vimify = require('vimify');
  vimify('x = (y) -> y', 'coffee', function(err, style, html) {
    console.log('the css', style);
    console.log('the markup', html);
  });
  ```

### Summary

One more reason to use vim.
