todo-backend-site
=================

Source for www.todobackend.com. This is a [middleman](https://middlemanapp.com)-based static website. 

[![Build Status](https://snap-ci.com/TodoBackend/todo-backend-site/branch/master/build_image)](https://snap-ci.com/TodoBackend/todo-backend-site/branch/master)
built and deployed to S3 via SnapCI.

- Install required gems with `bundle install`
- To run the site locally, run `bundle exec middleman`
- To install bower dependencies for the client app and the specs app, run `bundle exec rake build`
- To add a new Todo-Backend implementation, edit `data/implementations.yaml`
