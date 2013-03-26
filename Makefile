deploy: npm clean compile styles

compile:
	coffee compile.coffee

server:
	PORT=7000 coffee blog.coffee

clean:
	rm -rv public/*

npm:
	npm i

styles:
	cp theme/style.css public/
	curl https://raw.github.com/isagalaev/highlight.js/master/src/styles/tomorrow.css >> public/style.css
