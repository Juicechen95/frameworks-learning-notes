# this layer is used to debug caffe
# write by Chenzhi,Jiang
# 2018/6/6

import caffe
import numpy as np

class DebugLayer(caffe.Layer):

    def setup(self, bottom, top):
        pass

    def reshape(self, bottom, top):
        top[0].reshape(*bottom[0].data.shape)
        len(top)

    def forward(self, bottom, top):
        arrSize = bottom[0].data.shape
        #print(arrSize)
        for i in range(0,arrSize[1]):
            top[0].data[0,i] = bottom[0].data[0,i]

    def backward(self, top, propagate_down, bottom):
        
        arrSize = top[0].data.shape
        self.diff = np.zeros((1,arrSize[1],2,2),dtype=float)
        
        for i in range(0, arrSize[1]):
            bottom[0].diff[0, i] = top[0].diff[0, i] 
            self.diff[0,i,0,0] = np.sum(np.dot(np.array(top[0].diff[0, i]),np.array(bottom[0].data[0, i]).T))
        print('top.data sum')
        topsum = np.sum(np.array(top[0].data))
        print(topsum)
        print('top.diff sum')
        sum = np.sum(np.array(top[0].diff))
        print(sum)
        print('bottom shape')
        print(bottom[0].data.shape)
        print('bottom data sum')
        botsum = np.sum(np.array(bottom[0].data))
        print(botsum)
             