#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build . -t project-microservices-udacity

# Step 2: 
# List docker images
docker images | grep project-microservices-udacity

# Step 3: 
# Run flask app
docker run -p 5000:80 project-microservices-udacity
