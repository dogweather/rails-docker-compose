#!/bin/sh
set -e

# Ensure the app's dependencies are installed
echo "bundle install --without=production..."
gem update --system
gem update bundler
bundle install --without=production

# Wait for Postgres to become available.
echo "Checking for Postgres..."
until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
echo "Postgres is available: continuing with database setup..."

# Potentially Set up the database
echo "bundle exec rake db:setup..."
bundle exec rake db:setup

# Start the web server
echo "bin/rails s -p 3000 -b '0.0.0.0'..."
rm -f tmp/pids/server.pid
bin/rails s -p 3000 -b '0.0.0.0'
