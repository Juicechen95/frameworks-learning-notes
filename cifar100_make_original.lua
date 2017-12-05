require 'xlua'
require 'sys'
local matio = require 'matio'

local data = {}
local labels = {}


local train_data = matio.load'./cifar-100-matlab/train.mat'
local test_data = matio.load'./cifar-100-matlab/test.mat'

local n_train = train_data.fine_labels:numel()
local n_test = test_data.fine_labels:numel()

local dataset = {
   trainData = {
      data = train_data.data:clone():view(-1,3,32,32),
      labels = train_data.fine_labels:squeeze() + 1,
      size = function() return n_train end,
   },
   testData = {
      data = test_data.data:clone():view(-1,3,32,32),
      labels = test_data.fine_labels:squeeze() + 1,
      size = function() return n_test end,
   }
}

print(dataset)
print(dataset.trainData.labels:max())
print(dataset.testData.labels:max())
torch.save('cifar100_original.t7', dataset)