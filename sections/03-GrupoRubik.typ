#import "@local/math:1.0.0": *
#import "../utils.typ": *

= El grupo del cubo de Rubik <grupo-permutaciones-cubo>

== Intuición

Como se ha comentado en la @notación (#link(<notación>)[notación]), todas las permutaciones del cubo de Rubik se pueden generar concatenando los movimientos principales al estado inicial o resuelto.

LLamamos $Omega$ al conjunto de todos los estados del cubo de Rubik, y entonces el grupo de permutaciones viene dado por:

$
  cal(R) = langle "U", "D", "L", "R", "F", "B" rangle <= S_Omega
$

Esto es un grupo con la operación $f dot g = g circle.tiny f$ para $f,g in cal(R)$. Sin embargo utilizaremos una notación distinta:

$
  f dot g = f " " g
$

Por ejemplo, $"U" dot "R" = "U R"$ y quiere decir que primero hacemos el movimiento $"U"$ y después $"R"$. Por tanto, todo elemento de $cal(R)$ se representa como una secuencia de los movimientos principales.



- La asociatividad se cumple trivialmente.

- El elemento neutro es la identidad o "secuencia vacía", es decir, ausencia de movimientos

- El elemento inverso se obtiene invirtiendo el orden de la secuencia y cambiando cada movimiento por su inverso.

El inverso de cada movimiento es el mismo pero en sentido contrario. $"X"$ y $"X'"$ son inversos y $"X2"$ es su propio inverso.

#figure(caption: [Elementos Neutros e Inversos de las variantes de *$"R"$*])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    stroke: 1pt,
    inset: .5em,
    block(breakable: false)[
      #image("../assets/cubo_id.svg", width: 3cm)
      #line(length: 100%)
      *$1 " o  id"$*
      #v(.25em)
    ],
    ..("R R'", "R2 R2").map(i => block(breakable: false)[
      #image("../assets/cubo_"+i+".svg", width: 3cm)
      #line(length: 100%)
      *$#i$*
      #v(.25em)
    ])
  )
] <neutros-inversos-R>

== Formalización Completa

En la sección anterior, de ha descrito intuitivamente
el grupo de permutaciones del cubo del cubo de Rubik.
Sin embargo, no se ha definido con rigor matemático,
lo cual es necesario para poder seguir trabajando con la teoría de grupos.

Para ello, nos basaremos en la formalización descrita en @conrad15puzzle con alguna ligera modificación.
Hay 48 posibles pegatinas que pueden cambiar de sitio, 3 por cada esquina y 2 por cada arista. Como los centros no se mueven, determinan la cara, y los nombramos por la letra que identifica sus giros definidas en la @notación.

Se numeran de la siguiente forma:
#align(center, cube-numbering-diagram())
#figure(caption: [Numeración de las pegatinas del cubo])[]<fig6-diagrama-resuelto>

Cada número se usara para identificar unan posición (o la pegatina en dicha posición) o una pegatina. El cubo resuelto será aquel que en la posición $i$ tenga la pegatina $i$.

Esta elección de numeración permite identificar fácilmente si una pegatina pertenece a una esquina o una arista, ya que las primeras siempre son número impares y las segundas pares.

Con está notación, podemos ahora definir el grupo de Rubik como un subgrupo $cal(R)$ de $S_48$ generado por los movimientos básicos.

Para ello definimos cada movimiento como producto de ciclos disjuntos de manera que si $M$ es un movimiento, $M(i)$ representa la posición en la que termina la pegatina que estaba en la posición $i$. En la @fig-u se puede observar el resultado de aplicar $"U"$ en el cubo resuelto.

#def(title: [Movimientos Básicos como ciclos disjuntos])[
  
  - $"U"=(1,3,5,7)(2,4,6,8)(9,33,25,17)(34,26,18,10)(35,27,19,11)$
  - $"D"=(41,43,45,47)(42,44,46,48)(15,23,31,39)(14,22,30,38)(13,21,29,37)$
  - $"R"=(25,27,29,31)(26,28,30,32)(3,39,43,19)(4,40,44,20)(5,33,45,21)$
  - $"L"=(9,11,13,15)(10,12,14,16)(1,17,41,35)(8,24,48,36)(7,23,47,37)$
  - $"F"=(17,19,21,23)(18,20,22,24)(7,25,43,13)(6,32,42,12)(5,31,41,11)$
  - $"B"=(33,35,37,39)(34,36,38,40)(1,15,45,27)(2,16,46,28)(3,9,47,29)$
] <def-movimientos>

#align(center, cube-numbering-diagram(size: 1.9em, cube: u()))
#figure(caption: [Aplicación de $"U"$ sobre el cubo resuelto])[] <fig-u>

#def(title: [Grupo de Rubik])[
  De acuerdo con las convenciones y definiciones anteriores, se define el grupo  de permutaciones del cubo de Rubik como
  $
    cal(R)=langle "U","D","R","L","F","B" rangle <= S_48
  $
]

