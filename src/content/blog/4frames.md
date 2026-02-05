---
title: "turning lomo photos into animated gifs"
description: "a web tool that transforms action sampler photos into smooth animations"
pubDate: "Feb 05 2026"
---

i got a [lomo action sampler](https://shop.lomography.com/de/actionsampler-clear) camera for 5 euros on a flea market a few years back.
it's a plastic toy camera with 4 lenses that fire in sequence, capturing a burst of motion on a single frame of film.
the results look like this:

<img src="/images/projects/4frames-input.jpg" alt="lomo action sampler photo showing 4 sequential frames in a 2x2 grid" style="max-width: 500px; margin: 2em auto; display: block;" />

i always wanted to turn these into little animations, but i didn't find an easy way to do it. but i didn't find an easy way to do it you just stitch the frames together, you get a jittery, wobbly mess.

## what i built

[4fram.es](https://4fram.es) - upload a lomo action sampler photo, get a smooth animated gif.

the tool does three things:

1. **splits the grid** — extracts the 4 quadrants into separate frames
2. **aligns the frames** — compares those 4 images and shifts each one to minimize wobble
3. **creates the gif** — assembles the stabilized frames into a looping animation

the alignment is the tricky part. it searches through possible offsets, comparing each frame to find the best match, then applies corrections. the result is quite nice most of the time.

here's what the output looks like:

<img src="/images/projects/4frames-output.gif" alt="stabilized animated gif from lomo action sampler" style="max-width: 500px; margin: 2em auto; display: block;" />

## the tech

it's a node.js app using imagemagick for all the image related work. the alignment algorithm downsamples the images for speed, finds the optimal offset using RMSE comparison, then applies the correction at full resolution.

try it at **[4fram.es](https://4fram.es)**.

---

*this is one of my [side projects](/projects). see what else i'm building.*
