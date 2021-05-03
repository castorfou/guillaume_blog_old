---
title: "Reinforcement Learning Specialization - Coursera"
description: From University of Alberta. My notes
toc: true
comments: true
layout: post
categories: [reinforcement learning, deepmind]
image: images/RL.png
---



[Syllabus](https://www.coursera.org/specializations/reinforcement-learning)

4 courses on 16 weeks

* [Fundamentals of Reinforcement Learning](https://www.coursera.org/learn/fundamentals-of-reinforcement-learning?specialization=reinforcement-learning)

* [Sample-based Learning Methods](https://www.coursera.org/learn/sample-based-learning-methods?specialization=reinforcement-learning)

* [Prediction and Control with Function Approximation](https://www.coursera.org/learn/prediction-control-function-approximation?specialization=reinforcement-learning)

* [A Complete Reinforcement Learning System (Capstone)](https://www.coursera.org/learn/complete-reinforcement-learning-system?specialization=reinforcement-learning)



Alberta is in Canada.



## 5/3/21 - Fundamentals of Reinforcement Learning

I have set recommended goals 3 times a week.



###### week 1 - Sequential Decision Making with Evaluative Feedback



**Course introduction**



**about supervised learning, unsupervised learning and RL**

You might wonder what's the difference between supervised learning, unsupervised learning, and reinforcement learning? The differences are quite simple. In supervised learning we assume the learner has access to labeled examples giving the correct answer. In RL, the reward gives the agent some idea of how good or bad its recent actions were. You can think of supervised learning as requiring a teacher that helps you by telling you the correct answer. A reward on the other hand, is like having someone who can identify what good behavior looks like but can't tell you exactly how to do it. Unsupervised learning sounds like it could be related but really has a very different goal. Unsupervised learning is about extracting underlying structure in data. It's about the data representation. It can be used to construct representations that make a supervised or RL system better. In fact, as you'll see later in this course, techniques from both supervised learning and unsupervised learning can be used within RL to aid generalization



**industrial control**

So I think the place we're really going to see it take off is an industrial control. In industrial control, we have experts that are really looking for ways to improve the optimal- how well their systems work. So we're going to see it do things like reduce energy costs or save on other types of costs that we have in these industrial control systems. In the hands of experts, we can really make these algorithms work well in the near future. So I really see it as a tool that's going to facilitate experts in their work rather than say, doing something like replacing people or automating them away. 



**specialization roadmap**

**course 1** - we begin our study with multi-arm bandit problems. Here, we get our first taste of the complexities of **incremental learning**, **exploration**, and **exploitation**. After that, we move onto **Markov decision processes** to broaden the class of problems we can solve with reinforcement learning methods. Here we will learn about **balancing short-term and long-term reward**. We will introduce key ideas like **policies** and **value functions** using almost all RL systems. We conclude Course 1 with classic planning methods called **dynamic programming**. These methods have been used in large industrial control problems and can compute optimal policies given a complete model of the world. 

**course 2** - In Course 2, we built on these ideas and design algorithms for learning **without a model** of the world. We study three classes of methods designed for learning from trial and error interaction. We start with **Monte Carlo** methods and then move on to **temporal difference** learning, including Q learning. We conclude Course 2 with an investigation of methods for **planning** with learned models. 

**course 3** - In Course 3, we leave the relative comfort of small finite MDPs and investigate RL with **function approximation**. Here we will see that the main concepts from Courses 1 and 2 transferred to problems with larger **infinite state spaces**. We will cover **feature construction**, **neural network learning**, **policy gradient methods**, and other particularities of the function approximation setting. 

**course 4** - The final course in this specialization brings everything together in a Capstone project. Throughout this specialization, as in Rich and Andy's book, we stress a rigorous and scientific approach to RL. We conduct numerous experiments designed to carefully compare algorithms. It takes careful planning and a lot of hard work to produce a meaningful empirical results. In the Capstone, we will walk you through each step of this process so that you can conduct your own scientific experiment. We will explore all the stages from problem specification, all the way to publication quality plots. This is not just academic. In real problems, it's important to verify and understand your system. After that, you should be ready to test your own new ideas or tackle a new exciting application of RL in your job. We hope you enjoyed the show half as much as we enjoyed making it for you. 



**Reinforcement Learning Textbook**

as always, **Reinforcement Learning: An introduction (Second Edition) by Richard S. Sutton and Andrew G. Barto** is THE reference. I didn't know that Adam White was student from Sutton. Lucky guy ;)



**K-armed Bandit problem**

![](https://miro.medium.com/max/640/1*Ahv2hWGCZiwTDQX5TIiUjw.jpeg)

Starts with reading of RLbook p25-36 (Chapter 2 Multi-armed Bandits)

[Evaluative](http://incompleteideas.net/book/first/ebook/node14.html) vs instructive feedback. Nonassociative refers to cases where you take one action per state. At the end there is a generalization where bandit problem becomes associative, that is, when actions are taken in more than one situation.

It is a stationary case meaning that value of actions are fixed during experiences. If the bandit task were nonstationary, that is, the true values of the actions changed over time. In this case exploration is needed even in the deterministic case to make sure one of the nongreedy actions has not changed to become better than the greedy one.

sample-average action-value estimates
$$
\begin{align}
Q_t(a) &= \frac{\text{sum of rewards when } \mathit{a} \text{ taken prior to }\mathit{t}}{\text{number of times } \mathit{a} \text{ taken prior to }\mathit{t}} \\
& = \frac{\displaystyle\sum_{i=1}^{t-1} R_i.\mathcal{1}_{A_i=a}}{\displaystyle\sum_{i=1}^{t-1} \mathcal{1}_{A_i=a}}
\end{align}
$$


$\epsilon$-greedy action selection

$$
A_t=\underset{a}{\mathrm{argmax}}{\text{ }Q_t(a)}
$$
With nonstationary problem, we want to give more weights to recent rewars. It can be done with
$$
Q_{n+1}=Q_n+\alpha[R_n-Q_n]
$$
Where $$\alpha$$ is a constant step-size parameter, $$\alpha \in [0,1]$$. So it can be written that way
$$
Q_{n+1}=(1-\alpha)^nQ_1+\displaystyle\sum_{i=1}^{n} \alpha(1-\alpha)^{n-i}R_i
$$
weighted average because the sum of the weights is 1.

2 other topics are discussed: optimistic initial values (that can push exploration in 1st steps) and upper-confidence-bound (UCB) action selection. With optimistic initial values the idea is too have high initial value for reward so that the 1st actions are disappointing pushing for explorations. With UCB 
$$
A_t= \underset{a} {\mathrm{argmax}} {\text{ }\bigg[Q_t(a)+c\sqrt{\frac{\ln t}{N_t(a)}}\bigg]}
$$

> The idea of this upper confidence bound (UCB) action selection is that the square-root term is a measure of the uncertainty or variance in the estimate of a’s value. The quantity being max’ed over is thus a sort of upper bound on the possible true value of action a, with c determining the confidence level. Each time a is selected the uncertainty is presumably reduced: N t (a) increments, and, as it appears in the denominator, the uncertainty term decreases. On the other hand, each time an action other than a is selected, t increases but N t (a) does not; because t appears in the numerator, the uncertainty estimate increases. The use of the natural logarithm means that the increases get smaller over time, but are unbounded; all actions will eventually be selected, but actions with lower value estimates, or that have already been selected frequently, will be selected with decreasing frequency over time.

