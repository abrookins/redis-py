.PHONY: base clean dev test

build:
		docker build -t redis-py-base docker/base
		docker build -t redis-py-master docker/master
		docker build -t redis-py-slave docker/slave
		docker build -t redis-py-sentinel-1 docker/sentinel_1
		docker build -t redis-py-sentinel-2 docker/sentinel_2
		docker build -t redis-py-sentinel-3 docker/sentinel_1
		docker build -t redis-py-test .

dev:	base
		docker-compose up -d

test:	dev
		docker-compose run --rm test /redis-py/docker-entry.sh

clean:
		docker-compose stop
		docker-compose rm -f
