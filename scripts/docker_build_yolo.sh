#!/usr/bin/env bash

set -e

source scripts/docker_base.sh
source scripts/opencv_version.sh
source scripts/python_version.sh
source scripts/docker_build_opencv.sh "4.5.0"

CONTAINERS=${1:-"all"}

# Version of pytorch available for this L4T. See https://catalog.ngc.nvidia.com/orgs/nvidia/containers/l4t-pytorch
PYTORCH_VERSION=1.10
BASE_PYTORCH="$(echo $BASE_IMAGE | sed 's/base/pytorch/g')-pty$PYTORCH_VERSION-py3"
echo $OPENCV_DEB_PATH

build_yolo()
{
    echo "Building docker image from base: $BASE_PYTORCH"
    docker build --network=host -t "$L4T_VERSION-pth1.10-yolo" \
		. \
		-f ./Dockerfile.yolo \
        --build-arg BASE_IMAGE=$BASE_PYTORCH \
		--build-arg OPENCV_DEB_PATH=$OPENCV_DEB_PATH
}

build_yolo
