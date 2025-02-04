#!/bin/bash

set -e

docker pull kalyaniii28/python-app:latest
docker run -d -p 5000:5000 kalyaniii28/python-app:latest

echo " docker run sucess"
