title: 'Pipe heroku logs in colour'
tags: [ 'heroku', 'logs', 'pipe', 'colour', 'awk', 'grep' ]
date: 'May 30th, 2013'

## Preserve colours in heroku logs when piping

```/usr/local/heroku/lib/heroku/helpers/log_displayer.rb```
around line 20, remove the condition that says 

``` ruby
if STDOUT.isatty && ENV.has_key?("TERM")
  display(colorize(chunk))
else
  display(chunk)
end
```

to something like this

``` ruby
display(colorize(chunk))
```

Make sure you don't use the heroku logs anywhere else,
where this modification may break anything.

You may also want to modify the other occurence of the same
condition a few lines further down to 

``` bash
heroku logs --app nodecload -t|sed 's/2[^ ]* //'
```
