title: 'Culoare - colours for the node console'
date: 'December 15th, 2011'
tags: [ nodejs, node, console, colours, colors, culoare ]
description: 'Culoare, npm module for colours'
archived: true


## Culoare

Just released a fancy clone of
<a href="https://npmjs.org/package/colors">colors.js</a>
but with more awesome:
<a href="https://github.com/strathausen/culoare">github.com/strathausen/culoare</a>

<img src="/images/culoare.gif" />

It features background colours, light and dark modes and fancy blinking.
I wrote it in order to get more fluent with CoffeeScript.

### Example

In culoare, you could now do

``` js
require('culoare');
console.log(
  'blinking text'.blink,
  ('blue background '
    + 'light red'.lightred
    + ' blue background'
  ).blue
);
```

### Installation

``` bash
npm install culoare
```

### Outlook

Here's the original library:
https://github.com/Marak/colors.js

In a next version,
I'd like to not monkey-patch the string class by default,
but instead, provide a set of functions that colourise strings.
