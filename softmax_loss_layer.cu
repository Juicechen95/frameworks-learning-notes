layer{
  name: "data"
  type: "HDF5Data"
  top: "seg_ims"
  top: "seg_labels"
  hdf5_data_param{
    #source: "/mnt/sh_flex_storage/project/mtl/seg/795train.txt"
    source: "/home/chenzhij/project/cross_stitch/ss_net/data_small_train.txt"
    batch_size:1
  }
  include { phase: TRAIN }
}
layer {
  name: "conv1_1"
  type: "Convolution"
  bottom: "seg_ims"
  top: "conv1_1"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 64
    pad: 100
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu1_1"
  type: "ReLU"
  bottom: "conv1_1"
  top: "conv1_1"
}
layer {
  name: "conv1_2"
  type: "Convolution"
  bottom: "conv1_1"
  top: "conv1_2"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 64
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu1_2"
  type: "ReLU"
  bottom: "conv1_2"
  top: "conv1_2"
}
layer {
  name: "pool1"
  type: "Pooling"
  bottom: "conv1_2"
  top: "pool1"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}
layer {
  name: "conv2_1"
  type: "Convolution"
  bottom: "pool1"
  top: "conv2_1"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 128
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu2_1"
  type: "ReLU"
  bottom: "conv2_1"
  top: "conv2_1"
}
layer {
  name: "conv2_2"
  type: "Convolution"
  bottom: "conv2_1"
  top: "conv2_2"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 128
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu2_2"
  type: "ReLU"
  bottom: "conv2_2"
  top: "conv2_2"
}
layer {
  name: "pool2"
  type: "Pooling"
  bottom: "conv2_2"
  top: "pool2"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}
layer {
  name: "conv3_1"
  type: "Convolution"
  bottom: "pool2"
  top: "conv3_1"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 256
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu3_1"
  type: "ReLU"
  bottom: "conv3_1"
  top: "conv3_1"
}
layer {
  name: "conv3_2"
  type: "Convolution"
  bottom: "conv3_1"
  top: "conv3_2"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 256
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu3_2"
  type: "ReLU"
  bottom: "conv3_2"
  top: "conv3_2"
}
layer {
  name: "conv3_3"
  type: "Convolution"
  bottom: "conv3_2"
  top: "conv3_3"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 256
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu3_3"
  type: "ReLU"
  bottom: "conv3_3"
  top: "conv3_3"
}
layer {
  name: "pool3"
  type: "Pooling"
  bottom: "conv3_3"
  top: "pool3"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}
layer {
  name: "conv4_1"
  type: "Convolution"
  bottom: "pool3"
  top: "conv4_1"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu4_1"
  type: "ReLU"
  bottom: "conv4_1"
  top: "conv4_1"
}
layer {
  name: "conv4_2"
  type: "Convolution"
  bottom: "conv4_1"
  top: "conv4_2"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu4_2"
  type: "ReLU"
  bottom: "conv4_2"
  top: "conv4_2"
}
layer {
  name: "conv4_3"
  type: "Convolution"
  bottom: "conv4_2"
  top: "conv4_3"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu4_3"
  type: "ReLU"
  bottom: "conv4_3"
  top: "conv4_3"
}
layer {
  name: "pool4"
  type: "Pooling"
  bottom: "conv4_3"
  top: "pool4"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}
layer {
  name: "conv5_1"
  type: "Convolution"
  bottom: "pool4"
  top: "conv5_1"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu5_1"
  type: "ReLU"
  bottom: "conv5_1"
  top: "conv5_1"
}
layer {
  name: "conv5_2"
  type: "Convolution"
  bottom: "conv5_1"
  top: "conv5_2"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu5_2"
  type: "ReLU"
  bottom: "conv5_2"
  top: "conv5_2"
}
layer {
  name: "conv5_3"
  type: "Convolution"
  bottom: "conv5_2"
  top: "conv5_3"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 512
    pad: 1
    kernel_size: 3
    stride: 1
  }
}
layer {
  name: "relu5_3"
  type: "ReLU"
  bottom: "conv5_3"
  top: "conv5_3"
}
layer {
  name: "pool5"
  type: "Pooling"
  bottom: "conv5_3"
  top: "pool5"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}
layer {
  name: "fc6"
  type: "Convolution"
  bottom: "pool5"
  top: "fc6"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 4096
    pad: 0
    kernel_size: 7
    stride: 1
  }
}
layer {
  name: "relu6"
  type: "ReLU"
  bottom: "fc6"
  top: "fc6"
}
layer {
  name: "drop6"
  type: "Dropout"
  bottom: "fc6"
  top: "fc6"
  dropout_param {
    dropout_ratio: 0.5
  }
}
layer {
  name: "fc7"
  type: "Convolution"
  bottom: "fc6"
  top: "fc7"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 4096
    pad: 0
    kernel_size: 1
    stride: 1
  }
}
layer {
  name: "relu7"
  type: "ReLU"
  bottom: "fc7"
  top: "fc7"
}
layer {
  name: "drop7"
  type: "Dropout"
  bottom: "fc7"
  top: "fc7"
  dropout_param {
    dropout_ratio: 0.5
  }
}
layer {
  name: "score_fr"
  type: "Convolution"
  bottom: "fc7"
  top: "score_fr"
  param {
    lr_mult: 1
    decay_mult: 1
  }
  param {
    lr_mult: 2
    decay_mult: 0
  }
  convolution_param {
    num_output: 40
    pad: 0
    kernel_size: 1
  }
}
layer {
  name: "upscore"
  type: "Deconvolution"
  bottom: "score_fr"
  top: "upscore"
  param {
    lr_mult: 0
  }
  convolution_param {
    num_output: 40
    bias_term: false
    kernel_size: 64
    stride: 32
  }
}
layer {
  name: "score"
  type: "Crop"
  bottom: "upscore"
  bottom: "seg_ims"
  top: "score"
  crop_param {
    axis: 2
    offset: 19
  }
}
layer {
  name: "loss"
  type: "SoftmaxWithLoss"
  bottom: "score"
  bottom: "seg_labels"
  top: "loss"
  loss_param {
    ignore_label: 255
    normalize: true
  }
}
