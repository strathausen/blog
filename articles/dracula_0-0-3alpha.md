title: 'Dracula Graph Library v0.0.3alpha'
date: 'June 1st, 2010'
tags: [ bellman-ford, binary heap, browser, dijkstra, dracula, edge, floyd-warshall, graph, javascript, layout, node, raphael, raphaeljs, svg, tooltip ]
published: true


## Dracula Graph Library v0.0.3alpha

**Edit: This library moved to it's own a web site: <a href='http://graphdracula.net'>graphdracula.net</a>**

I have updated the code of the dracula graph library! There are some changes, like now you have a simple option to add labels to connections by passing a label property when creating an edge and a simple overlay option for nodes. Note that the file names have also changed, but this shouldn’t be too hard to adopt to. Some source code refractoring has been done too and the getShape is now called render.

The biggest changes however are some search algorithms I implemented to work with the framework, Dijkstra, Bellman-Ford and Floyd-Warshall along with a priority queue based on a binary heap. I’m just doing this because I have to learn it, but my plans are to break these algorithms down into steps and have them explained visually to the user.

### Roadmap

Here are the issues I’m working on until removing the alpha badge, some already pointed out by some of you:

Have a render function for every node, no matter how it was created.

- Provide a convenient way to define the custom render function via json code.
- Enhance the overlay property to make it easier to use.
- Enhance the label property for better readability and automatic text aligning.
- Attach a click handler to the nodes to distinguish between drag and click events.
- An option to set a random seed for deterministic layouts.
- Enhancing the layout algorithm to also work with mostly linear graphs.
- Address the bug with numeric IDs.
- Better re-using existing connections.

### Outlook

Some of the issues I will address in the future:

- Hide/show nodes
- Set fixed positions for some nodes
- Different layout options
- An algorithm showroom, e.g. for search algorithms, binary trees, minimal spanning trees, maximum flows, etc. (working on it), like all those educational Java applets from the 90′s out there...
- Animations (maybe)
- A web site (working on it)
- Data adaptors
- Different connection modes
- As this library is growing, and not everyone might need everything, some kind of a really basic dependency list would be nice..
- Some measurement method to calculate the quality of some randomly created layouts and then picking the best one
- Use currying wherever it makes sense and results in cleaner code. I love currying!

### Examples

Here’s what it looks like in action currently (the tool-tip is just a dummy rounded square):

<iframe src="http://dracula.ameisenbar.de/0.0.3alpha/index.html" style="border: 1px solid rgb(136, 136, 136); background-color: white;" height="360" width="100%"></iframe>

And the Dijkstra algorithm to search the shortest paths from Berlin to any city in the world:

<iframe src="http://dracula.ameisenbar.de/0.0.3alpha/dracula_algorithms.html" style="border: 1px solid rgb(136, 136, 136); background-color: white;" height="360" width="100%"></iframe>

### Code

See it on <a href='http://github.com/strathausen/dracula'>GitHub</a> or download the latest version directly!
