#!/bin/bash
IMAGE_NAME='robot-docker'
VOLUME_NAME='robot-docker-volume'

docker run -it --shm-size=1gb --volumes-from $VOLUME_NAME $IMAGE_NAME:latest pybot $@ .
RESULT=$?
exit $RESULT
