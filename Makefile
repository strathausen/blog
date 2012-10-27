compile: clean
	coffee compile.coffee

server:
	PORT=7000 coffee blog.coffee

clean:
	rm -f theme/*.html
	#rm -rv public/*
