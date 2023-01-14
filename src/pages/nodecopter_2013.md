---
title: 'Nodecopter Matrix Church'
date: 'September 20, 2013'
tags: [ nodecopter, nodejs, node, event, hacking, church, robots ]
description: 'Flying robots and node.js - nodecopter 2013'
layout: "../layouts/BlogPost.astro"
published: true
---


--## Nodecopter Birthday Bash

I've had a lot of fun at my second 
<a href="http://www.nodecopter.com/2013/berlin/sept-13">nodecopter</a> event with my friend
<a href="https://njh.eu">vog</a>.

The venue was an old church boasting huge windows,
providing us with lots of light and space for the day.

Our idea was to control a <a href="http://ardrone2.parrot.com">Parrot AR.Drone</a>
solely via the command line, including a live ASCII video streaming!

In one afternoon, we wrote the
<a href="https://github.com/vog/drone-asciiview">ascii drone</a>!

### Challenges

As usual, the WiFi was too jammed the closer the demo came.
Thanks to a bug in my code,
our drone was clearing the Club Mate bottles of our neighbours
more than once, quite successfully!

One issue Volker had was setting up the image stream to properly
pipe through the ASCII converter - he ended up using temporary files instead,
for each frame!  Interestingly, that was still sufficiently fast.

In the end we had something pretty much demoable,
a Matrix style drone interface.


### The Code

The code is on GitHub:
<a href="http://github.com/strathausen/drone-commander">command line control for the copter</a>
and
<a href="http://github.com/strathausen/drone-asciiview">streaming the video as text</a>.
<a href="https://github.com/vog/drone-asciiview"> </a>

Disclaimer: The code quality has been heavily influenced by beer and is of limited elegance.
