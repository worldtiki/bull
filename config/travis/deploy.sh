#!/usr/bin/env bash

set -e

if [ "$TRAVIS_PULL_REQUEST" == 'false' ]; then
  if [ "$TRAVIS_BRANCH" == 'master' ]; then
    echo "Deploying release"
    gpg --import config/travis/private-key.gpg
    mvn deploy --settings config/travis/mvn-settings.xml -B -U -Prelease -DskipTests=true -Dmaven.test.skip=true
  else
    echo "Deploying snapshot"
    gpg --import config/travis/private-key.gpg
    mvn deploy --settings config/travis/mvn-settings.xml -B -U -Prelease -DskipTests=true -Dmaven.test.skip=true
  fi
fi