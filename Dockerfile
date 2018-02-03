# Ruby on Rails Development Environment
FROM ruby:2.5.0

# Set up Linux
RUN apt-get update
RUN apt-get install -y build-essential inotify-tools libpq-dev nodejs postgresql-client

WORKDIR /app
EXPOSE 3000
