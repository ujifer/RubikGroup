#import "@local/math:1.0.0": *

= Preliminares teoría de grupos <preliminares>

En esta sección se explica brevemente la teoría de grupos que se empleará a lo largo de las siguientes secciones. Para ello, se ha consultado #cite(<navarro2016>, form: "prose").

#def(title: "Grupo")[

  Sea $G$ un conjunto no vacío y $thick dot.c : G times G -> G$ una operación binaria interna cuya imagen de $(x,y)$ denotamos por $x dot.c y$. Decimos que $(G, dot.c)$ es un grupo si se cumple:

  + $(x dot.c y) dot.c z = x dot.c (y dot.c z) quad forall x,y,z in G$ #h(1fr) _(asociatividad)_
  + $exists 1 in G quad "/" quad 1 dot.c x = x dot.c 1 = x quad forall x in G$ #h(1fr) _(elemento neutro)_
  + $forall x in G, quad exists y in G " / " x dot.c y = y dot.c x = 1$ #h(1fr) _(elemento inverso)_
]

#def(title: "Subgrupo")[

  Sea $G$ un grupo y $H subset G$ un conjunto no vacío. Decimos que $H$ es un subgrupo de $G$, denotado como ($H<=G$), si $forall x,y in H$:
  - $x^(-1) in H$
  - $x dot.c y in H$
]

#def(title: "Grupo Cíclico")[

  Dado un grupo G, decimos que es cíclico si $exists x in G$ tal que $G={x^n : n in ZZ} = langle x rangle$. Se dice que $G$ está generado por $x$.

  Para cualquier grupo $G$, podemos obtener subgrupos abelianos $langle g rangle$ con $g in G$.

  En caso de que se trate de un grupo (o subgrupo) generado por más elementos, usamos la notación:
  $
    langle x_1, x_2, dots, x_k rangle =
    {x_(i_1)^(n_1) dot x_(i_2)^(n_2) " " dots.c " " x_(i_m)^(n_m) quad | quad m in NN, i_j in {1,dots, k}, n_j in ZZ}
  $

  Este es el grupo más pequeño que contiene los elementos $x_1, dots, x_k$.
]

#def(title: "Permutación")[

Sea $Omega$ un conjunto, llamamos permutación a un aplicación biyectiva $f:Omega->Omega$.
Al conjunto de permutaciones de $Omega$ lo denotamos por $S_Omega$ y forma un grupo con la operación
$f dot.c g = g circle.tiny f$. 
]

#def(title: "Acción")[

  Sea $Omega$ un conjunto no vacío y $G$ un grupo. Llamamos acción a una operación
  $
    dot.c : Omega times G &-> Omega \
    (alpha, g)& mapsto alpha dot.c g
  $
  De manera que dado $alpha in Omega, quad forall g in G, quad exists! alpha dot.c g in Omega$ y además cumple las siguientes propiedades:
  - $(alpha dot.c g) dot.c h = alpha dot.c (g h) quad forall alpha in Omega, " " forall g,h in G$
  - $alpha dot.c 1 = alpha quad forall alpha in Omega$

  Esto define una relación de equivalencia: dados $alpha, beta in Omega$, $alpha tilde beta iff exists g in G$ tal que $alpha dot.c g = beta$.
]

#def(title: "Órbita y Estabilizador")[

  Dada una acción $dot.c : Omega times G -> Omega$ y $alpha in Omega$. Llamamos órbita de $alpha$
  a su clase de equivalencia:
  $
    cal(O)(alpha)={alpha dot.c g | g in G}
  $

  El estabilizador de $alpha$ en $G$ se define como
  $
    "Stab"_G (alpha)=G_alpha={g in G | alpha dot g = alpha}
  $
]<orbita-estabilizador>


