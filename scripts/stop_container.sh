#!/bin/bash

set -e

echo "Deleting existing Docker containers"
containerid=$(docker ps -q)  # Capture the container IDs into the variable
docker rm -f $containerid  # Force-remove the containerss

