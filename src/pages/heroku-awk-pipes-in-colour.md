---
title: 'Pipe heroku logs in colour'
tags: [ 'heroku', 'logs', 'pipe', 'colour', 'awk', 'grep' ]
date: 'May 30, 2013'
layout: "../layouts/BlogPost.astro"
published: true
---

## Preserve colours in heroku logs when piping

Just a little trick of the day to leverage your fancy colour monitor
when piping heroku logs around.

Fire your editor at file
`/usr/local/heroku/lib/heroku/helpers/log_displayer.rb`
and somewhere at line 20, remove the condition that says

``` ruby
if STDOUT.isatty && ENV.has_key?("TERM")
  display(colorize(chunk))
else
  display(chunk)
end
```

and change it to something like this

``` ruby
display(colorize(chunk))
```

Make sure you don't use the heroku logs anywhere else,
as this modification will break stuff.

You may also want to modify the other occurence of the same
condition a few lines further down to 

``` bash
heroku logs --app nodecload -t|sed 's/2[^ ]* //'
```

Enjoy a happier life.
