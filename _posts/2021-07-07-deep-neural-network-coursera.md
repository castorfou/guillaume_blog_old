---
title: "Deep Neural Network with PyTorch - Coursera"
description: From IBM
toc: true
comments: true
layout: post
categories: [pytorch, coursera]
image: https://upload.wikimedia.org/wikipedia/commons/9/96/Pytorch_logo.png
---

Coursera website:  [Deep Neural Networks with PyTorch](https://www.coursera.org/learn/deep-neural-networks-with-pytorch/home/welcome)



# Week 1 - Tensor and Datasets

#### Learning Objectives

- Tensors 1D
- Two-Dimensional Tensors
- Data Set
- Differentiation in PyTorch



#### Tensors 1D

[notebook](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/Week%201%20-%20Tensor%20and%20Datasets.ipynb)



###### the basics

```python
#initialize
import torch
a=torch.tensor([7,4,3,2,6])

#dtype, type()
a.dtype
a.type()

#convert with type
a=a.type(torch.FloatTensor)

#size, ndimension
a.size()
a.ndimension()

#convert to 2D
a_2D=a.view(-1, 1)

#from_numpy, to numpy
import numpy as np
numpy_array = np.array([0.0, 1.0, 2.0, 3.0, 4.0])
torch_tensor = torch.from_numpy(numpy_array)
back_to_numpy = torch_tensor.numpy()

#from pandas
import pandas as pd
pandas_series = pd.Series([0.1, 2, 0.3, 10.1])
pandas_to_torch = torch.from_numpy(pandas_series.values)

#to list
this_tensor = torch.tensor([0, 1, 2, 3])
torch_to_list = this_tensor.tolist()

#item
new_tensor = torch.tensor([5, 2, 6, 1])
new_tensor[0].item()

#indexing and slicing
c[3:5]=torch.tensor([300.0, 4.0])
```



###### basic operations

```python
#hadamard product
z = u*v

#dot product, (produit scalaire)
result = torch.dot(u, v)
```



###### universal functions, mean, max, mathematical functions, plot with linspace

```python
#mean
a.mean()

#max
b.max()

#plot y=sin(x)
import matplotlib.pyplot as plt
%matplotlib inline

x = torch.linspace(0, 2 * np.pi, 100)
y = torch.sin(x)
plt.plot(x.numpy(), y.numpy())
```



###### Ungraded lab

[1.1_1Dtensors_v2.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.1_1Dtensors_v2.ipynb)



#### Tensors 2D

[notebook](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/Week%201%20-%20Tensor%20and%20Datasets.ipynb#Tensors-2D)

###### Tensor creation in 2D

```python
a = [ [11, 12, 13], [21, 22, 23], [31, 32, 33] ]
A = torch.tensor(a)

A.ndimension()
>> 2

A.shape
>> torch.Size([3, 3])

A.size()
>> torch.Size([3, 3])

#number of elements
A.numel()
>> 9
```



###### Indexing and slicing in 2D

```python
A[0, 0:2]
>> tensor([11, 12])

A[1:3, 2]
>> tensor([23, 33])
```



###### Basic operations in 2D: hadamard product, matrix multiplication

```python
X = torch.tensor([[1,0], [0,1]])
Y = torch.tensor([[2,1], [1,2]])

#hadamard product
Z = X*Y
Z
>> tensor([[2, 0],
           [0, 2]])

A = torch.tensor([ [0, 1, 1], [1, 0, 1]])
B = torch.tensor([ [1, 1], [1, 1], [-1, 1]])

#matrix multiplication
C = torch.mm(A, B)
C
>> tensor([[0, 2],
           [0, 2]])
```

###### Ungraded lab

[1.1_2 Two-Dimensional Tensors_v2.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.1_2 Two-Dimensional Tensors_v2.ipynb)



#### Derivatives in Pytorch

###### Derivatives

using $y(x)=x^2$

```python
x = torch.tensor(2., requires_grad=True)
y = x ** 2

#calculate derivative df/dx
y.backward()
#evaluate at x : df/dx(x)
x.grad
>> tensor(4.)
```

using $z(x)=x^2+2x+1$

```python
x = torch.tensor(2., requires_grad=True)
z = x**2 + 2*x + 1
z.backward()
x.grad
>> tensor(6.)
```

Note: in my version of pytorch (1.7.1), I cannot use torch.int dtypes.

```python
---------------------------------------------------------------------------
RuntimeError                              Traceback (most recent call last)
<ipython-input-92-979d0f10c1e7> in <module>
----> 3 x = torch.tensor(2, requires_grad=True)
      4 z = x**2 + 2*x + 1
      5 z.backward()
RuntimeError: Only Tensors of floating point and complex dtype can require gradients
```



###### Partial derivatives

using $f(u, v)=uv+u^2$, $\frac{\partial f(u,v)}{\partial u} = v+2u$, $\frac{\partial f(u,v)}{\partial v} = u$

```python
u = torch.tensor(1., requires_grad=True)
v = torch.tensor(2., requires_grad=True)

f = u*v + u**2

#calculate all partial derivatives df/du and df/dv
f.backward()
#evaluate partial derivative with respect to u df/du at u, v : df/du(u, v)
u.grad
>> tensor(4.)
#evaluate partial derivative with respect to v df/dv at u, v : df/dv(u, v)
v.grad
>> tensor(1.)
```



###### Ungraded lab

[1.2derivativesandGraphsinPytorch_v2.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.2derivativesandGraphsinPytorch_v2.ipynb)

With some explanation about `.detach()` pointing to [torch.autograd documentation](https://pytorch.org/tutorials/beginner/blitz/autograd_tutorial.html). In this page, there is a link to [walkthrough of backprop](https://www.youtube.com/watch?v=tIeHLnjs5U8) video.

Will have to go back to `.detach()`



#### Simple Dataset



###### Build a Dataset Class and Object

```python
from torch.utils.data import Dataset

class toy_set(Dataset):
    def __init__(self, length=100, transform=None):
        self.x = 2*torch.ones(length, 2)
        self.y = torch.ones(length, 1)
        self.len = length
        self.transform = transform
    def __getitem__(self, index):
        sample=self.x[index], self.y[index]
        if self.transform:
            sample = self.transform(sample)
        return sample
    def __len__(self):
        return self.len
    
dataset = toy_set()
len(dataset)
>> 100
dataset[0]
(tensor([2., 2.]), tensor([1.]))
```



###### Build a Dataset Transform (e.g. normalize or standardize)

```python
class add_mult(object):
    def __init__(self, addx=1, muly=1):
        self.addx = addx
        self.muly = muly
    def __call__(self, sample):
        x=sample[0]
        y=sample[1]
        x=x+self.addx
        y=y*self.muly
        sample=x, y
        return sample
    
    
# automatically apply the transform
a_m = add_mult()
dataset_ = toy_set(transform=a_m)
dataset_[0]
>> (tensor([3., 3.]), tensor([1.]))
```



###### Compose Transforms

```python
class mult(object):
    def __init__(self, mul=100):
        self.mul = mul

    def __call__(self, sample):
        x = sample[0]
        y = sample[1]
        x = x * self.mul
        y = y * self.mul
        sample = x, y
        return sample
    
from torchvision import transforms
data_transform = transforms.Compose([add_mult(), mult()])

# automatically apply the composed transform
dataset_tr = toy_set(transform=data_transform)
dataset_tr[0]
>> (tensor([300., 300.]), tensor([100.]))
```

###### Ungraded lab

[1.3.1_simple_data_set_v2.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.3.1_simple_data_set_v2.ipynb)



#### Dataset

###### Dataset Class for Images

```python
from PIL import Image
import pandas as pd
import os
from matplotlib.pyplot import imshow
from torch.utils.data import Dataset, DataLoader
```

```python
class Dataset(Dataset):
    def __init__(self, csv_file, data_dir, transform=None):
        self.transform = transform
        self.data_dir = data_dir
        data_dir_csv_file = os.path.join(self.data_dir, csv_file)
        self.data_name = pd.read_csv(data_dir_csv_file)
        self.len = self.data_name.shape[0]
    def __len__(self):
        return self.len
    def __getitem__(self, idx):
        img_name=os.path.join(self.data_dir, self.data_name.iloc[idx, 1])
        image = Image.open(img_name)
        y = self.data_name.iloc[idx, 0]
        if self.transform:
            image = self.transform(image)
        return image, y
    
def show_data(data_sample, shape = (28, 28)):
    plt.imshow(data_sample[0].numpy().reshape(shape), cmap='gray')
    plt.title('y = ' + data_sample[1])
```

```python
dataset = Dataset(csv_file=csv_file, data_dir=directory)
show_data(dataset[0])
```



###### Torch Vision Transforms

```python
import torchvision.transforms as transforms
transforms.CenterCrop(20)
transforms.ToTensor()
croptensor_data_transform = transforms.Compose( [ transforms.CenterCrop(20), transforms.ToTensor() ] )
dataset = Dataset(csv_file=csv_file, data_dir=directory, transform=croptensor_data_transform)
dataset[0][0].shape
>> torch.Size([1, 20, 20])
```



###### Torch Vision Datasets

MNIST example

```python
import torchvision.datasets as dsets
dataset = dsets.MNIST(root='./data', train = False, download = True, transform = transforms.ToTensor())
```



###### Ungraded lab

[1.3.2_Datasets_and_transforms.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.3.2_Datasets_and_transforms.ipynb)

[1.3.3_pre-Built Datasets_and_transforms_v2.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/1.3.3_pre-Built Datasets_and_transforms_v2.ipynb)



# Week 2 - Linear Regression

#### 

#### Linear Regression in 1D - Prediction

###### Simple linear regression - prediction

```python
import torch
w = torch.tensor(2.0, requires_grad=True)
b = torch.tensor(-1.0, requires_grad=True)
def forward(x):
    y=w*x+b
    return y
```

```python
x=torch.tensor([1.0])
yhat=forward(x)
yhat
>> tensor([1.], grad_fn=<AddBackward0>)
x=torch.tensor([[1.0],[2.0]])
forward(x)  
>> tensor([[1.],
        [3.]], grad_fn=<AddBackward0>)
```

###### PyTorch - Class Linear

```python
from torch.nn import Linear
torch.manual_seed(1)
model = Linear(in_features=1, out_features=1)
list(model.parameters())
>> [Parameter containing:
     tensor([[0.5153]], requires_grad=True),
     Parameter containing:
     tensor([-0.4414], requires_grad=True)]
```

```python
x=torch.tensor([[1.0],[2.0]])
model(x)
>> tensor([[0.0739],
        [0.5891]], grad_fn=<AddmmBackward>)
```

###### PyTorch - Custom Modules

```python
import torch.nn as nn

class LR(nn.Module):
    def __init__(self, in_size, output_size):
        super(LR, self).__init__()
        self.linear = nn.Linear(in_size, output_size)
    def forward(self, x):
        out = self.linear(x)
        return out
```

```python
model = LR(1, 1)
list(model.parameters())
>> [Parameter containing:
     tensor([[-0.9414]], requires_grad=True),
     Parameter containing:
     tensor([0.5997], requires_grad=True)]
```

```python
x=torch.tensor([[1.0],[2.0]])
model(x)
>> tensor([[-0.3417],
        [-1.2832]], grad_fn=<AddmmBackward>)
```

**Model state_dict()** 

this returns a python dictionary. We will use it as our models get more complex. One Function is to map the relationship of the linear layers to its parameters. we can print out the keys and values. 

```python
model.state_dict()
>> OrderedDict([('linear.weight', tensor([[-0.9414]])),
             ('linear.bias', tensor([0.5997]))])
```

###### Ungraded lab

[2.1Prediction1Dregression_v3.ipynb](https://github.com/castorfou/pytorch_tutorial/blob/main/coursera_deep_neural_network/2.1Prediction1Dregression_v3.ipynb)



#### Linear Regression Training



loss function presented is **mean squared error**

 $l(w,b)=\frac{1}{N}\displaystyle\sum_{n=1}^{N}(y_n-(wx_n+b))^2$



#### Gradient Descent and cost

