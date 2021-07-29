---
title: "git clean repo with bfg"
description: gitlab doesn't like >100MB files - removing crazy big files
toc: true
comments: true
layout: post
categories: [git]
image: images/git.png
---



[bfg website](https://rtyley.github.io/bfg-repo-cleaner/)

## General usage

```bash
$ cd ~/Applications/bfg

#we clone and we will work on that one
cd local_clone
cp -R ~/git/d059-vld-ic .
cd d059-vld-ic
git status
```



## Remove big files

no need to create a clone, we can directly work on our repo

```bash
$ cd ~/Applications/bfg
java -jar bfg-1.13.0.jar --strip-blobs-bigger-than 100M ~/git/d059-vld-ic
cd ~/git/d059-vld-ic
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```



Note: if you get a message `Warning : no large blobs matching criteria found in packfiles - does the repo need to be packed?`, you have to launch `git gc`



## Remove forbidden files such as .mp3, .tar.gz

 need to create a clone, we can directly work on our repo

```bash
$ cd ~/Applications/bfg
java -jar bfg-1.13.0.jar --delete-files '*.mp3' --no-blob-protection ~/git/data-scientist-skills
java -jar bfg-1.13.0.jar --delete-files '*.tar.gz' --no-blob-protection ~/git/data-scientist-skills

git reflog expire --expire=now --all && git gc --prune=now --aggressive
```



## Improve .gitignore

see [git ignore large files](/guillaume_blog/blog/git-ignore-large-files.html)