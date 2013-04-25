title: 'Unix-Style Blogging'
date: 'April 13th, 2013'
tags: [ unix, blog, generator, static, html ]
published: true


## Unix-Style Blogging

Whenever releasing a library or a module,
I try shipping it with a command line tool that does the same thing!

You'll be amazed by the possibilities that open up.
Suddenly, one can combine that library with many other tools
implemented in different languages or runtimes. Instead of just another
library for tome platform, it's a univeral tool.

Let me illustrate this development directive with a small
 <a href="/mumpitz">static site generator that I wrote</a> some time ago.


### Meet the two tools

So I wanted something that reads some files in a format
I could edit with my
editor of choice into HTML. Big deal. Many static site generators
do that.

While refactoring re-usable chunks of my code
into modules, I figured that the minimum toolset to power a basic blog
generator where only two:

- One tool for converting a source data format into an intermediate format,
 i.E. Yaml annotated markdown files into JSON,
 let's call it `yamlmd2json`.
 Any other tool that understands JSON can hook in here.

- Another one to render JSON with
<a href="handlebarsjs.com">Handlebars templates</a> (like 
<a href="http://mustache.github.io/">Mustache</a>)
 to HTML files, lets call it `json2html`.

The modules that expose these tools are available via
 <a href="http://npmjs.org">npm</a> and I called them
`yamlmd` and `schnauzer` (horrible name, I know).

### Setup

You can install these awesome programs globally on your system:

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

So now you can use my node.js-lib even wihout caring about node.js or
JavaScript.

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

It took me, the author, almost no effort to turn the modules into 

### Go nuts!

You can use any other text processing tools to work,
like the ones listed on that
<a href="http://http://stackoverflow.com/questions/3858671/unix-command-line-json-parser">Stackoverflow-question</a>
or that <a href="http://http://trentm.com/json/">awesome json query
and manipulation tool</a>
(which, by coincidence, happens to be implemented in node.js too).

Have bash glue them together.

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

I didn't actually test this code, but it should just work™.


