#import "@preview/touying:0.6.1": *
#import themes.simple: *
#import "utils.typ": *
#import "@local/math:1.0.0": *

#show: document-init

#show: simple-theme.with(
  config-info(
    title: [El Grupo de Rubik],
    author: [Ferran Martinavarro],
    date: datetime.today().display("[day]-[month]-[year]"),
    institution: [Universitat Jaume I],
  ),
) 
#let math-counter = rich-counter(identifier: "math", inherited_levels: 1)

#let def = mathblock(
  blocktitle: "Definición",
  counter: math-counter,
  spacing: 1.5em
)

#title-slide()[
  = El Grupo de Rubik

  Ferran Martinavarro

  #datetime.today().display("[day]/[month]/[year]")
]

#components.adaptive-columns(outline(depth: 1))

= Introducción: Notación
#grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    stroke: 1pt,
    inset: 12pt,
    ..("R", "U", "F", "L", "D", "B").map(i => block(breakable: false, spacing: 0pt)[
      #set text(14pt)
      #image("./assets/cubo_"+i+".svg", width: 3cm)
      #line(length: 100%)
      $#i$
    ])
  )

= Preliminares

#def(title: "Grupo Generado")[

  Dados los elementos $x_1, dots, x_k$, el grupo más pequeño que contiene estos elementos, al que llamamos grupo generado por $x_1, dots, x_k$ viene dado por:
  $
    langle x_1, dots, x_k rangle =
    {x_(i_1)^(n_1) " "dots.c" " x_(i_m)^(n_m) quad|quad m in NN, i_j in {1,dots, k}, n_j in ZZ}
  $
]

#def(title: "Permutación")[

Sea $Omega$ un conjunto. Decimos que una permutación de $Omega$ es una aplicación biyectiva $f:Omega->Omega$.

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

= El Grupo de Rubik

$
  cal(R)=langle"U","D","L","R","F","B"rangle<=S_Omega
$

== Formalización

#align(center, block[
  #set text(size: 18pt)
  #cube-numbering-diagram(size: 35pt)
])

#slide[
#table(
  columns: (2fr, 1fr), align: center + horizon, stroke: none,
  block[
  #set text(size: 18pt)
  #cube-numbering-diagram(size: 30pt, cube: u())
], $U =&(1,3,5,7)\ pause &(2,4,6,8)\ pause &(9,33,25,17)\ pause &(34,26,18,10)\ pause&(35,27,19,11)$
)]

#slide[
  #def(title: [Movimientos Básicos como ciclos disjuntos])[
    #set text(22pt)

    - $"U"=(1,3,5,7)(2,4,6,8)(9,33,25,17)(34,26,18,10)(35,27,19,11)$
    - $"D"=(41,43,45,47)(42,44,46,48)(15,23,31,39)(14,22,30,38)(13,21,29,37)$
    - $"R"=(25,27,29,31)(26,28,30,32)(3,39,43,19)(4,40,44,20)(5,33,45,21)$
    - $"L"=(9,11,13,15)(10,12,14,16)(1,17,41,35)(8,24,48,36)(7,23,47,37)$
    - $"F"=(17,19,21,23)(18,20,22,24)(7,25,43,13)(6,32,42,12)(5,31,41,11)$
    - $"B"=(33,35,37,39)(34,36,38,40)(1,15,45,27)(2,16,46,28)(3,9,47,29)$
  ] <def-movimientos>

  $
    cal(R)=langle"U","D","L","R","F","B"rangle<=S_48
  $
]

= Subgrupos y Acciones

== Conjuntos sobre los que veremos acciones
#slide[
  *1.* $Omega={1,...,48}$ el conjunto de posiciones del cubo.

  *2.* $Omega_C={(v_i)_(i=1)^48 in Omega^48 :v_i!=v_j forall i!=j in Omega}$ que representa una configuración de las pegatinas del cubo de manera que $cal(R)$ actúa por aplicación a cada componente del vector: Sean $arrow(v)=(v_i)_(i=1)^48 in Omega_C$ y $h in cal(R)$
  $
    arrow(v)dot h = (h(v_i))_(i=1)^48
  $
  Lo veremos gráficamente con los diagramas. 
]

== Subgrupos Cíclicos Básicos
#slide[
  Subgrupos $langle"U"rangle,langle"D"rangle,langle"R"rangle,langle"L"rangle,langle"F"rangle,langle"B" rangle$ de orden 4. Por ejemplo,
  $
    langle"U"rangle={1,"U","U2","U3"}
  $
  #{
    set text(size: 14pt)
    let c = solved-cube
    let i = 0
    let algoritmo = "U"
    let t = ""

    while true {
      only(i + 1)[#align(center + horizon, 
        [
          #table(columns: (10em,1fr), inset: 0pt, stroke: none,
          [#set text(40pt); #h(1em)*$#t$*], cube-numbering-diagram(cube: c, size: 23.84pt))
        ]
      )]
      c = alg(cube: c, algoritmo)
      i+=1
      if (i == 1) {
        t = algoritmo
      } else {
        t=algoritmo+str(i)
      }
      if c == solved-cube {
        break
      }
      pause
    }
    pause
    only(i+1)[#align(center + horizon, 
        [
          #table(columns: (10em,1fr), inset: 0pt, stroke: none,
          [#set text(30pt); #h(1em)*$1=U 4$*], cube-numbering-diagram(cube: c, size: 23.84pt))
        ]
      )]
  }
]

