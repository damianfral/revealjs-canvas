all: DrawableElement.js test.html

DrawableElement.js: DrawableElement.coffee
	coffee -c DrawableElement.coffee

test.html: test.jade
	jade -P test.jade