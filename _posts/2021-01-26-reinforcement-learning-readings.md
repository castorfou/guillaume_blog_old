---
title: "Reinforcement learning readings"
description: My notes about some readings
toc: true
comments: true
layout: post
categories: [reinforcement learning]
image: images/fastpages_posts/actions/actions_logo.png
---



## 1/26/21 - Reinforcement learning for real-world robotics

from [https://www.youtube.com/watch?v=Obek04C8L5E&feature=youtu.be](https://www.youtube.com/watch?v=Obek04C8L5E&feature=youtu.be)

at 26' idea that you can tackle over-optimism models by using ensemble models.
See paper at [2018 Model-Ensemble Trust-Region Policy Optimization](https://github.com/castorfou/datascience-papers/blob/main/RL/2018%20Model-Ensemble%20Trust-Region%20Policy%20Optimization/model_ensemble_trust_region_policy_optimization.pdf)



## 1/26/21 - Reinforcement Learning algorithms — an intuitive overview

from [https://medium.com/@SmartLabAI/reinforcement-learning-algorithms-an-intuitive-overview-904e2dff5bbc](https://medium.com/@SmartLabAI/reinforcement-learning-algorithms-an-intuitive-overview-904e2dff5bbc)

![](https://miro.medium.com/max/700/1*BsN4a2N1EDmgG19wWDd9CQ.png)



give an overview of various RL models. Model-based vs model-free.

And papers and codes.

## 1/26/21 - Reinforcement learning, partie 1 : introduction (in French)

There is a reference to an introduction paper:
from Sutton, Richard S., and Andrew G. Barto [« Reinforcement learning : an introduction. » (2011)](https://github.com/castorfou/datascience-papers/blob/main/RL/2015%20Reinforcement%20Learning%20an%20introduction%20-%20Sutton%2C%20Richard%20S.%2C%20and%20Andrew%20G.%20Barto/SuttonBartoIPRLBook2ndEd.pdf). (I have an updated version from 2015)

There is a reference to a blog article [[2] Steeve Huang. “Introduction to Various Reinforcement Learning Algorithms. Part I” (Q-Learning, SARSA, DQN, DDPG)”. (2018)](https://towardsdatascience.com/introduction-to-various-reinforcement-learning-algorithms-i-q-learning-sarsa-dqn-ddpg-72a5e0cb6287)

And the paper for OpenAI Gym [[3] Greg Brockman, Vicki Cheung, Ludwig Pettersson, Jonas Schneider, John Schulman, Jie Tang, Wojciech Zaremba. “OpenAI Gym”. (2016)](https://github.com/castorfou/datascience-papers/blob/main/RL/2016%20OpenAI%20Gym/1606.01540.pdf)

## 1/27/21 - Reinforcement learning : an introduction

as a ref. from Reinforcement learning, partie 1 : introduction (in French)

I like this summary about RL

> Reinforcement learning is a computational approach to understanding and au-
> tomating goal-directed learning and decision-making. It is distinguished from
> other computational approaches by its emphasis on learning by an agent from
> direct interaction with its environment, without relying on exemplary super-
> vision or complete models of the environment. In our opinion, reinforcement
> learning is the first field to seriously address the computational issues that
> arise when learning from interaction with an environment in order to achieve16
> CHAPTER 1. THE REINFORCEMENT LEARNING PROBLEM
> long-term goals.
> Reinforcement learning uses a formal framework defining the interaction
> between a learning agent and its environment in terms of states, actions, and
> rewards. This framework is intended to be a simple way of representing es-
> sential features of the artificial intelligence problem. These features include a
> sense of cause and effect, a sense of uncertainty and nondeterminism, and the
> existence of explicit goals.

There is some history about RL. Bellman equation and dynamic programming are at the beginning of RL.

I read about [HJB equation](http://felix.proba.jussieu.fr/pageperso/pham/Tangente.pdf) from Huyên PHAM (from a French Math magazine). It is funny to see why dynamic programming has been named that way, and how to deal with management.

> The class of methods for solving optimal control problems by
> solving this equation came to be known as dynamic programming (Bellman,
> 1957a). Bellman (1957b) also introduced the discrete stochastic version of the
> optimal control problem known as Markovian decision processes (MDPs), and
> Ronald Howard (1960) devised the policy iteration method for MDPs. All of
> these are essential elements underlying the theory and algorithms of modern
> reinforcement learning.

 All the vocabulary around RL is coming from dynamic programming and MDP. 

[Markov decision process - Wikipedia](https://en.wikipedia.org/wiki/Markov_decision_process)

> A Markov decision process is a 4-[tuple](https://en.wikipedia.org/wiki/Tuple)   ![](https://wikimedia.org/api/rest_v1/media/math/render/svg/b4087b8e195d2e67af8b20e9ed556b697653500c), where
>
> -  ![S](https://wikimedia.org/api/rest_v1/media/math/render/svg/4611d85173cd3b508e67077d4a1252c9c05abca2) is a set of states called the *state space*,
> - ![A](https://wikimedia.org/api/rest_v1/media/math/render/svg/7daff47fa58cdfd29dc333def748ff5fa4c923e3) is a set of actions called the *action space* (alternatively, ![A_s](https://wikimedia.org/api/rest_v1/media/math/render/svg/5cc9b664ef7e1dca131e7f345b4321bd3a07a7d8) is the set of actions available from state ![s](https://wikimedia.org/api/rest_v1/media/math/render/svg/01d131dfd7673938b947072a13a9744fe997e632)),
> -  ![{\displaystyle P_{a}(s,s')=\Pr(s_{t+1}=s'\mid s_{t}=s,a_{t}=a)}](https://wikimedia.org/api/rest_v1/media/math/render/svg/9f46bb2846b8b20a08220507fa105540f34850e7) is the probability that action  ![a](https://wikimedia.org/api/rest_v1/media/math/render/svg/ffd2487510aa438433a2579450ab2b3d557e5edc) in state                       ![s](https://wikimedia.org/api/rest_v1/media/math/render/svg/01d131dfd7673938b947072a13a9744fe997e632) at time     ![t](https://wikimedia.org/api/rest_v1/media/math/render/svg/65658b7b223af9e1acc877d848888ecdb4466560) will lead to state  ![s'](https://wikimedia.org/api/rest_v1/media/math/render/svg/5136680c63706cfd17ceddb4acddbfdd0ba5ef2d) at time    ![t+1](https://wikimedia.org/api/rest_v1/media/math/render/svg/ab2785d8415d6902b0c93efe1419c4bc3ce4643d),
> -  ![{\displaystyle R_{a}(s,s')}](https://wikimedia.org/api/rest_v1/media/math/render/svg/5f842d4a4b1340e194d8014d63163e5e27f94215) is the immediate reward (or expected immediate reward) received after transitioning from state   ![s](https://wikimedia.org/api/rest_v1/media/math/render/svg/01d131dfd7673938b947072a13a9744fe997e632) to state     ![s'](https://wikimedia.org/api/rest_v1/media/math/render/svg/5136680c63706cfd17ceddb4acddbfdd0ba5ef2d), due to action     ![a](https://wikimedia.org/api/rest_v1/media/math/render/svg/ffd2487510aa438433a2579450ab2b3d557e5edc)

