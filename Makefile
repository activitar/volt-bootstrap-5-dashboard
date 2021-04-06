OUTPUT_DIR=$(shell readlink -f ./html\&css/)
SOURCE_DIR=$(shell readlink -f ./src)

build: install clean generate rename toslim

install:
	yarn

generate:
	export SOURCE_ROOT="$(SOURCE_DIR)" export OUTPUT_ROOT="$(OUTPUT_DIR)"; yarn gulp build:dev

rename:
	find "$(OUTPUT_DIR)" -iname '*.html' | xargs rename 's/\.html/.html.erb/'

toslim:
	erb2slim "$(OUTPUT_DIR)"
	html2slim "$(OUTPUT_DIR)"

clean:
	rm -rf "$(OUTPUT_DIR)"
