title: 'Nodecopter 2012'
date: 'October 15th, 2012'
tags: [ nodecopter, nodejs, node, event, hacking ]
description: 'Flying robots and node.js - nodecopter 2012'
published: true


## Nodecopter 2012

Recently, I've had the pleasure to participate in
<a href="http://nodecopter.com">nodecopter</a>,
where hackers gathered in a late 19th century,
three story high abandoned bath house
to hack flying robots with node.js all day long
while drinking beer and having a lot of fun.

<img src="/images/nodecopter-venue.jpeg"
 alt="The great venue of nodecopter 2012 - a former public bath" />

The amazing venue

There I met <a href="http://npmjs.org/~bkw">Bernhard</a> whom I know from
my companies cooperation with youtailor
and we hacked a quadrocopter that was following people's faces.
Bernhard wrote the face recognition part
and I worked on the copter controller to react to face coordinates on the
front camera.

Due to just finishing seconds before the final demo and some wireless problems,
we demoed the robot to the crowd completely untested,
just smacking our code bases together, hoping for the best.
We didn't even write unit tests.
And yet, it just worked on the first try!

From now on, I am going to never test anything before demos ever.

The <a href="http://github.com/strathausen">code's on github</a>.
The code quality has been heavily influenced by beer.
