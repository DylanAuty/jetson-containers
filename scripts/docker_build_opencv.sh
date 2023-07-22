#!/usr/bin/env bash

set -e
source scripts/docker_base.sh

OPENCV_VERSION=${1:-"4.5.0"}

build_opencv()
{
	local opencv_version=$1
	if [ -f "$PWD/packages/OpenCV-${opencv_version}-$ARCH.tar.gz" ]; then
		echo "OpenCV Packages already exist. Not continuing with OpenCV build."
		OPENCV_DEB_PATH=$PWD/packages/OpenCV-${opencv_version}-$ARCH.tar.gz
		return
	fi

	if [ $ARCH = "aarch64" ]; then
		local container_tag="opencv-builder:r$L4T_VERSION-cv$opencv_version"
		# This must match the CUDA architecture for the target device. 
		# For the Jetson TX2, this is 6.2 (from SM62 or compute_62)
		#local cuda_arch_bin="5.3,6.2,7.2,8.7"
		local cuda_arch_bin="5.3,6.2"
		local enable_neon="ON"
	elif [ $ARCH = "x86_64" ]; then
		local container_tag="opencv-builder:cv$opencv_version"
		local cuda_arch_bin=""
		local enable_neon="OFF"
	fi
	
	# opencv.csv mounts files that preclude us installing different version of opencv
	# temporarily disable the opencv.csv mounts while we build the container
	CV_CSV="/etc/nvidia-container-runtime/host-files-for-container.d/opencv.csv"
	
	if [ -f "$CV_CSV" ]; then
		sudo mv $CV_CSV $CV_CSV.backup
	fi
	
	echo "building OpenCV $opencv_version deb packages"

	sh ./scripts/docker_build.sh $container_tag Dockerfile.opencv \
			--build-arg BASE_IMAGE=$BASE_IMAGE \
			--build-arg OPENCV_VERSION=$opencv_version \
			--build-arg CUDA_ARCH_BIN=$cuda_arch_bin \
			--build-arg ENABLE_NEON=$enable_neon

	echo "done building OpenCV $opencv_version deb packages"
	
	if [ -f "$CV_CSV.backup" ]; then
		sudo mv $CV_CSV.backup $CV_CSV
	fi
	
	# copy deb packages to jetson-containers/packages directory
	sudo docker run --rm \
			--volume $PWD/packages:/mount \
			$container_tag \
			cp opencv/build/OpenCV-${opencv_version}-$ARCH.tar.gz /mount
			
	OPENCV_DEB_PATH=packages/OpenCV-${opencv_version}-$ARCH.tar.gz
	echo "packages are at $PWD/$OPENCV_DEB_PATH"
}
	
build_opencv $OPENCV_VERSION
