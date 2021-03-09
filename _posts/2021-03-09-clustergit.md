---
title: "Git - How to find all *unpushed* commits for all projects in a directory?"
description: gitcluster - installation and usage
toc: true
comments: true
layout: post
categories: [git]
---

Very basic question to help keep my repo clean.



## Installation

[clustergit](https://github.com/mnagel/clustergit) seems a good candidate

![](https://raw.githubusercontent.com/mnagel/clustergit/master/doc/clustergit.png)



```bash
cd ~/Applications
git clone git@github.com:mnagel/clustergit.git
# add export PATH="$PATH:$HOME/Applications/clustergit" to ~.bashrc
source ~.bashrc
```



## Usage

**clustergit status**

```bash
$ clustergit 
Scanning sub directories of .
./Deep-Reinforcement-Learning-Hands-On  : Changesn .    (1/17)
./Deep_reinforcement_learning_Course    : Changes
./ReinforcementLearning_references      : On branch main, Untracked files
./blog                                  : Untracked files
./d059                                  : On branch main, Changes
./data-scientist-skills                 : Clean
./deeplearning_specialization           : Clean
./fastai                                : Changes
./fastai_experiments                    : Changes
./fastbook                              : Changes
./gan_specialization                    : Clean
./hello_nbdev                           : Clean
./introduction-reinforcement-learning-david-silver: On branch main, Untracked files
./mit_600.2x Introduction to Computational Thinking and Data Science: Clean
./mit_6S191_Intro_to_deep_learning      : On branch main, No Changes
./pytorch_tutorial                      : On branch main, Changes
./squeezebox                            : On branch main, No Changes
Done

```

**clustergit status (detailed)**

```bash
$ clustergit -v
[...]
---------------- ./squeezebox -----------------
running  LC_ALL=C git status
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean

./squeezebox                            : On branch main, No Changes
---------------- ./squeezebox -----------------
Done
```



**clustergit status (less detailed: hide Clean)**

```bash
$ clustergit -H
Scanning sub directories of .
./d059                                  : On branch main, Changes
./fastai                                : Changes
./fastai_experiments                    : Changes
./fastbook                              : Changes
./introduction-reinforcement-learning-david-silver: On branch main, Untracked files
./mit_6S191_Intro_to_deep_learning      : On branch main, No Changes
./pytorch_tutorial                      : On branch main, Changes
./squeezebox                            : On branch main, No Changes
Done
```







**Clean** vs **On branch main, No Changes**

seems related to branch name. If branch is named master, then clean is displayed.



**Git pull, push**

I am not sure I will use it. But allows to recursively launch pull commands to update repos (if no local changes)



## Rename branches from *main* to *master*

[Renaming a branch](https://docs.github.com/en/github/administering-a-repository/renaming-a-branch) from github website.

Rename branch main to master from github website 

![](https://docs.github.com/assets/images/help/branches/branches-link.png)

Update local clones

```bash
git branch -m main master
git fetch origin
git branch -u origin/master master
```



