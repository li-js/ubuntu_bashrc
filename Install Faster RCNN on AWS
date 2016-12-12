[For using Faster RCNN you must have installed Cuda (if you are using GPU), Caffe and OpenCV.]

Faster RCNN is a typical object detection pipeline. It can detect 20 categories of objects. Official website at https://github.com/rbgirshick/py-faster-rcnn.git

	git clone --recursive https://github.com/rbgirshick/py-faster-rcnn.git
	cd $FRCN_ROOT/lib
	make
	cd $FRCN_ROOT/caffe-fast-rcnn
	Set the correct Makefile.config
	make -j6 && make pycaffe


Try if it works with 

        python tools/demo.py --net zf

If it can't find easydict:

		sudo pip install easydict
		Append .bashrc with:  export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/dist-packages/

If it can't find cv2:

		Go to Install OpenCV

If getting error: No module named google.protobuf.internal, fix it with: 

			sudo apt-get install python-protobuf
			sudo pip install protobuf  
			Add add the location to $PYTHONPATH

## On AWS, the GPU does not support compute_35. 

Reference link: https://github.com/rbgirshick/py-faster-rcnn/issues/49

Please change the architecture setting into:

In Makefile.config:

	CUDA_ARCH := -gencode arch=compute_30,code=sm_30 \
						 -gencode arch=compute_50,code=sm_50 \
						 -gencode arch=compute_50,code=compute_50

In $FRCN_ROOT/lib/setup.py file line 135: 

         change '-arch=sm_35' into '-arch=sm_30'

In $FRCN_ROOT/lib/, 

         remove these files: utils/bbox.c nms/cpu_nms.c nms/gpu_nms.cpp, if they exist.
	 Then re-make the file under $FRCN_ROOT/lib,  $FRCN_ROOT/caffe-fast-rcnn

	

Since Faster-RCNN requires about 5G memory of GPU with the default VGG16 net, we have to use CPU with:

	python tools/demo.py --cpu 

We can also use a smaller net by:

	python tools/demo.py works --net zf
