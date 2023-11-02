---
title: 'Unix-Style Blogging'
pubDate: 'Apr 13 2013'
tags: [ unix, blog, generator, static, html ]
---


## Unix-Style Blogging

Whenever releasing a library or a module,
I try to ship it with a command line tool
that does the same thing.

I noticed that many people in the node.js community already do that,
but I wish more people would do so too.

Instead of writing just another library for some platform,
you create a univeral tool
that can be combined with
many other tools implemented in different languages or runtimes.

That's what I did while writing
 <a href="/mumpitz">static site generator</a> some time ago.
By now, it's just another site generator
(<a href="http://www.metalsmith.io/">metalsmith</a> is much better),
but its parts are still useful.


### Turning the libs into tools

So I wanted something that

- reads some files in a format I could edit with my editor of choice
- converts it into into HTML.

Big deal. Many static site generators do that.

I figured that the minimum toolset to power a basic blog
generator were only two:

- One tool for converting a source data format into an intermediate format,
 i.E. Yaml annotated markdown files into JSON.
 Any other tool that understands JSON can hook in here.

- Another one to render JSON with
<a href="http://handlebarsjs.com">Handlebars templates</a> (like
<a href="http://mustache.github.io/">Mustache</a>)
 to HTML files.

The modules that expose these tools are available via
 <a href="http://npmjs.org">npm</a> and I called them
`yamlmd` and `jsonrender`.

### Setup

You can install these awesome computer programs on your system:

``` bash
sudo npm i yamlmd -g
sudo npm i schnauzer -g
```

Or install them locally via ```npm i -S```
and include ```./node_modules/.bin/``` in your `PATH`.

You will have two executables at your disposal.

``` bash
# convert yaml-markdown to json
yamlmd2json < article.md > article.json
# render json with handlebars / mustache
json2html --body template.hbs \
  < article.json > article.html
```

### Workflow

You can use my nodejs-lib even wihout caring about JavaScript.

``` bash
# create the template
echo '<h1>{{title}}</h1>
<p>{{{html}}}</p>' > template.hbs

# render the template with content
echo 'title: "The Title"

And here is the content...
' | yamlmd2json | json2html --body template.hbs

# This is what you will get:
#   <h1>The Title</h1>
#   <p>And here is the content...</p>
```

It took me, the author, almost no effort to turn the modules into unix tools.

### Go nuts!

You can use any other text processing tools to work,
like the ones listed on that
<a href="http://http://stackoverflow.com/questions/3858671/unix-command-line-json-parser">Stackoverflow-question</a>
or that <a href="http://http://trentm.com/json/">awesome json query
and manipulation tool</a>
(which, by coincidence, happens to be implemented in node.js too),
 also pandoc and asciidoc.

Just have bash glue them together.

``` bash
# some sane default values for your blog
defaults='{ "author": "Me <supertrooper2013@aol.com>" }'

# render all the articles to html
for article in articles/*.md
do
  # convert article file into json data
  data=`yamlmd2json $article`

  # merge defaults with article data
  props=`$defaults$data | json --merge`;

  # extract properties from original article
  title=`echo $props | json title`
  template=`echo $props | json template`

  # save the article with the title as file name
  echo $props | json2html --body $template > public/${title}.html
done
```

I didn't actually test this code, but it should just work™ because
it looks really good.

### How to do it in node.js

Turning npm modules into command line tools is easy.
Say, you've got that awesome tool that converts json to msword documents.

1. add this to your `package.json`

``` js
{ "bin": { "json2msword": "./bin/json2msword.js" } },
```

2. create the actual command line tool using your lib

``` js
/* ./bin/js2msword.js */
var json2msword = require('../')
  , mapStream = require('map-stream');
process.stdin.pipe(mapStream(
  function(text, cb) {
    var result = json2msword(JSON.parse(text.toString()));
    cb(null, result);
  }
));
```

Done. You've just made the world a better place.
