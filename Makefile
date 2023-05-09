.PHONY: deploy build
deploy: build
	rsync --archive --delete book/* personal-droplet:chennaifoss23

build:
	mdbook build
