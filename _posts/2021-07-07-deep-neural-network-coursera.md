---
title: "Deep Neural Network - Coursera"
description: From IBM
toc: true
comments: true
layout: post
categories: [pytorch]

---

Coursera website:  [Deep Neural Networks with PyTorch](https://www.coursera.org/learn/deep-neural-networks-with-pytorch/home/welcome)



# Week 1 - Tensor dand Datasets

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



#### Derivative in Pytorch

