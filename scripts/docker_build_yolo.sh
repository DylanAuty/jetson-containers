#!/usr/bin/env bash

set -e

source scripts/docker_base.sh
source scripts/opencv_version.sh
source scripts/python_version.sh
source scripts/docker_build_opencv.sh "4.5.0"

CONTAINERS=${1:-"all"}

build_yolo()
{
	echo $@
}
