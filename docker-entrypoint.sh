#!/bin/bash
set -e

if [ "$1" = 'update' ]; then
  bundle exec hanami db create
  bundle exec hanami db migrate
  exit 0
fi

if [ "$1" = 'web' ]; then
  bundle exec puma -C config/puma.rb --bind tcp://0.0.0.0:80
fi

if [ "$1" = 'test' ]; then
  echo 'Specs...'
  export HANAMI_ENV=test
  bundle exec hanami db create
  bundle exec hanami db migrate
  bundle exec rspec
  exit 0
fi

exec "$@"
