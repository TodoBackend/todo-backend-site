todo-backends-site
=================

Source for www.todobackend.com. This is a [middleman](https://middlemanapp.com)-based static website. 

built and deployed to S3 via: [![CircleCI](https://circleci.com/gh/TodoBackend/todo-backend-site.svg?style=svg)](https://circleci.com/gh/TodoBackend/todo-backend-site)

## Adding a new implementation listing
To add a new Todo-Backend implementation:
- [ ] edit `data/implementations.yaml`
- [ ] add any new tags to `data/impl_tags.yaml`
- [ ] and add logos to `source/images/logos`.

## Running a local instance of the site from source
- *Make sure you have git submodules set up with `git submodule update --init --recursive`*
- Install required gems with `bundle install`
- build the site with `bundle exec rake build`
- run a dev server with `bundle exec middleman`

## Running the site via docker
A dockerized version of the site is available on Docker Hub as [moredip/todo-backend-site](https://hub.docker.com/r/moredip/todo-backend-site).

*Make sure you have git submodules set up with `git submodule update --init --recursive`*

You can run the site within a container while still incorporating local changes:
```
docker run -p 4567:4567 -v "${PWD}/data:/opt/docker/data" -v "${PWD}/source:/opt/docker/source" moredip/todo-backend-site build serve
```

If you prefer Docker Compose there's a `docker-compose.yml` in the root of the source repo, so you can just do:
```
docker-compose run --service-ports site
```
and you'll have the site running on port 80 of your Docker host.
