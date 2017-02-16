todo-backend-site
=================

Source for www.todobackend.com. This is a [middleman](https://middlemanapp.com)-based static website. 

[![Build Status](https://snap-ci.com/TodoBackend/todo-backend-site/branch/master/build_image)](https://snap-ci.com/TodoBackend/todo-backend-site/branch/master)
built and deployed to S3 via SnapCI.

[ ![Codeship Status for TodoBackend/todo-backend-site](https://app.codeship.com/projects/adb54330-d6a0-0134-4172-5abfbe9ef951/status?branch=master)](https://app.codeship.com/projects/202822)

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

You can run the site within a container while still incorporating local changes:
```
docker run -p 4567:4567 -v "${PWD}/data:/opt/docker/data" -v "${PWD}/source:/opt/docker/source" moredip/todo-backend-site build serve
```

If you prefer Docker Compose there's a `docker-compose.yml` in the root of the source repo, so you can just do:
```
docker-compose run --service-ports site
```
and you'll have the site running on port 80 of your Docker host.
