---
title: "Practicing: Deep Reinforcement Learning Course by Thomas Simonini"
description: A Free course in Deep Reinforcement Learning from beginner to expert. My notes
toc: true
comments: true
layout: post
categories: [reinforcement learning]
image: images/RL.png
---

A course by [Thomas Simonini](https://www.simoninithomas.com/)

[Syllabus (from 2018)](https://simoninithomas.github.io/Deep_reinforcement_learning_Course/) 

[Course introduction (from 2020)](https://medium.com/deep-reinforcement-learning-course/launching-deep-reinforcement-learning-course-v2-0-38fa3c24bcbc) 

Everything available in [github](https://github.com/simoninithomas/Deep_reinforcement_learning_Course)

I appreciate the effort to update examples, and some 2018 implementations became obsolete. Historical Atari VC2600 games are now Starcraft 2 or minecraft, and news series on building AI for video games in Unity and Unreal Engine..



## (2/19/21) - [Step 1](https://thomassimonini.medium.com/an-introduction-to-deep-reinforcement-learning-17a565999c0c) - An Introduction to Deep Reinforcement Learning?

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

**Episodic** and **continuous** tasks part is the same as the one from 2018.

**Exploration/Exploitation trade-off** is explained the same way + an additional example taken from [berkley - CS 294-112](http://rail.eecs.berkeley.edu/deeprlcourse-fa18/) - Deep Reinforcement Learning course. I want to learn more about this course!

About **solving RL problems**, it is now presented as 2 main approaches:

* **policy-based** methods
* **value-based** methods

![](https://miro.medium.com/max/700/1*Vujmmyswrg2wIjmpvSUBfg.png)

And bedore to explain that, nice presentation of what is a **policy $\pi$**. Solving RL problem is to find that optimal policy: directly with policy-based method, indirectly (through value function) with value-based method.

There is an explanation about different types of policy: **deterministic** and **stochastic**.

And that we use deep neural networks to estimate the action to take (policy based) or to estimate the value of a state (value based). Thomas suggests to go further with deep learning with MIT 6.S191, which is the [one](https://castorfou.github.io/guillaume_blog/deep%20learning/mit/tensorflow/2021/02/05/learning-MIT-6.S191-2021.html) (version 2021) I follow these days.



## (2/19/21) - [Step 2 - part 1](https://thomassimonini.medium.com/q-learning-lets-create-an-autonomous-taxi-part-1-2-3e8f5e764358) - Q-Learning, let’s create an autonomous Taxi

And in [video](https://www.youtube.com/watch?v=230bR2DrbdE&feature=emb_logo) (I like to read + watch the video at the same time)

Here in Step 2 we focus on a value-based method: Q-learning. And what is seen in part 1 and 2:

![](https://miro.medium.com/max/700/1*2yYWVAXJh4FI2lpsL0ajwQ.png)



#### Value-based method

Remember what we mean in value-based method

![](https://miro.medium.com/max/700/1*jfUUaZuHUa1h61oD6O18KA.png)

you don't train your policy, you define a simple function such as greedy function to select the best association State-Action, so the best action.

#### **Bellman equation**

each value as the sum of the expected return, **which is a long process.** This is equivalent **to the sum of immediate reward + the discounted value of the state that follows.**

![](https://miro.medium.com/max/700/1*FMjoVEELvz0oKcIfmcvGPQ.png)



#### Monte Carlo vs Temporal Difference

And then an explanation about 2 types of method to learn a policy or a value-function: 

- *Monte Carlo*: learning at the end of the episode. With *Monte Carlo*, we update the value function from a complete episode and so we **use the actual accurate discounted return of this episode.**
- *TD learning*: learning at each step. With *TD learning*, we update the value function from a step, so we replace Gt that we don’t have with **an estimated return called TD target.** (chich is the immediate reward + the discounted value of the next state)

![](https://miro.medium.com/max/700/1*c8nfnXRu8n1h78bWPEK5vg.png)

It was not clear to me that these methods could be used for policy-based approach. It is now!



## (2/24/21) - [Step 2 - part 2](https://thomassimonini.medium.com/q-learning-lets-create-an-autonomous-taxi-part-2-2-8cbafa19d7f5) - Q-Learning, let’s create an autonomous Taxi

But the video is not yet available.

**What is Q-Learning?**

Q-Learning is an **off-policy value-based method that uses a TD approach to train its action-value function:**

- *“Off-policy”*: we’ll talk about that at the end of this chapter.
- *“Value-based method”*: it means that it finds its optimal policy indirectly by training a  value-function or action-value function that will tell us what’s **the value of each state or each state-action pair.**
- *“Uses a TD approach”*: **updates its action-value function at each step.**

Q stands for quality (quality of action). After training we'll get the optimal Q-function.

When choosing an action, we have to balance between exploration and exploitation with $$\epsilon$$ - greedy:

![](https://miro.medium.com/max/700/1*AYz65tJDERsWTg2DGEJ35g.png)

But at beginning Q table is not trained yet so we have to increase exploitation. It is done with some decreasing $$\epsilon$$.

![](https://miro.medium.com/max/700/1*1J2lJN48gdjeuoRBqsO_CA.png)



The Q-learning algorithm is a 4-step process:

* step1: Q-Table init
* step2: Choose action ($$\epsilon$$ - greedy strategy)
* step3: Perform action A<sub>t</sub> and get R<sub>t+1</sub> and S<sub>t+1</sub>
* step4: Update Q(S<sub>t</sub>, A<sub>t</sub>)

![Update Q(S<sub>t</sub>, A<sub>t</sub>)](https://miro.medium.com/max/700/1*teZ5KRfvYjMKZnmhaWTUXg.png)

Why it is called **off-policy**? Because we don't have the same logic to select action ($$\epsilon$$ - greedy) and update Q (greedy).

With *On-policy:* we use the **same policy for acting and updating.** Sarsa is such an algorithm.

![](https://miro.medium.com/max/700/1*gVl6V-wbX_hOoNQATx081Q.png)

Nice and simple manual example with mouse, cheese in a maze. We run Q-learning and make all calculation by hands.

![](https://miro.medium.com/max/500/1*GMuThIF7aNj-V_d6hTRN8A.png)

<todo> </todo>

<div class="alert alert-info">implement with numpy+gym this algorithm should be a nice exercise.</div>

There is an exercise to implement a taxi, within this [notebook](https://colab.research.google.com/gist/simoninithomas/466c81aa1c2a07dd14793240c6d033c5/q-learning-with-taxi-v3.ipynb#scrollTo=20tSdDbxxK_H) at colab google. Taxi V3 is an env from opengym.

## (3/3/21) - back to 2018 - Deep Q-learning with Doom

[Article](https://medium.freecodecamp.org/an-introduction-to-deep-q-learning-lets-play-doom-54d02d8017d8), [Notebook](https://github.com/simoninithomas/Deep_reinforcement_learning_Course/blob/master/Deep%20Q%20Learning/Doom/Deep%20Q%20learning%20with%20Doom.ipynb), [Video](https://youtu.be/gCJyVX98KJ4)

We’ll create an agent that learns to play Doom. Doom is a big  environment with a gigantic state space (millions of different states).  Creating and updating a Q-table for that environment would not be  efficient at all.

The best idea in this case is to create a [neural network](http://neuralnetworksanddeeplearning.com/) that will approximate, given a state, the different Q-values for each action.

![](https://cdn-media-1.freecodecamp.org/images/1*w5GuxedZ9ivRYqM_MLUxOQ.png)

![](https://cdn-media-1.freecodecamp.org/images/1*LglEewHrVsuEGpBun8_KTg.png)

Addresses pb of temporal limitation: get multiple frames to have sense of motion.

Video is nice because it goes from start and follows closely all steps.

I wil try to implement in my own by creating an environment and running under a clone of Deep_reinforcement_learning_Course [Thomas's repo](https://github.com/simoninithomas/Deep_reinforcement_learning_Course)

Here at [Deep Q learning with Doom.ipynb](https://github.com/castorfou/Deep_reinforcement_learning_Course/blob/master/Deep%20Q%20Learning/Doom/Deep%20Q%20learning%20with%20Doom.ipynb)

I had to switch to tensorflow-gpu 1.13. Manage some cuda memory issue. But then was able to run it.

However as Thomas says, I should do it step by step on my own.

## (3/10/21) - Chapter 4: Improvements in Deep Q Learning V1

[Article](https://medium.freecodecamp.org/improvements-in-deep-q-learning-dueling-double-dqn-prioritized-experience-replay-and-fixed-58b130cc5682), [Notebook](https://github.com/simoninithomas/Deep_reinforcement_learning_Course/blob/master/Dueling%20Double%20DQN%20with%20PER%20and%20fixed-q%20targets/Dueling%20Deep%20Q%20Learning%20with%20Doom%20(%2B%20double%20DQNs%20and%20Prioritized%20Experience%20Replay).ipynb), [Video](https://www.youtube.com/watch?v=-Ynjw0Vl3i4&feature=emb_title)

four strategies that improve — dramatically — the training and the results of our DQN agents:

- fixed Q-targets
- double DQNs
- dueling DQN (aka DDQN)
- Prioritized Experience Replay (aka PER)

**fixed Q-targets** to avoid chasing a moving target

- Using a separate network with a fixed parameter (let’s call it w-) for estimating the TD target.
- At every $$\Tau$$ step, we copy the parameters from our DQN network to update the target network.

![](https://cdn-media-1.freecodecamp.org/images/1*D9i0I2EO7LKL2aAb2HLfTg.png)

[Improvements in Deep Q Learning: Dueling Double DQN, Prioritized Experience Replay, and fixed…](https://www.freecodecamp.org/news/improvements-in-deep-q-learning-dueling-double-dqn-prioritized-experience-replay-and-fixed-58b130cc5682/)

*Implementation*

Implementing fixed q-targets is pretty straightforward:

-   First, we create two networks (`DQNetwork`, `TargetNetwork`)

-   Then, we create a function that will take our `DQNetwork` parameters and copy them to our `TargetNetwork`

-   Finally, during the training, we calculate the TD target using our target network. We update the target network with the `DQNetwork` every $$\Tau$$ step ($$\Tau$$ is an hyper-parameter that we define).

**double DQNs** to handle overestimating of Q-values (at the beginning of training, taking the maximum q value (which is noisy) as the best action to take can lead to false positives)

we move from this TD target logic

![](https://cdn-media-1.freecodecamp.org/images/1*KsQ46R8zyTQlKGv91xi6ww.png)

to the use of 2 networks

- use our DQN network to select what is the best action to take for the next state (the action with the highest Q value).
- use our target network to calculate the target Q value of taking that action at the next state.

![](https://cdn-media-1.freecodecamp.org/images/1*g5l4q162gDRZAAsFWtX7Nw.png)



*Implementation*

![](https://cdn-media-1.freecodecamp.org/images/1*oyGR6gJ4WyqeKOfq0Cd8iQ.png)



**Dueling DQN (aka DDQN)**

based on this paper [Dueling Network Architectures for Deep Reinforcement Learning](https://arxiv.org/pdf/1511.06581.pdf).

With DDQN, we want to separate the estimator of these two elements, using two new streams:

- one that estimates the **state value V(s)**
- one that estimates the **advantage for each action A(s,a)**

![](https://cdn-media-1.freecodecamp.org/images/1*FkHqwA2eSGixdS-3dvVoMA.png)



and this can be combined with **Prioritized experience replay**.

This is nicely explained in this [article](https://jaromiru.com/2016/11/07/lets-make-a-dqn-double-learning-and-prioritized-experience-replay/). DDQN explanation is clearer than Thomas'.

The key here is to deal efficiently with experiences. When treating all samples the same,  we are not using the fact that we can learn more from some transitions than from others. Prioritized Experience Replay (PER) is one strategy that tries to leverage this fact by changing the sampling distribution.

I guess there are several options to manage this prioritization (we would prefer transitions that do not fit well to our current estimate of Q function). And a key aspect is the performance of this selection. One implementation is SumTree.

I have to see full implementation in the notebook to fully understand the logic.