Por la acción sobre $Omega$, este subgrupo tiene 5 órbitas de cardinal 4, los cinco 4-ciclos con los que se define $"U"$:
$
  &cal(O)(1)={1,3,5,7}
  &&cal(O)(2)={2,4,6,8}\
  &cal(O)(9)={9,33,25,17}wide
  &&cal(O)(34)={34,26,18,10}\
  &cal(O)(35)={35,27,19,11}
$
El resto de órbitas son de cardinal 1 puesto que las pegatinas no se mueven al aplicar $"U"$.

Nótese que los números con una paridad van a números con la misma


== Subgrupo que fija la orientación

#slide[#def(title: [orientación])[
  Decimos que una pieza está orientada si 
  - Tiene una pegatina blanca o amarilla en alguna de estas cara, o
  - Si dicha pieza no posee pegatinas blancas o amarillas pero tiene una pegatina verde o azul en alguna de estas dos últimas caras.
] <orientación>

Los cuadrados de los movimientos básicos#footnote[Cualquier giro de $"U"$ o $"D"$ tampoco modifica la orientación, lo veremos...] no modifican la orientación$ G=langle "U2","D2","R2","L2","F2","B2" rangle $
]

#slide[Es muy sencillo ver las órbitas de este grupo. Una de las características que tiene es que no se puede deshacer un cubo con caras opuestas del mismo color:

#align(center)[
  #set text(14pt)
  #cube-numbering-diagram(
    display-numbers: false, size: 22pt, color-function: i => {
      if (type(i) == str) {
        return if i == "R" {rubik-colors.L}
              else if i == "B" {rubik-colors.F}
              else if i == "U" {rubik-colors.D}
              else {rubik-colors.at(i)}
      } else if (type(i) == int) {
        return (
          (i < 9, rubik-colors.D),
          (i < 17, rubik-colors.L),
          (i < 25, rubik-colors.F),
          (i < 33, rubik-colors.L),
          (i < 41, rubik-colors.F),
          (i < 49, rubik-colors.D),
        ).find(t => t.at(0)).at(1)
      }
    }
  )
]]

Un subgrupo similar, ligeramente mayor es $H=langle "U","D","R2","L2","F2","B2" rangle$.

Se emplea en la demostración de que toda configuración del cubo se puede resolver en 20 movimientos o menos, resultado conocido como *_God's number_* @rokicki2013diameter.

Se trata de una prueba computacional que verifica que las $4.3 dot 10^19$ cumple la condición.

== Problema de Algoritmia

Para resolver una configuración del cubo, se usa back-tracking con ramificación y acotación de ramas: *coste exponencial*.

Además, se necesita control de visitados, almacenar en un conjunto todas las configuraciones que ya se han comprobado: *falta RAM* para todas la posibilidades

== Solución Algebraica

#slide[
  Explorar un representante de cada clase de equivalencia que viene dada por las órbitas de un subgrupo.

  Bajo la acción de $H$ un cubo invariante tiene la siguiente forma:

  #set text(size: 12pt)
  #align(center, cube-numbering-diagram(size: 21pt, display-numbers: false, color-function: i => {
  if (type(i) == str) {
    return if i == "R" {rubik-colors.L}
          else if i == "B" {rubik-colors.F}
          else if i == "U" {rubik-colors.D}
          else {rubik-colors.at(i)}
  } else if (type(i) == int) {
    return (
      (i < 9, rubik-colors.D),
      (i in (12,16,32,28), rubik-colors.L),
      (i in (24,20,40,36), rubik-colors.F),
      (i > 40 and i < 49, rubik-colors.D),
      (true, gray)
    ).find(t => t.at(0)).at(1)
  }
}))
]

#slide[
  El cubo invariante por $H$ tiene $8!8!4!"/"2=19.508.428.800$ posiciones. Se estudia el conjunto de clases a derecha
  $
    frac(cal(R), H, style: "skewed")={H dot f | f in cal(R)}
  $
  que particiona $cal(R)$ en $abs(cal(R))"/"abs(H)=2.217.093.120$ clases de equivalencia donde hay que comprobar un solo representante, reduciendo drásticamente el coste computacional.

]

#slide[
  *Clase lateral* $H R={h dot R | h in H}$
  #set text(18pt)
  #align(center, cube-numbering-diagram(size: 29pt, display-numbers: false, cube: r(), color-function: i => {
    if (type(i) == str) {
      return if i == "R" {rubik-colors.L}
            else if i == "B" {rubik-colors.F}
            else if i == "U" {rubik-colors.D}
            else {rubik-colors.at(i)}
    } else if (type(i) == int) {
      return (
        (i < 9, rubik-colors.D),
        (i in (12,16,32,28), rubik-colors.L),
        (i in (24,20,40,36), rubik-colors.F),
        (i > 40 and i < 49, rubik-colors.D),
        (true, gray)
      ).find(t => t.at(0)).at(1)
    }
  }))
]

