test:
	./node_modules/.bin/mocha --reporter spec --compilers coffee:coffee-script --growl spec/**/*spec.coffee

.PHONY: test