#!/bin/bash

set -eu

HUB_USER=$(op get item Docker | jq -r '.details.fields[] | select(.designation=="username").value')
HUB_PWD=$(op get item Docker | jq -r '.details.fields[] | select(.designation=="password").value')

echo "Logging into Docker Hub"
echo $HUB_PWD | docker login -u $HUB_USER --password-stdin

echo "Building latest image"
docker build -t aybabtme/goose:latest .

echo "Pushing image to Docker Hub"
docker push aybabtme/goose:latest
docker rmi aybabtme/goose:latest
