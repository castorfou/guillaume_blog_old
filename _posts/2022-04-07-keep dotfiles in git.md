---
title: "keep dotfiles in git"
description: as [pointed](https://www.atlassian.com/git/tutorials/dotfiles) by Jeremy Howard 
toc: true
comments: true
layout: post
categories: [git]
image: images/git.png
---

## source of inspiration

as [pointed](https://www.atlassian.com/git/tutorials/dotfiles) by Jeremy Howard.



## How to setup it

#### prerequisites

I consider I already have a git repo with my dotfiles from other machines.

Repo: git@<your_gitlab_address>:<your_id>/dotfiles.git

I keep one separate branch per machine. Current branches: master (empty), and WSL2.

I am going to add a machine called iolab.



#### from iolab

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bash_aliases
```

And we can now run `config status`

```bash
(base) [ 09:53:56 ][ id: ~ ]$ config status
# On branch master
#
# Initial commit
#
nothing to commit (create/copy files and use "git add" to track)
```

but now we would like to create a new branch, and push all this to our central repo.

First we have to set this central repo.

```bash
config remote add origin git@<your_gitlab_address>:<your_id>/dotfiles.git
config fetch
```

Before creating our branch, we have to commit something (to really create our local branch master)

```bash
config add .bashrc
config commit -m 'init with .bashrc'
```

And then only we can create our branch iolab

```bash
config branch iolab
config checkout iolab
config push --set-upstream origin iolab
```

we are now ready to use it



## How to use it

```bash
config add .bash_aliases
config commit -m'bash aliases'
config push
```

