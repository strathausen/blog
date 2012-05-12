server:
	PORT=7000 coffee blog.coffee

compile:
	coffee -j server.js -cb blog.coffee
	coffee -c theme/*.coffee

watch:
	coffee -cw theme/*.coffee
