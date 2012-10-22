title: 'Vimify - Vim Code Highlighting for Node.js'
description: 'Would you like to have the power and quality of vim code highlighting available to your node.js project, blog or website? Read on.'
tags: [ node, vim, code, project ]
date: 'June 16th, 2012'
indexed: true


## Vim highlighting your blog

Some weeks ago, I wrote a javascript module using vim to transform source
code into highlight HTML and CSS, after having stumbled upon vim2html.
I am announcing my <a href="https://strathausen.github.com/vimify" title="Vimify on Github">latest code snippet</a> that uses vim to turn your source code into HTML and CSS, for your web project!

### The Idea

Vim has excellent highlighting support for a variety of programming languages, and probably one of the most complete in the universe. Why not use it in node? There are already <a href="" title="">tools taking advantage of this out there</a>.


### The implementation
### The pros

1. You get all kinds of languages highlighted for free - sure vim has a
higher coverage than your favourite highlighting library.
2. You get nice terminal colours and feel at home on your blog.

### The cons

### How It Works



### Usage

Convinced? 

1. Install it via npm, e.g.

    npm install vimify -S

2. Use it your code.

### Summary

Using vim as a highlighter is really awesome, and not quite without disadvantages.

- Vim generating HTML is damn slow (1-3s per code block)
- The generated HTML sucks! It's like from the nineties. And with line numbers 
- Vim's code highlighting for JavaScript sucks so much! (I never realized that)
- Why is vim so hard with stdin and stdout?

Vim is certainly a great IDE, but it's not yet ready to become a code highlighting generator engine. I'll probably switch to something else in the JS repositories. Probably. As soon as I have time for that...
