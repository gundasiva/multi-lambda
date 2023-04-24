# It's necessary to set this because some environments don't link sh -> bash.
SHELL := /bin/bash

.PHONY: build-hello build-bonjour build-hola

## builds all lambdas
build-all: clean-all build-hello build-bonjour build-hola

## builds a zip file for hello lambda
build-hello:
	mkdir -p hello/tmp && \
	mkdir -p hello/dist && \
	cp -r hello/src/* hello/tmp && \
	pip install -r ./hello/requirements.txt --target hello/tmp && \
	cd hello/tmp && zip -q -9 ../dist/hello.zip -r *

## builds a zip file for bonjour lambda
build-bonjour:
	mkdir -p bonjour/tmp && \
	mkdir -p bonjour/dist && \
	cp -r bonjour/src/* bonjour/tmp && \
	pip install -r ./bonjour/requirements.txt --target bonjour/tmp && \
	cd bonjour/tmp && zip -q -9 ../dist/bonjour.zip -r *

## builds a zip file for hola lambda
build-hola:
	mkdir -p hola/tmp && \
	mkdir -p hola/dist && \
	cp -r hola/src/* hola/tmp && \
	pip install -r ./hola/requirements.txt --target hola/tmp && \
	cd hola/tmp && zip -q -9 ../dist/hola.zip -r *
  
  ## removes temporary directories
clean-all:
	rm -rf deploy && \
	find . -type d -name dist -prune -exec rm -r {} + && \
	find . -type d -name tmp -prune -exec rm -r {} +
