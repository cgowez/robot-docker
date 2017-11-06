#!/bin/bash
IMAGE_NAME='robot-docker'
VOLUME_NAME='robot-docker-volume'

docker run -it --volumes-from $VOLUME_NAME $IMAGE_NAME:latest pybot $@ --listener /opt/listener.py .
RESULT=$?
exit $RESULT
