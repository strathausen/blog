blog
====

my blog content and style - using npm mumpitz as the compiler


## files

the files `compile.coffee` and `config.coffee` are mostly compiling
articles to html.

`blog.coffee` is a simple `express` server with url
rewrites and static file serving.  was easier to write my own server
than to get the damn `.htaccess` to rewrite urls the way i wanted...

## commands

`make` generates articles and assembles static files.

`make server` runs the blog as a server so you can look at it
with your web browser.
