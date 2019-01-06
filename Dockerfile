# Ruby on Rails Development Environment
FROM ruby:2.6.0

# Set up Linux
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y build-essential inotify-tools mysql-client nodejs

WORKDIR /app
EXPOSE 3000