== Acción de $cal(R)$ sobre $cal(R)"/"H$ por multiplicación a derecha

#let RH=$frac(cal(R), H, style: "skewed")$
#let prod=$ast.op.o$
#slide[
  $
    prod: RH times cal(R) &--> RH\
    (H x,g)&mapsto H x prod g = H(x g)
  $

  \
  Está bien definida. Sean $H x=H y in display(RH)$, entonces existe $h in H$ tal que $y=h x$ y por tanto, $H x prod g = H(x g)=H(h x g)=H(y g)=H y prod g$.
]

#slide[Desde el punto de vista del cubo de Rubik, cada clase lateral $H g$ representa un tipo de configuración caracterizado por el cubo invariante asociado a $H$.

Aplicar un movimiento $g in cal(R)$ no altera la estructura interna de la clase, sino que transporta la configuración a otra clase lateral.]

Se trata de una *acción transitiva*, pues solo tiene una órbita. Dados $H g_1, H g_2 in display(RH)$, se tiene que $ H g_2 = H (g_1 (g_1^(-1)g_2))=H g_1 prod g_1^(-1)g_2 $

El *estabilizador* de la clase $H 1 = H$ bajo esta acción es precisamente el subgrupo 

$ "Stab"_cal(R) (H)={g in cal(R) | H prod g = H g = H}=H $

= Restricciones Estructurales

Vamos a ver ahora $cal(R)$ (bajo algunas restricciones) como $ S_12 times S_8 times (ZZ_3)^8 times (ZZ_2)^12 $


- #align(left)[$S_12$ es una permutación de las esquinas]
- #align(left)[$S_8$ es una permutación de las aristas]
- #align(left)[$ZZ_3$ es la orientaciones de las esquinas]
- #align(left)[$ZZ_2$ es la orientación de las aristas]

== Paridad conjunta
#slide[
  Cada movimiento induce un 4-ciclo en las esquinas que mueve y un 4-ciclo en las aristas.

  La signatura de un $4"-ciclo"$ es $-1 ==>$ permutación impar. Cada permutación $pi in S_12$ y $rho in S_8$ inducida por los mismos movimientos cumple
  $
    "sig"(pi)="sig"(rho)
  $
]

== Restricción de Orientación

#slide[
  Comprobando cada movimiento básico se ve que dados $ arrow(v)=(v_i)_(i=1)^8 in (ZZ_3)^8, wide arrow(w)=(w_i)_(i=1)^12 in (ZZ_2)^12 $

  Se cumple

  $
    sum_(i=1)^8 v_i equiv 0 mod 3 wide wide sum_(i=1)^12 w_i equiv 0 mod 2
  $
]

= Cálculo del Orden

$
  X={cases(delim: #none,
    &"sig"(pi)="sig"(rho),
    (pi,rho,arrow(v),arrow(w))in S_12 times S_8 times (ZZ_3)^8 times (ZZ_2)^12 : &sum_(i=1)^8 v_i equiv 0 mod 3, &sum_(i=1)^12 w_i equiv 0 mod 2
  )}
$

== Biyección

#slide[
  Dado $Omega$ el conjunto de todas las configuraciones del cubo de Rubik:

  - Es trivial que todas la combinaciones alcanzables se encuentran en una 4-tupla de $X$

  - Existe un algoritmo que dada una 4-tupla de $X$, resuelve el cubo asociado.

  Como existe $f:Omega->X$ inyectiva y $g:X->Omega$ inyectiva, existe una biyección ente $Omega$ y $X$, por lo que el cardinal es el mismo.
]

== Cálculo $abs(X)=abs(Omega)$
#slide[
  1. $abs(S_12)dot abs(S_8)=12! dot 8!$ pero solo una de cada dos $(pi,rho)in S_12 times S_8$ cumple $"sig"(pi)="sig"(rho) imp display((12! dot 8!)/2)$

  2. $abs((ZZ_3)^8)=3^8$ pero solo un tercio de los $arrow(v) in (ZZ_3)^8$ cumple $sum_(i=1)^8 v_i equiv 0 mod 3 imp 3^7$

  3. $abs((ZZ_2)^12)=2^12$ pero solo un medio de los $arrow(w) in (ZZ_2)^12$ cumple $sum_(i=1)^8 w_i equiv 0 mod 2 imp 2^11$

  $
    abs(X)=(8!dot 3^7 dot 12! dot 2^11)/2=43.252.003.274.489.856.000approx 4.3 dot 10^19
  $
]

= Bibliografía
#block()[#set text(size: 0pt)
@conrad15puzzle
@navarro2016
@puzzle_generator_cube
]
#set text(20pt)
#bibliography("refs.bib", title: none)