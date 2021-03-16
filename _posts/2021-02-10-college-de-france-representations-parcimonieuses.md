---
title: "Learning: Collège de France - Représentations parcimonieuses"
description: My notes/thoughts about the lecture in French
toc: true
comments: true
layout: post
categories: [deep learning, math]
image: images/math.jpeg
---

Un exposé en 8 cours au collège de France de Stéphane Mallat sur les [représentations parcimonieuses - 2021](https://www.college-de-france.fr/site/stephane-mallat/course-2020-2021.htm).



Cela donne envie d'aller voir ses autres cours:

* [2018](https://www.college-de-france.fr/site/stephane-mallat/course-2017-2018.htm): L'apprentissage face à la malédiction de la grande dimension
* [2019](https://www.college-de-france.fr/site/stephane-mallat/course-2018-2019.htm): L'apprentissage par réseaux de neurones profonds
* [2020](https://www.college-de-france.fr/site/stephane-mallat/course-2019-2020.htm): Modèles multi-échelles et réseaux de neurones convolutifs

A peu près 16 vidéos de 1h30 par cours. Et des notes de cours en pdf.



## 2/15/21 - Le triangle « Régularité, Approximation, Parcimonie » (lecture 1)

C'est l'introduction du cours. J'apprécie les références historiques et philosphiques partant du rasoir d'Ockam. C'est le principe d'économie ou de parcimonie: le beau, le vrai viendrait du simple.

La 1ere fois que j'entends une référence précise sur l'opposition entre biais (erreur sur modèle) et variance (erreur sur données ou mesures)

Et une invitation à consulter une [méthodologie d'analyse de données](https://www.college-de-france.fr/site/stephane-mallat/seminar-2018-02-21-11h15.htm) par Pierre Courtiol en utilisant Kaggle. L'idée d'une approche simple linéaire pour bien comprendre quelles étapes successives à emprunter pour améliorer son approche. Me semble assez orthogonal à ce que peut proposer Jeremy Howard: commencer tôt, overfitting n'est pas un probleme, pas de early stopping, etc.



## 2/10/21 - Approximations linéaires et analyse de Fourier (lecture 2)

J'ai commencé par ce cours conseillé par Rémi mon pote enseignant chercheur en math. C'est un peu le grand écart avec des méthodes d'enseignement anglo-saxonnes mais ça fait du bien. C'est finalement plus proche de ce que j'ai connu dans ma formation initiale.



S.Mallat présente les équivalences (sous certaines conditions) entre 

* Régularité
* Approximation en basse dimension
* et représentation parcimonieuse

dans le cadre des approximations linéaires. Il parle des 2 mondes: traitement du signal et analyse de la donnée. Je suis moins intéressé par le 1er monde, mais j'apprécie la piqure de rappel. Je ne me rappelais pas du tout l'importance de l'analyse de Fourier et la construction des bases de L[0,1] par exemple.

Et il revient sur les singularités, beaucoup d'informations sont portées par les singularités (par exemple les frontières dans une image)

Je crois bien que je vais me faire toute la session, et sans doute les autres années.



## 2/23/21 - Grande dimension et composantes principales (lecture 3)

Dans ce cadre linéaire grande dimension, quelle meilleure base - approche PCA et base Karhunen-Loeve.

Quid quand on passe en non linéaire.

Réseau neurone à 1 couche cachée, théoreme de representation universel.

Retour sur les bases de L²[0,1] qui sont les bases de Fourier en variables complexes. 

Pour un passage en dimension q, on remplace n par (n1, ..., nq) et la multiplication n*u par le produit scalaire <n, u>.

En travaillant sur les équivalences du triangle, il montre pourquoi on est très limité en approximation lineaire quand la dimension augmente.

En approximation lineaire, il suffit de prendre les 1ers vecteurs (se limiter à une dimension q) (en base de fourier par exemple) pour avoir une assez bonne approximation. Dans des signaux plus perturbés (avec des singularités) on perd plus d'énergie: il faudrait échantilloner plus fin dans ces zones de singularités et si on dispose d'une base orthonormée il s'agirait non plus de prendre les q 1ers vecteurs mais de prendre ceux d'intéret.



## 3/2/21 - Approximations non linéaires et réseaux de neurones (lecture 4)

Le triangle (approximation basse dimensions, représentation parcimonieuse, régularité) d'un point de vue non linéaire.

Ici plutôt qu'approximer un signal en prenant les M 1ers coefficients de Fourier (basses dimensions), on va prendre M coefficients mais dépendamment de x. C'est ici qu'on introduit la non-linéarité. L'erreur est alors la queue de distribution des coefficients ordonnés. On veut que l'énergie des plus petits coefficients soit négligeable.

Pas facile d'obtenir cet ordre, on cherche une façon de limiter les coefficients non ordonnés nous donnant une représentation parcimonieuse. En utilisant la nome l<sub>$\alpha$</sub> avec $$\alpha$$ petit (inférieur à 2 et proche de 0), on introduit cette décroissance mais cette fois-ci sur les coefficients non ordonnés.

Intéressant d'avoir des normes convexes, et dans ce cas on ne peut prendre que $$\alpha$$=1. C'est pour ça qu'on voit apparaître partout les normes l<sub>1</sub> dans les algorithmes d'apprentissage (norme convexe garantissant une forme de sparsité).

On passe aux réseaux de neurones à 1 couche cachée. Et on va basculer dans les notations de x(u) à f(x)., avec x $$\epsilon$$ [0, 1]<sup>d</sup>.

![](../images/rep_par_lecture4.png)

Ici on projette f dans l'espace engendré par ces vecteurs { $$\rho$$(x.w<sub>m</sub>+b<sub>m</sub>) }<sub>n<=M</sub>.

On peut facilement calculer l'erreur quadratique comme l'intégrale sur les x $$\epsilon$$ [0, 1]<sup>d</sup> de la norme l² ( f(x)-f<sub>tilde</sub>(x) ) et il y a un belle démonstration qui est le **théorème d'approximation universelle** (démontrée entre 1988 et 1992) qui montre que l'erreur tend vers 0 quand M tend vers l'infini.

La démonstration avec $$\rho$$ = e<sup>ia</sup> revient à une décomposition d'en Fourier. Et pour d'autres non régularité comme reLu ou sigmoid, il s'agit d'un changement de base.

Et là on arrive à la malédiction de la dimensionnalité car quand d est grand (disons 1M), les coefficients baissent à une faible vitesse. Que faut-il faire pour battre cette malédiction?

Baron en 1993 introduit une hypothèse de regularité qui permet de borner l'erreur par un terme qui ne dépend pas de la dimension. C'est donc gagné sauf que l'hypothèse de régularité n'est généralement pas valide dans les cas qui nous intéressent.

Stéphane Mallat, de façon brillante mais est-ce étonnant, explique pourquoi l'approche des mathématiciens est une impasse et pourquoi ce qu'on cherche à faire se ramène à un problème bayésien. Car les problèmes qui nous intéressent (par exemple la classification d'objets, ne va solliciter qu'un minuscule espace (même si de grande dimension) parmi toutes les images possibles). On va donc chercher à caractériser x pour chaque y (classe). (revoir vidéo entre 49' et 1h03) 

L'enjeu est de caractériser le support qui est beaucoup plus concentré que [0,1]<sup>d</sup>.

Donc on va retravailler sur les approximations non linéaires de x, le signal lui-même (et non plus f), et d'essayer de comprendre pourquoi on peut faire beaucoup mieux que la transformée de Fourier et quelle genre de bases vont nous permettre de faire bcp mieux. Une des applications va être la compression, qui va nous amener à étudier la théorie de l'information et la théorie de l'information c'est exactement la théorie probabiliste qui explique ces phénomènes de concentration et les mesure avec l'entropie.

Introduction des bases d'ondelettes qui vont permettre de représenter les singularités locales. Les ondelettes sont à la fois localisées (paramètre v) et dilatées (paramètre s). Il faudra à partir de ces ondelettes construire des bases orthogonales pour arriver à des approximations basses dimensions (et garder les grands coefficients)

On introduit la notion de régularité locale exprimée avec lipchitz $$\alpha$$. Avec $$\alpha$$ <1 pour exprimer les singularités. 



## 3/9/21 - Ondelettes et échantillonnage (lecture 5)

On était resté sur une représentation de signaux qui ne présentent pas de régularité uniforme mais qui présentent des singularités que nous voulons capter, ces singularités étant porteuses d'informations importantes (par exemple les contours dans une image). Ces singularités n'étant pas très nombreuses, on peut toujours parler de **régularité locale**.

On va donc utiliser des ondelettes pour décomposer ces signaux, d'où la notion de **représentation parcimonieuse**, exprimée sur la base d'ondelettes orthonormales. Et enfin en en sélectionnant un petit nombre nous revenons sur nos **approximations en basse dimension**.

Le produit scalaire du signal x(u) par l'ondelette $$\psi$$<sub>v,s</sub> revient à un produit de convolution de x par l'ondelette conjuguée. Ca veut dire que sur les points de singularités les produits scalaires vont être maximisés.

Stéphane Mallat passe un long moment pour nous amener à la construction de ces bases d'ondelettes orthonormales. Il part des bases de Haar puis de Shannon et arrive à une construction plus récente par Yves Meyer en 1986.



## 3/16/21 - Multirésolutions (lecture 6)

 On a vu la dernière fois qu'on pouvait construire une base d'ondelette le long des indices de dilatations en 2<sup>j</sup>. 

On va voir maintenant qu'on peut translater les ondelettes par des facteurs 2<sup>j</sup>.n.

Donc quand j est grand, les échelles sont de plus en plus grande. Et j petit va amener un échantillonnage  de plus en plus fin.

$$
\begin{align*}
\left\{ \Psi_{(j,n)}(u)=\frac{1}{\sqrt{2^j}}\Psi \left( \frac{u-2^jn}{2^j} \right) \right\}_{(j, n) \epsilon \Z^2}
\end{align*}
$$

sont-elles des bases orthonormales. Ensuite on appliquerait les techniques d'approximations consistant à éliminer les petits coefficients.