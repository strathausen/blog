server:
	coffee blog.coffee

compile:
	coffee -j server.js -cb blog.coffee
