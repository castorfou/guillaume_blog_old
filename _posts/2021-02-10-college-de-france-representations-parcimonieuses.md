---
title: "Learning: Collège de France - Représentations parcimonieuses"
description: My notes/thoughts about the lecture in French
toc: true
comments: true
layout: post
categories: [deep learning, math]
image: images/fastpages_posts/actions/actions_logo.png
---

Un cours au collège de France de Stéphane Mallat sur les [représentations parcimonieuses - 2021](https://www.college-de-france.fr/site/stephane-mallat/course-2020-2021.htm).



Cela donne envie d'aller voir ses autres cours:

* 2018: L'apprentissage face à la malédiction de la grande dimension
* 2019: L'apprentissage par réseaux de neurones profonds
* 2020: Modèles multi-échelles et réseaux de neurones convolutifs

A peu près 16 vidéos de 1h30 par cours. Et des notes de cours en pdf.



## 2/10/21 - Approximations linéaires et analyse de Fourier (lecture 2)

J'ai commencé par ce cours conseillé par Rémi mon pote enseignant chercheur en math. C'est un peu le grand écart avec des méthodes d'enseignement anglo-saxonnes mais ça fait du bien. C'est finalement plus proche de ce que j'ai connu dans ma formation initiale.



S.Mallat présente les équivalences (sous certaines conditions) entre 

* Régularité
* Approximation en basse dimension
* et représentation parcimonieuse

dans le cadre des approximations linéaires. Il parle des 2 mondes: traitement du signal et analyse de la donnée. Je suis moins intéressé par le 1er monde, mais j'apprécie la piqure de rappel. Je ne me rappelais pas du tout l'importance de l'analyse de Fourier et la construction des bases de L[0,1] par exemple.

Et il revient sur les singularités, beaucoup d'informations sont portées par les singularités (par exemple les frontières dans une image)

Je crois bien que je vais me faire toute la session, et sans doute les autres années.



## 2/15/21 - Le triangle « Régularité, Approximation, Parcimonie » (lecture 1)

C'est l'introduction du cours. J'apprécie les références historiques et philosphiques partant du rasoir d'Ockam. C'est le principe d'économie ou de parcimonie: le beau, le vrai viendrait du simple.

La 1ere fois que j'entends une référence précise sur l'opposition entre biais (erreur sur modèle) et variance (erreur sur données ou mesures)

Et une invitation à consulter une [méthodologie d'analyse de données](https://www.college-de-france.fr/site/stephane-mallat/seminar-2018-02-21-11h15.htm) par Pierre Courtiol en utilisant Kaggle. L'idée d'une approche simple linéaaire pour bien comprendre quelles étapes successives à emprunter pour améliorer son approche. Me semble assez orthogonal à ce que peut proposer Jeremy Howard: commencer tôt, overfitting n'est pas un probleme, pas de early stopping, etc.

