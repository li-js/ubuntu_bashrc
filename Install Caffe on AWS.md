The following has been tested on g2.2xlarge instance with ubuntu-trusty-14.04-amd64-server-20160114.5 (ami-25c00c46) AMI image. 

Alternate links

https://github.com/BVLC/caffe/wiki/Install-Caffe-on-EC2-from-scratch-(Ubuntu,-CUDA-7,-cuDNN)

# Install CUDA
First of all, install CUDA if one wants to use GPU for acceleration. Refer to

https://github.wdf.sap.corp/ICN-MLI-Singapore/MLI-ML-Platform/wiki/Install-CUDA-on-AWS-for-GPU-acceleration

# Install Anacoda:

	wget https://3230d63b5fc54e62148e-c95ac804525aac4b6dba79b00b39d1d3.ssl.cf1.rackcdn.com/Anaconda2-2.5.0-Linux-x86_64.sh
	bash Anaconda2-2.5.0-Linux-x86_64.sh	

#Install OpenCV on AWS 

Taken from http://stackoverflow.com/questions/15790501/why-cv2-so-missing-after-opencv-installed. Download latest opencv from openCV's website (e.g. wget https://github.com/Itseez/opencv/archive/2.4.12.zip), unzip it and cd to the unzipped folder. 

	apt-get install gcc, g++, cmake
	mkdir release
    cd release 
	cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D BUILD_NEW_PYTHON_SUPPORT=ON -D BUILD_EXAMPLES=ON ..
	make
	make install
	export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

try from python with: import cv2. 
If there is a warning: libdc1394 error: Failed to initialize libdc1394, do this: 

        sudo ln /dev/null /dev/raw1394

If getting error: module compiled against API version 9 but this version of numpy is 6
Try: 


		import numpy
		print numpy.__path__


and manually delete it using rm

If Can't find numpy related library, modfiy the Makefile.config to include the numpy lib from anaconda:

	ANACONDA_HOME := $(HOME)/anaconda2
	PYTHON_INCLUDE := /usr/include/python2.7 \
                  /usr/lib/python2.7/dist-packages/numpy/core/include \
                 $(ANACONDA_HOME)/lib/python2.7/site-packages/numpy/core/include/


# Install Pre-requsite for Caffe. 

Check for dependencies at http://caffe.berkeleyvision.org/install_apt.html
	
	sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
	sudo apt-get install --no-install-recommends libboost-all-dev
	sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
	sudo apt-get install libatlas-base-dev


Clone Caffe from https://github.com/BVLC/caffe and follow the installation steps in 

Official guide at http://caffe.berkeleyvision.org/installation.html

Points to Note:

CPU-only Caffe: for cold-brewed CPU-only Caffe uncomment the CPU_ONLY := 1 flag in Makefile.config to configure and build Caffe without CUDA. This is helpful for cloud or cluster deployment.

It is better to use the CMake Option:


        mkdir build
        cd build
        cmake ..
        make all
        make install
        make runtest






