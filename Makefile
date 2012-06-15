server:
	PORT=7000 coffee blog.coffee

compile:
	coffee -j server.js -cb blog.coffee
	coffee -c theme/*.coffee

assets:
	cp vendor/joconut/dist/joconut.min.js theme/
	cp vendor/joconut/libs/jquery/jquery.js theme/

watch:
	@echo 'building a watch...'
	coffee -cw theme/*.coffee

clean:
	rm theme/*.js
