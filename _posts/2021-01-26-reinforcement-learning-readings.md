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

>   ![](../../../../images/wikipedia_mdp.png)

Interesting to read that the famous cart pole experiment (learning to balance a pole hinged to a movable cart) came from Michie and Chambers in 1968, 53 years ago! (and derived from tic-tac-toe experiment)

I don' understand the subtlety behind the move from "learning with a teacher" to "learning with a critic" following the modified Least-Mean-Square (LMS) algorithm; Widrow and Hoff (1973)

And some explanations about temporal-difference. I have just understood that a convergence effort happened (in 1989) by Chris Watkin who brought together temporal-difference and optimal control by developing Q-learning.

After this introduction, here is the content:

The first chapter of this part of the book describes solution methods for the special of the reinforcement learning problem in which there is only a **single state**, called bandit problems. The second chapter describes the general problem formulation that we treat throughout the rest of the book—**finite markov decision processes**—and its main ideas including Bellman equations and value functions.

The next three chapters describe three fundamental classes of methods for **solving finite Markov decision problems: dynamic programming, Monte Carlo methods, and temporal-difference learning**. Each class of methods has its strengths and weaknesses. **Dynamic programming** methods are well developed mathematically, but require a complete and accurate model of the environment. **Monte Carlo** methods don’t require a model and are conceptually simple, but are not suited for step-by-step incremental computation. Finally, **temporal-difference** methods require no model and are fully incremental, but are more complex to analyze. The methods also differ in several ways with respect to their efficiency and speed of convergence.

The remaining two chapters describe how these three classes of methods can be combined to obtain the best features of each of them. In one chapter we describe how the strengths of Monte Carlo methods can be combined with the strengths of temporal-difference methods via the use of eligibility traces. In the final chapter of this part of the book we show these two learning methods can be combined with model learning and planning methods (such as dynamic programming) for a **complete and unified solution to the tabular reinforcement learning problem**.



