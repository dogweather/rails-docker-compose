# Config files for Ruby on Rails development using Docker

> Uses latest versions as of 2018-02-02: Ruby 1.5.0, Rails 5.1.4, and latest
Postgres. (But these are easy to change.) Tested on MacOS, because that's what
I happen to use. This is my personal configuration that I use for client work
and my own projects.


## What you get

* Development-oriented config: Source code is mounted so that changes in the container appear on the host, and vice-versa.
* Fast re-builds because the `DOCKERFILE` is written to help Docker cache the images.
* Syncing with Postgres startup delay.
* All the crappy little dependencies installed.
* No weird hacks.


## How to Dockerize your Rails app

0. Install Docker somehow. I use Docker for Mac.
1. Copy the three config files to an existing Rails project which you want to Dockerize.
2. Edit your development database settings to connect to Postgres at host `db`, username `postgres`, password empty string.
3. Spin it up with `docker-compose up`.

Tests can be run in the container like so:

```bash
docker-compose exec web bin/rspec
```

Or use Spring inside Docker the cheap and easy way:

```bash
docker-compose exec web bash
bin/rspec
```

...then leave that session open and re-run the tests with
a fast Spring boot up:

```bash
bin/rspec
```
