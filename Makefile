deploy: npm compile styles markdown

compile:
	coffee compile.coffee

markdown:
	tools/colormds

server:
	PORT=7000 coffee blog.coffee

clean:
	rm -rv public/*

npm:
	npm i

styles:
	node_modules/.bin/stylus < theme/style.styl > public/style.css

style-watch:
	node_modules/.bin/stylus -w theme/style.styl -o public/

highlight-css:
	curl https://raw.github.com/isagalaev/highlight.js/master/src/styles/tomorrow.css > theme/code.css
