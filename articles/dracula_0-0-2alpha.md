title: 'Dracula - Graph layouts for the browser'
date: 'March 2nd, 2010'
tags: [ 'browser', 'graph', 'javascript', 'layout', 'math', 'raphael', 'raphaeljs' ]
published: true


## Dracula Graph Library

I was searching for an easy way to display graphs in the browser without having
to rely on plug-ins like Flash or Java and I found <a
href="http://snipplr.com/view/1950/graph-javascript-framework-version-001/">a
piece of code</a> named <a
href="http://ajaxian.com/archives/new-javascriptcanvas-graph-library">"Graph
JavaScript framework, version 0.0.1"</a>. You could simply add some nodes to a
graph model, and then layout and having it displayed.

Unfortunately, it was soo three years ago and had a PrototypeJS dependency that
I didn't really need. Besides that, nothing happened to the code since then. So
I took the <a href="http://raphaeljs.com/graffle.html">RaphaelJS example to
connect some shapes</a> and plugged it together with that code I found. The
algorithm used by the Graph Frameork 0.0.1 is quite solid and mostly produces
pleasant results. You can now even have fun dragging around the nodes.

### Example

Here's an example on how easy it is to use (it doesn't differ much from the
original code, but includes some customizations):

``` js
var redraw;
var height = 300;
var width = 400;

var g = new Graph();

/* add simple nodes */
g.addNode("strawberry");
g.addNode("cherry");

/* add a node with a customized label */
g.addNode("id34", { label : "Tomato" });

/* add a node with a customized shape
   (the Raphael graph drawing implementation can draw
   this shape, please consult the RaphaelJS reference
   for details raphaeljs.com) */
g.addNode("id35", {
  label : "Meat" ,
  /* filling the shape with a color
     makes it easier to be dragged */
  getShape : function(r,x,y) {
    return r.rect(x-30, y-13, 62, 33)
      .attr({"fill": "#f00", "stroke-width": 2});
  }
});

/* connect nodes with edges */
g.addEdge("strawberry", "cherry");
g.addEdge("cherry", "apple");
g.addEdge("id34", "cherry");

/* customize the colors of that edge */
g.addEdge("id35", "apple",
  { color : "#38a" , colorbg : "#bdf" });

/* add an unknown node implicitly by adding an edge */
g.addEdge("strawberry", "apple");

/* layout the graph using the Spring layout implementation */
var layouter = new Graph.Layout.Spring(g);
layouter.layout();

/* draw the graph using the RaphaelJS draw implementation */
var renderer =
  new Graph.Renderer.Raphael('canvas', g, width, height);
renderer.draw();

redraw = function() {
  layouter.layout();
  renderer.draw();
};
```

The result will look like this:

<iframe src="http://dracula.ameisenbar.de/index.html" width="100%" height="360"
style="border:1px solid #888; background-color:white;"></iframe>

You can try it at dracula.ameisenbar.de, get the code <strike>via
launchpad</strike> at GitHub or get the zip archive. There are still some
optimizations necessary for the layout algorithm as well as the code structure.
I already commented most of the code and there's also an example HTML page
demonstrating all possible options. Enjoy!

<strike>Thanks for any comments!</strike> (Comment section will be back at some
point)

<b>Update: <a href="http://www.graphdracula.net">There's a new version to try!</a></b>
