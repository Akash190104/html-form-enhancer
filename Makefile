SOURCE_FILES:=$(shell find src/ -type f -name '*.ts')

.PHONY:all
all: build

.PHONY:build
build: dist/build

.PHONY:test
test:
	npx nyc mocha

.PHONY:lint
lint:
	npx eslint --quiet 'src/*.ts'

.PHONY:lint-fix
lint-fix: fix

.PHONY:fix
fix:
	npx eslint --quiet 'src/**/*.ts' --fix

.PHONY:watch
watch:
	npx tsc --watch

.PHONY:start
start: build

.PHONY:clean
clean:
	rm -r dist

dist/build: $(SOURCE_FILES)
	npx tsc
	@# Creating a small file to keep track of the last build time
	touch dist/build
