# Config files for Ruby on Rails development using Docker

## What you get

* One-line dev environment setup and launch: `docker-compose up`.
* One easy-to-install dependency to get coding on a new computer: Docker. (Versus two complex ones when using Vagrant.)
* Development-oriented config: Source code is mounted so that changes in the container appear on the host, and vice-versa.
* Fast re-builds because the `DOCKERFILE` is written to help Docker cache the images.
* Syncing with Postgres startup delay.
* All the crappy little dependencies installed.
* No weird hacks.
* Tested with current Ruby and Rails as of 2018-02-02: Ruby **2.5.0**, Rails **5.1.4**


Tested on MacOS and Fedora Linux, because that's what
I happen to use. This is my personal configuration that I use for client work
and my own projects. It's the result of several late-night hours getting everything working!


## How to Dockerize your Rails app

0. Install Docker somehow. I use [Docker for Mac](https://www.docker.com/docker-mac).
1. Copy the three config files to an existing Rails project. Make `run.sh` executable, e.g., `chmod +x run.sh`.
2. Edit your development database settings to connect to Postgres at host `db`, username `postgres`, password empty string.
3. Spin it up with `docker-compose up`.

Tests can be run in the container like so:

```bash
docker-compose exec web rspec
```

I create an alias `run` so that I just do:

```bash
run rspec
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
