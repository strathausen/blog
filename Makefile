deploy: npm clean compile

compile:
	cp -rv static/* public/
	coffee compile.coffee

server:
	PORT=7000 coffee blog.coffee

clean:
	rm -rv public/*

npm:
	npm i
