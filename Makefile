test:
	./node_modules/.bin/mocha --reporter spec --compilers coffee:coffee-script --growl spec/**/*spec.coffee

watch:
	./node_modules/.bin/mocha --reporter spec --compilers coffee:coffee-script --growl spec/**/*spec.coffee --watch

.PHONY: test