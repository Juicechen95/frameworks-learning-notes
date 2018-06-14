# frameworks-learning-notes
some learning notes on deep learning frameworks , such as Torch7, caffe


# Torch7
[classification datasets results ranking](https://rodrigob.github.io/are_we_there_yet/build/classification_datasets_results.html)

# Caffe

## create own layers

* [custom python layers](http://www.riptutorial.com/caffe/topic/10535/custom-python-layers)
* [python layer examples](https://www.programcreek.com/python/example/107863/caffe.Layer)

## visualization
[plot loss](https://cvdreamer.wordpress.com/2016/07/27/how-to-plot-training/)

# Tensorflow

pip install tensorflow-gpu==1.7.0

pip install -r requirements.txt

import tensorflow 时找不搭配cuda:

.bashrc
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# Pytorch

## create own layers

* [extending autograd&nn](https://pytorch.org/docs/stable/notes/extending.html) 
* [implement a layer](https://pytorch.org/tutorials/beginner/pytorch_with_examples.html#pytorch-custom-nn-modules)
