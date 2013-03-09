test:
	./node_modules/.bin/mocha --reporter spec --compilers coffee:coffee-script --growl

.PHONY: test