#!/usr/bin/env sh
set -e
set -x

if test ! -x /usr/bin/curl; then
  sudo -E apt-get update -y
  sudo -E apt-get install -y curl git-core
fi

if test ! -d /opt/chefdk; then
  curl -L http://www.chef.io/chef/install.sh | sudo -E bash -s -- -P chefdk
fi

sudo -E /tmp/kitchen/data/chefdk-update-app.sh test-kitchen -r v1.4.0.beta.1
