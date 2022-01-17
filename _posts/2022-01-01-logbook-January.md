---
title: "Logbook for January 22"
description: 
toc: true
comments: true
layout: post
categories: [logbook]
image: images/logbook.jpg
---



## Week 1 - January 22

**Monday 1/3**

Will try to use [Zotero](https://www.zotero.org) for managing research papers. Can sync between PC. Seems helpful. My [lib](https://www.zotero.org/guillaumeramelet/library)

**Tuesday 1/4**

Git revert a file to a previous commit

```bash
git log 00\ -\ my_lib.ipynb
git checkout f97406b026bfdf529d2dc4de96224bdfbaa576a8 00\ -\ my_lib.ipynb
```

## Week 2 - January 22

**Monday 1/17**

To update fastai from an existing envt under windows

```bash
conda update -n base -c defaults conda (from base)
conda update fastai -c fastai -c pytorch -c conda-forge -c nvidia (from fastai)
```

To install [mamba](https://github.com/mamba-org/mamba) under WSL2

```bash
conda install mamba -n base -c conda-forge (from base)
```

