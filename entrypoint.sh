#!/bin/sh

# Clone only if /app is empty
if [ -z "$(ls -A /app)" ]; then
  echo "Cloning project into /app..."
  git clone git@git.corp.adobe.com:experience-platform/skybridge-singularity.git .
  ./scripts/install_all.sh
else
  echo "/app already has files, skipping clone."
fi

exec "$@"

