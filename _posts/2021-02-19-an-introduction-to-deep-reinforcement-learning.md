---
title: "Practicing: Deep Reinforcement Learning Course by Thomas Simonini"
description: A Free course in Deep Reinforcement Learning from beginner to expert.
toc: true
comments: true
layout: post
categories: [reinforcement learning]
image: images/fastpages_posts/actions/actions_logo.png
---

A course by [Thomas Simonini](https://www.simoninithomas.com/)

[Syllabus (from 2018)](https://simoninithomas.github.io/Deep_reinforcement_learning_Course/) 

[kind of syllabus (from 2020)](https://medium.com/deep-reinforcement-learning-course/launching-deep-reinforcement-learning-course-v2-0-38fa3c24bcbc)

Everything available in [github](https://github.com/simoninithomas/Deep_reinforcement_learning_Course)

I appreciate the effort to update examples, and some 2018 implementations became obsolete. Historical Atari VC2600 games are now Starcraft 2 or minecraft, and news series on building AI for video games in Unity and Unreal Engine..



## (2/19/21) - Step 1 - An Introduction to Deep Reinforcement Learning?

Previous version from [2018: What is Deep Reinforcement Learning?](https://medium.freecodecamp.org/an-introduction-to-reinforcement-learning-4339519de419) is quite interesting. With 3 parts:

- What Reinforcement Learning is, and how rewards are the central idea
- The three approaches of Reinforcement Learning
- What the “Deep” in Deep Reinforcement Learning means

![](https://cdn-media-1.freecodecamp.org/images/1*aKYFRoEmmKkybqJOvLt2JQ.png)



Rewards, long-term future reward, discount rate.

![](https://cdn-media-1.freecodecamp.org/images/1*zrzRTXt8rtWF5fX__kZ-yQ.png)

Episodic (starting and ending point) vs Continuous (e.g. stock trading) tasks.

Way of learning: Monte Carlo (MC: rewards collected at the end of an episode) vs Temporal Difference (TD: estimate rewards at each step)

![](https://cdn-media-1.freecodecamp.org/images/1*LLfj11fivpkKZkwQ8uPi3A.png)

Exploration/Exploitation trade off. Will see later different ways to handle that trade-off.

![](https://cdn-media-1.freecodecamp.org/images/1*APLmZ8CVgu0oY3sQBVYIuw.png)



### Three approaches to Reinforcement Learning

These are value-based, policy-based, and model-based.

#### Value Based

In value-based RL, the goal is to optimize the value function *V(s)*.

The value function is a function that tells us the maximum expected future reward the agent will get at each state.

![](https://cdn-media-1.freecodecamp.org/images/1*2_JRk-4O523bcOcSy1u31g.png)

#### Policy Based

In policy-based RL, we want to directly optimize the policy function *π(s)* without using a value function.

The policy is what defines the agent behavior at a given time.

We have two types of policy:

- Deterministic: a policy at a given state will always return the same action.
- Stochastic: output a distribution probability over actions.

![](https://cdn-media-1.freecodecamp.org/images/1*fii7Z01laRGateAJDvloAQ.png)

#### Model Based

In model-based RL, we model the environment. This means we create a model of the behavior of the environment. Not addressed in this course.

### Deep Reinforcement Learning

In Q-learning, we keep a table of actions to take for each state (based on reward). This can be huge.

Deep Learning allows to approximate this Q function.

![](https://cdn-media-1.freecodecamp.org/images/1*w5GuxedZ9ivRYqM_MLUxOQ.png)



[Updated version](https://thomassimonini.medium.com/an-introduction-to-deep-reinforcement-learning-17a565999c0c) from 2020 (and [video](https://www.youtube.com/watch?v=q0BiUn5LiBc) version)

This is a good starting point, well explained.

Reinforcement Learning is just a **computational approach of learning from action.**

**A formal definition**

> Reinforcement learning is a framework for solving control tasks (also called decision problems) by building agents that **learn from the environment** by **interacting with it** through trial and error and **receiving rewards** (positive or negative) **as unique feedback.**

Some explanations about **observations** (partial description) vs **states** (fully observed envt). Only differs in implementation, all theoretical background stays the same.

Action space where we can distinguish **discrete** (e.g. fire, up) actions from **continuous** (e.g. turn 23deg) ones.

**Reward** part is the same as the one from 2018. With cheese, mouse, maze example.