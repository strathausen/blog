title: 'Culoare - colours for the node console'
date: 'December 15th, 2011'
tags: [ nodejs, node, console, colours, colors, culoare ]
description: 'Culoare, npm module for colours'
published: true


## Culoare

Just released a clone of colors.js with more colours:
https://github.com/strathausen/culoare

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
