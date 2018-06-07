import caffe
import numpy as np

class MyLayer(caffe.Layer):
    # layer
    # {
    #     name: "testlayer"
    #     type: "Python"
    #     bottom: "pool1"
    #     bottom: "pool1"
    #     top: "testlayer0"
    #     top: "testlayer1"
    #     python_param {
    #         module: "test_layer"
    #         layer: "MyLayer"
    #         param_str: "{\'num_tasks\': 2, \'num_subspaces\': 1,\'init_schema\': 'imbalanced',\'lr_mult\': 1.0,\'base_lr\': 1e-12,\'channels\':64}"
    #     }
    # }
    def setup(self, bottom, top):
        """
        Initializes a CrossStitchLayer.
        :param num_tasks: the number of tasks
        :param num_subspaces: the number of subspaces
        :param init_scheme: the initialization scheme; balanced or imbalanced
        """
        # exception
        # if len(bottom) != 2:
        #     raise Exception("Need two inputs to cross stitch.")
        # if len(top) != 2:
        #     raise Exception("Need two outputs to cross stitch.")
        # # config
        params = eval(self.param_str)
        self.num_tasks = params['num_tasks']
        self.num_subspaces = params['num_subspaces']
        self.init_schema = params['init_schema']
        self.lr_mult = params['lr_mult']
        self.channels = params['channels']
        self.base_lr = params['base_lr']
        self.lr = self.base_lr * (pow(10,int(self.lr_mult-1.0)))
        print('Using %d subspaces...' % self.num_subspaces)
        self.alpha_params = np.full((self.num_tasks * self.num_subspaces,
                                self.num_tasks * self.num_subspaces),
                               1. / (self.num_tasks * self.num_subspaces))
        if self.init_schema == 'imbalanced':
            if self.num_subspaces == 1:
                self.alpha_params = np.full((self.num_tasks, self.num_tasks),
                                       0.1 / (self.num_tasks - 1))
                for i in range(self.num_tasks):
                    self.alpha_params[i, i] = 0.9
            else:
                # 0 1 0 1
                # 0 1 0 1
                # 1 0 1 0
                # 1 0 1 0
                for (x, y), value in np.ndenumerate(self.alpha_params):
                    if (y + 1) % self.num_subspaces == 0 and not \
                            (x in range(self.num_tasks, self.num_tasks+self.num_subspaces)):
                        self.alpha_params[x, y] = 0.95
                    elif (y + self.num_subspaces) % self.num_subspaces == 0 and x \
                            in range(self.num_tasks, self.num_tasks+self.num_subspaces):
                        self.alpha_params[x, y] = 0.95
                    else:
                        self.alpha_params[x, y] = 0.05

        print('Initializing cross-stitch units to:')
        print(self.alpha_params)
        self.alpha = np.tile(self.alpha_params,(self.channels,1))
        self.alpha = self.alpha.reshape(1,self.channels,2,2)
        pass

    def reshape(self, bottom, top):
        # check input dimensions match
        #print(bottom[0].count)
        #print(bottom[1].count)
        # if bottom[0].count != bottom[1].count :
            # raise Exception("Inputs must have the same dimension.")
        # difference is shape of inputs
        # self.diff = self.alpha_params
        # loss output is scalar
        # top[0].reshape(1)
        top[0].reshape(*bottom[0].data.shape)
        top[1].reshape(*bottom[1].data.shape)
        # self.diff = np.zeros_like(bottom[0].data,dtype=np.float32)
        # top[0].reshape(1)
        len(top)

    def forward(self, bottom, top):
        # concat_bottom_data = np.concatenate((bottom[0].data,bottom[1].data), axis=0)
        # # product = self.alpha_params * concat_bottom_data
        # product = np.multiply(self.alpha_params,concat_bottom_data)
        arrSize = bottom[0].data.shape
        for i in range(0,arrSize[1]):
            top[0].data[0,i] = self.alpha[0,i,0,0] * bottom[0].data[0,i] + self.alpha[0,i,0,1] * bottom[1].data[0,i]
            top[1].data[0,i] = self.alpha[0,i,1,0] * bottom[0].data[0,i] + self.alpha[0,i,1,1] * bottom[1].data[0,i]

        # self.alpha
        # top[0].data[...] = np.split(product, self.num_tasks, axis=0)[0]
        # top[1].data[...] = np.split(product, self.num_tasks, axis=0)[1]
        # top[0].data[...] = bottom[0].data[:]
        # top[0].data[...] = self.alpha_params * bottom[0].data
        # top[1].data[...] = self.alpha_params * bottom[1].data
        pass

    def backward(self, top, propagate_down, bottom):
        # for i in range(len(propagate_down)):
        #     if not propagate_down[i]:
        #         continue
        #     bottom[0].diff[...] = top[i].diff[:] *
        # diffs = np.zeros((CHANNELS))
        # for i in range(0, 300):
        #     for j in range(0, 360):
        #         diffs[bottom[0].data[0, i / 2, j / 2]] = top[0].diff[0, i, j]
        #
        # # stand in for future scaling
        # self.weights[...] += diffs[...] / 4
        """
        default:
        num_tasks = 2
        num_subspaces = 1
        lr_mult = 1.0
        """
        # for i in range(2):
        #     if not propagate_down[i]:
        #         continue
        arrSize = top[0].data.shape
        self.diff = np.zeros((1,arrSize[1],2,2),dtype=float)

        for i in range(0, arrSize[1]):
            #print("iii")
            bottom[0].diff[0, i] = self.alpha[0, i, 0, 0] * top[0].diff[0, i] + self.alpha[0, i, 1, 0] * \
                                top[1].diff[0, i]
            bottom[1].diff[0, i] = self.alpha[0, i, 0, 1] * top[0].diff[0, i] + self.alpha[0, i, 1, 1] * \
                                top[1].diff[0, i]
            self.diff[0,i,0,0] = np.sum(np.dot(np.array(top[0].diff[0, i]),np.array(bottom[0].data[0, i]).T))
            self.diff[0,i,0,1] = np.sum(np.dot(np.array(top[0].diff[0, i]), np.array(bottom[1].data[0, i]).T))
            self.diff[0,i,1,0] = np.sum(np.dot(np.array(top[1].diff[0, i]), np.array(bottom[0].data[0, i]).T))
            self.diff[0,i,1,1] = np.sum(np.dot(np.array(top[1].diff[0, i]), np.array(bottom[1].data[0, i]).T))
            # if(self.diff[0,i,0,0]!=0.0 or self.diff[0, i, 0, 1]!=0.0 or self.diff[0, i, 1, 0]!=0.0 or self.diff[0, i, 1, 1]!=0.0):
            #     print("self.diff not equal to 0.0")
            #     pass
            self.alpha[0 ,i, 0, 0] += self.lr * self.diff[0, i, 0, 0]
            self.alpha[0, i, 0, 1] += self.lr * self.diff[0, i, 0, 1]
            self.alpha[0, i, 1, 0] += self.lr * self.diff[0, i, 1, 0]
            self.alpha[0, i, 1, 1] += self.lr * self.diff[0, i, 1, 1]
            # concat_top_diff_data = np.concatenate((top[0].diff[...], top[1].diff[...]), axis=0)
            # product_diff = self.alpha_params * concat_top_diff_data
            # bottom[0].diff[...] = np.split(product_diff, self.num_tasks, axis=0)[0]
            # bottom[1].diff[...] = np.split(product_diff, self.num_tasks, axis=0)[1]
            # for (x, y), value in np.ndenumerate(self.alpha_params):
            #     if x==0 and y==0:
            #         self.alpha_params[x][y] += self.lr_mult * top[0].diff[...] * bottom[0].data[...]
            #     elif x==0 and y==1:
            #         self.alpha_params[x][y] += self.lr_mult * top[0].diff[...] * bottom[1].data[...]
            #     elif x==1 and y==0:
            #         self.alpha_params[x][y] += self.lr_mult * top[1].diff[...] * bottom[0].data[...]
            #     elif x==1 and y==1:
            #         self.alpha_params[x][y] += self.lr_mult * top[1].diff[...] * bottom[1].data[...]

