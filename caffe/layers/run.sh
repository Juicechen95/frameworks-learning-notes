#!/usr/bin/env sh

gdb --args /home/chenzhij/project/cross_stitch/pythonenv/SN_oldcaffe/MarrRevisited/caffe/build/tools/caffe train \
    --solver=/home/chenzhij/project/cross_stitch/pythonenv/SN_oldcaffe/MarrRevisited/normals/net/seg/solver.prototxt --weights=/mnt/sh_flex_storage/project/mtl/combined_model/train_ss_initial_weights.caffemodel 
    
#/home/chenzhij/project/cross_stitch/pythonenv/SN_oldcaffe/MarrRevisited/caffe/build/tools/caffe train \
    #--solver=/home/chenzhij/project/cross_stitch/pythonenv/SN_oldcaffe/MarrRevisited/normals/net/conv/solver.prototxt --weights=/mnt/sh_flex_storage/chenzhij/data/marr_nyud/surface_normal_models/VGG16_fconv.caffemodel

#resume
#/home/chenzhij/project/MarrRevisited/caffe/build/tools/caffe train -solver /home/chenzhij/project/MarrRevisited/normals/net/conv/solver.prototxt -snapshot /home/chenzhij/project/MarrRevisited/normals/net/conv/vgg_model_train795_iter_1440.solverstate

#train crostich
#/home/chenzhij/project/MarrRevisited/caffe/build/tools/caffe train \
    #--solver=/home/chenzhij/project/MarrRevisited/normals/net/conv/Crostich_solver.prototxt --weights=/mnt/sh_flex_storage/chenzhij/data/marr_nyud/surface_normal_models/VGG16_fconv.caffemodel

