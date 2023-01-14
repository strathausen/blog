---
date: 'March 30, 2013'
tags: [ 'latex', 'template', 'retro', 'texlive', 'stretch' ]
title: 'A vintage LaTeX template'
layout: "../layouts/BlogPost.astro"
published: true
---


## Beautiful vintage template for LaTeX

Some days ago I was writing an invitation for something
but didn't find any LaTeX templates that where hip enough.

Last time I actually worked with LaTeX was years ago for my diploma thesis.
Since then, I only use it to write snail mail letters.
After just about ten minutes of
googl^wlooking up related keywords on a popular search engine,
I was already able to cook something nice up!
Here is the result. (of a few minutes more fiddling...)

<img src="/images/wunderkarte.png" />

This is great for posters, invitations or even business cards.

### Usage

To stretch text to full-width of the page, use the shortcut

``` latex
\wunder{Here comes the text}
```

In order to reduce the vertical space _after_ a line, use the shortcut

``` latex
\vsp{-.2}
```

Place it _before_ the line that you want it to have reduced vertical space!

Thanks to <a href="http://www.theleagueofmoveabletype.com/">The League of Movable Type</a> for their open source font
<a href="http://www.theleagueofmoveabletype.com/chunk">Chunk</a> that's being used in this example.

### Fine tuning

Up for some colours? Latex offers nice
and <a href="http://en.wikibooks.org/wiki/LaTeX/Colors#The_68_standard_colors_known_to_dvips">catchy keywords</a> for that,
via the xcolors module.

### Installation and usage

It should be enough work to have `texlive` installed.
I use `rubber` to compile it, like that:

``` bash
rubber -d wunderkarte.latex
```
