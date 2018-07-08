layer{
  name: "data"
  type: "HDF5Data"
  top: "seg_ims"
  top: "seg_labels"
  hdf5_data_param{
    source: "/mnt/sh_flex_storage/project/mtl/seg/795train.txt"
    batch_size:1
  }
  include { phase: TRAIN }
}
layer {
  name: "seg_conv1_1"
  type: "Convolution"
  bottom: "seg_ims"
  top: "seg_conv1_1"
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
  name: "seg_relu1_1"
  type: "ReLU"
  bottom: "seg_conv1_1"
  top: "seg_conv1_1"
}
layer {
  name: "seg_conv1_2"
  type: "Convolution"
  bottom: "seg_conv1_1"
  top: "seg_conv1_2"
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
  name: "seg_relu1_2"
  type: "ReLU"
  bottom: "seg_conv1_2"
  top: "seg_conv1_2"
}
layer {
  name: "seg_pool1"
  type: "Pooling"
  bottom: "seg_conv1_2"
  top: "seg_pool1"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}

layer {
  name: "seg_conv2_1"
  type: "Convolution"
  bottom: "seg_pool1"
  top: "seg_conv2_1"
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
  name: "seg_relu2_1"
  type: "ReLU"
  bottom: "seg_conv2_1"
  top: "seg_conv2_1"
}
layer {
  name: "seg_conv2_2"
  type: "Convolution"
  bottom: "seg_conv2_1"
  top: "seg_conv2_2"
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
  name: "seg_relu2_2"
  type: "ReLU"
  bottom: "seg_conv2_2"
  top: "seg_conv2_2"
}
layer {
  name: "seg_pool2"
  type: "Pooling"
  bottom: "seg_conv2_2"
  top: "seg_pool2"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}

layer {
  name: "seg_conv3_1"
  type: "Convolution"
  bottom: "seg_pool2"
  top: "seg_conv3_1"
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
  name: "seg_relu3_1"
  type: "ReLU"
  bottom: "seg_conv3_1"
  top: "seg_conv3_1"
}
layer {
  name: "seg_conv3_2"
  type: "Convolution"
  bottom: "seg_conv3_1"
  top: "seg_conv3_2"
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
  name: "seg_relu3_2"
  type: "ReLU"
  bottom: "seg_conv3_2"
  top: "seg_conv3_2"
}
layer {
  name: "seg_conv3_3"
  type: "Convolution"
  bottom: "seg_conv3_2"
  top: "seg_conv3_3"
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
  name: "seg_relu3_3"
  type: "ReLU"
  bottom: "seg_conv3_3"
  top: "seg_conv3_3"
}
layer {
  name: "seg_pool3"
  type: "Pooling"
  bottom: "seg_conv3_3"
  top: "seg_pool3"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}

layer {
  name: "seg_conv4_1"
  type: "Convolution"
  bottom: "seg_pool3"
  top: "seg_conv4_1"
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
  name: "seg_relu4_1"
  type: "ReLU"
  bottom: "seg_conv4_1"
  top: "seg_conv4_1"
}
layer {
  name: "seg_conv4_2"
  type: "Convolution"
  bottom: "seg_conv4_1"
  top: "seg_conv4_2"
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
  name: "seg_relu4_2"
  type: "ReLU"
  bottom: "seg_conv4_2"
  top: "seg_conv4_2"
}
layer {
  name: "seg_conv4_3"
  type: "Convolution"
  bottom: "seg_conv4_2"
  top: "seg_conv4_3"
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
  name: "seg_relu4_3"
  type: "ReLU"
  bottom: "seg_conv4_3"
  top: "seg_conv4_3"
}
layer {
  name: "seg_pool4"
  type: "Pooling"
  bottom: "seg_conv4_3"
  top: "seg_pool4"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}

layer {
  name: "seg_conv5_1"
  type: "Convolution"
  bottom: "seg_pool4"
  top: "seg_conv5_1"
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
  name: "seg_relu5_1"
  type: "ReLU"
  bottom: "seg_conv5_1"
  top: "seg_conv5_1"
}
layer {
  name: "seg_conv5_2"
  type: "Convolution"
  bottom: "seg_conv5_1"
  top: "seg_conv5_2"
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
  name: "seg_relu5_2"
  type: "ReLU"
  bottom: "seg_conv5_2"
  top: "seg_conv5_2"
}
layer {
  name: "seg_conv5_3"
  type: "Convolution"
  bottom: "seg_conv5_2"
  top: "seg_conv5_3"
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
  name: "seg_relu5_3"
  type: "ReLU"
  bottom: "seg_conv5_3"
  top: "seg_conv5_3"
}
layer {
  name: "seg_pool5"
  type: "Pooling"
  bottom: "seg_conv5_3"
  top: "seg_pool5"
  pooling_param {
    pool: MAX
    kernel_size: 2
    stride: 2
  }
}

layer {
  name: "seg_fc6"
  type: "Convolution"
  bottom: "seg_pool5"
  top: "seg_fc6"
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
  name: "seg_relu6"
  type: "ReLU"
  bottom: "seg_fc6"
  top: "seg_fc6"
}
layer {
  name: "seg_drop6"
  type: "Dropout"
  bottom: "seg_fc6"
  top: "seg_fc6"
  dropout_param {
    dropout_ratio: 0.5
  }
}

layer {
  name: "seg_fc7"
  type: "Convolution"
  bottom: "seg_fc6"
  top: "seg_fc7"
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
  name: "seg_relu7"
  type: "ReLU"
  bottom: "seg_fc7"
  top: "seg_fc7"
}
layer {
  name: "seg_drop7"
  type: "Dropout"
  bottom: "seg_fc7"
  top: "seg_fc7"
  dropout_param {
    dropout_ratio: 0.5
  }
}

layer {
  name: "seg_score_fr"
  type: "Convolution"
  bottom: "seg_fc7"
  top: "seg_score_fr"
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
  name: "seg_upscore"
  type: "Deconvolution"
  bottom: "seg_score_fr"
  top: "seg_upscore"
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
  name: "seg_score"
  type: "Crop"
  bottom: "seg_upscore"
  bottom: "seg_ims"
  top: "seg_score"
  crop_param {
    axis: 2
    offset: 19
  }
}
layer {
  name: "seg_loss"
  type: "SoftmaxWithLoss"
  bottom: "seg_score"
  bottom: "seg_labels"
  top: "seg_loss"
  loss_param {
    ignore_label: 255
    normalize: true
  }
}
