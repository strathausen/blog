title: 'Raphael.js tooltip'
author: 'Johann Philipp Strathausen <strathausen@gmail.com>'
date: 'April 25th, 2010'
sort: 20100425
indexed: true
id: '2010/04/25/raphael-svg-tooltip'
tags: [ 'javascript', 'raphael', 'svg', 'tooltip' ]


## Raphael SVG Tool Tip

This extension allows you to attach tool tips to <a href="http://raphaeljs.com">Raphael</a> SVG elements. They appear on mouse over.

```javascript
Raphael.el.tooltip = function (tp) {
  this.tp = tp;
  this.tp.ox = 0;
  this.tp.oy = 0;
  this.tp.hide();
  this.hover(
    function(event) { 
      this.mousemove(function(event) { 
        this.tp.translate(event.clientX - 
          this.tp.ox,event.clientY - this.tp.oy);
        this.tp.ox = event.clientX;
        this.tp.oy = event.clientY;
      });
      this.tp.show().toFront();
    }, 
    function(event) {
      this.tp.hide();
      this.unmousemove();
    }
  );
  return this;
};
```

Use it simply by calling:

    #!javascript
    var paper = Raphael(10, 50, 320, 200);
    paper.circle(100,100,10).tooltip(paper.rect(0,0,20,30));

Since Raphael currently does not offer a way to attach custom functions to <code>set</code>, here’s a less elegant way to get tool tips working on <code>set</code>: by accessing the child elements by its attribute <code>items</code>:

    #!javascript
    var st = paper.set();
    st.push(
      paper.circle(10, 10, 5),
      paper.circle(30, 10, 5)
    );
    st.items[0].tooltip(paper.rect(0, 0, 20, 30));

Enjoy.
