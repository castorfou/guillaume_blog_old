---
title: "Learning: MIT 6.S191 Introduction to Deep Learning - 2021"
description: My notes/thoughts about the lecture
toc: true
comments: true
layout: post
categories: [deep learning, MIT, tensorflow]
image: images/fastpages_posts/actions/actions_logo.png
---



From [http://introtodeeplearning.com/](http://introtodeeplearning.com/)

I keep all content (lectures, notebooks) in [github](https://github.com/castorfou/mit_6s191)

This is done with google contribution, and therefore all examples are in tensorflow. I will try to adapt notebooks in PyTorch.



## 2/5/21 - Intro to Deep Learning - lecture 1

Lecturer: Alexander Amini

Intro is just jaw-dropping!

[2020 intro](https://youtu.be/5tvmMX8r_OM?list=PLtBw6njQRU-rwp5__7C0oIVt26ZgjG9NI&t=40) was top. 

[2021 intro](https://youtu.be/5tvmMX8r_OM?list=PLtBw6njQRU-rwp5__7C0oIVt26ZgjG9NI&t=149) is just awesome. 

It is a standard overview of simple deep learning concepts: Perceptron, multi-perceptron, dense layers, loss, gradient-descent, backprop, SGD, regularization, dropout, early stoppping



## 2/15/21 - Deep Sequence Modeling - lecture 2

New lecturer: Ava Soleimany

Nice introduction to sequence modeling with Many-to-One, One-to-Many, Many-to-Many.

RNN and implementation in TensorFlow. And NLP examples: next word problem. (and NLP concepts such as Vocabulary, Indexing, Embedding)

And what we need for sequence modeling:

* handle variable-length sequences
* track long-term dependencies
* maintain information about order
* share parameters across the sequence

Backpropagation through time and problem of exploding/vanishing gradients.

Against exploding: gradient clipping. Against vanishing: 3 ways explained - activation functions, weight init, network arch.

Gated cell: to control what information is passed through. Ex: LSTM Long Short Term Memory. They support something closed to Forget Store Update Output. Ava explains graphically which part of LSTM cells is providing which function.

And then examples: Music generation (to generate 4th movement of last symphony from Schubert!), sentiment classification, machine translation (with Attention mechanisms which provide learnable memory access to solve Not long memory), trajectory prediction, environmental modeling.



## 2/16/21 - Intro to TensorFlow;  Music Generation - software lab 1



As an exercise I have completed labs in TensorFlow and adapted them in [PyTorch](https://github.com/castorfou/mit_6s191/blob/main/introtodeeplearning/lab1/Part1_TensorFlow_transposed%20to%20PyTorch.ipynb).

With LSTM, I ran into this error: ```UnknownError: Fail to find the dnn implementation. [Op:CudnnRNN]```

Which is solved by calling [`tf.config.experimental.set_memory_growth`](https://www.tensorflow.org/api_docs/python/tf/config/experimental/set_memory_growth). 

```pythonimport tensorflow as tf 
gpus = tf.config.list_physical_devices('GPU')
if gpus:
  try:
    # Currently, memory growth needs to be the same across GPUs
    for gpu in gpus:
      tf.config.experimental.set_memory_growth(gpu, True)
    logical_gpus = tf.config.experimental.list_logical_devices('GPU')
    print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
  except RuntimeError as e:
    # Memory growth must be set before GPUs have been initialized
    print(e)
```

Music lab is nice to play with. I am not sure I would be able to convert to PyTorch. It would require time!