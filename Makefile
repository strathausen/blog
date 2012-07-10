server:
	PORT=8000 ./node_modules/.bin/coffee blog.coffee

compile:
	./node_modules/.bin/coffee -j server.js -cb blog.coffee
	./node_modules/.bin/coffee -c theme/*.coffee

assets:
	cp vendor/joconut/dist/joconut.min.js theme/
	cp vendor/joconut/libs/jquery/jquery.js theme/

watch:
	@echo 'building a watch...'
	./node_modules/.bin/coffee -cw theme/*.coffee

clean:
	rm theme/*.js
