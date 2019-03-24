# Ruby on Rails Development Environment
FROM ruby:2.6.2

# Set up Linux
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential inotify-tools less mysql-client nodejs libpq-dev nodejs postgresql-client

WORKDIR /app
EXPOSE 3000
