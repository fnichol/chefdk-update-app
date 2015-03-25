#!/usr/bin/env sh

exec "/opt/chefdk/embedded/bin/ruby" "`dirname $0`/chefdk-update-app.rb" "$@"
