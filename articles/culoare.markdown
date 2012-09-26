title: 'Culoare - colours for the node console'
author: 'Johann Philipp Strathausen <strathausen@gmail.com>'
date: 'December 15th, 2011'
sort: 20111215
indexed: true
tags: [ nodejs, node, console, colours, colors, culoare ]
id: '2011/12/15/culoar'


## Culoare

Just released a clone of colors.js but with less code, in Coffee and with more colours:
https://github.com/strathausen/culoare

### Example

In culoare, you could now do

```coffee
require 'culoare'
console.log 'blinking text'.blink,
  ('blue background '
    + 'light red'.lightred
    + ' blue background').blue
```

### Installation

    npm install culoare

### Outlook

Here's the original library:
https://github.com/Marak/colors.js

Interesting, by going to Coffee the code lines dropped by around 30% and the code is only half the size. However, I've dropped the 20 lines of HTML support, but in exchange, I've also added features, like blinking, light and dark colours as well as a background colour feature.

In a next version, I'd like to not monkey-patch the string class by default, but instead, provide a set of functions that colourise strings.
