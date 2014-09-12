title: 'Nodecopter - or how to demo untested code'
date: 'October 15th, 2012'
tags: [ nodecopter, nodejs, node, event, hacking ]
description: 'Flying robots and node.js - nodecopter 2012'
published: true


## Nodecopter - or how to demo untested code

Recently, I've had the pleasure to participate in
<a href="http://nodecopter.com">nodecopter</a>,
an event where hackers gathered in a late 19th century,
three story high abandoned public pool house
to hack flying robots with node.js all day long
while drinking beer and having a lot of fun.

Here are my impressions.

<img src="/images/nodecopter_20121005_003.resized.jpg"
 alt="The great venue of nodecopter 2012 - a former public bath" />
The amazing venue.


<img src="/images/nodecopter_20121005_011.resized.jpg"
 alt="Thinkpad + Drone = Love" />
My Thinkpad with the drone flying next to it.


<img src="/images/nodecopter_20121005_002.resized.jpg"
 alt="People hacking drones." />
People hacking drones.


So, there I met <a href="http://npmjs.org/~bkw">Bernhard</a> (whom I know from
a previous cooperation with my company, <a href="http://www.upcload.com">UPcload</a>),
even bringing a drone and some cables.
We hacked a quadrocopter that can follow people's faces.
Bernhard wrote the face recognition part
and I worked on the copter controller to react to face coordinates on the
front camera.

Once we wanted to integrate our code and test the interfaces,
the wireless was too crowded and we didn't get a connection to the drone
until the actual demo.

So it came that we demoed the robot to the crowd completely untested,
just smacking our code bases together, hoping for the best.
We didn't even write unit tests.
And yet, it just worked on the first try!

From now on, I am going to never test anything before demos, ever.

You can see me on the video here, I'm the guy with the yellow helmet.

<iframe width="560" height="315" src="http://www.youtube.com/embed/gucpgJEJ5b4" frameborder="0" allowfullscreen></iframe>

By the way, my favourite team was the
<a href="https://github.com/substack/matador-copter">bullfighting drone</a>.

Our <a href="http://github.com/strathausen/nodecopter-hacks">code's on github</a>.
The code quality has been heavily influenced by beer.
We take no responsibility.
