#import "@local/math:1.0.0": *

= Introducción: El cubo de Rubik

El cubo de Rubik clásico es un cubo de dimensiones $3 times 3 times 3$ con cara cada de un color formado por 26 piezas:

- Centros (6): son aquellas piezas de un solo color. Determinan el color de la cara en la que se encuentran.

- Aristas (12): piezas con dos colores. Se pueden encontrar con dos orientaciones distintas.

- Esquinas (8): piezas con tres colores. En este caso, cada una puede tener 3 orientaciones distintas.

A cada color de una pieza lo llamaremos pegatina, por lo que hay en total $8 "esquinas" dot 3 "colores" + 2 "aristas" dot 2 "colores"=48$ pegatinas que pueden cambiar de posición, por lo que determinan una configuración del cubo de Rubik.

Esta estructura permite una serie de movimientos, que se detallan en la @notación.
Estos movimientos son las rotaciones de una de las caras, lo que permite realizar una serie de permutaciones.

El objetivo de este trabajo es el estudio de estas permutaciones como un subgrupo de $S_Omega$ donde $Omega$
es el conjunto de estados del cubo. Para ello, se repasará inicialmente los conceptos de 
teoría de grupos necesarios, dando así una notación clara en la @preliminares.

A continuación, se definirá formalmente el grupo de permutaciones del cubo de Rubik clásico en la
@grupo-permutaciones-cubo y se estudiarán algunos de sus subgrupos y acciones en la @subgrupos-acciones. 


Cabe destacar que no cualquier elemento de $Omega$, no constituye un estado válido del cubo de Rubik,
como por ejemplo, la rotación de una sola esquina. A estos estados se les denomina
estados imposibles o ilegales y se detallarán en la @restricciones-estructurales.

Aplicando los resultados obtenidos, podremos calcular el cardinal de todas las
posibles combinaciones del cubo de Rubik en la @orden-grupo-cubo.

#pagebreak()

== Notación <notación>

A lo largo de esta sección, se explicarán los distintos movimientos que se puede hacer con el
cubo de Rubik y la notación que se empleará para referirse a ellos.

En los diagramas que se emplean en esta sección se considerará que la posición inicial del cubo es con la cara amarilla arriba y la verde delante (hacia la izquierda). Estos diagramas se han generado utilizando la página web #link("https://puzzle-generator.robiningelbrecht.be/cube")[Rubik's Cube SVG Generator] @puzzle_generator_cube.

*Movimientos Principales*

Cada uno de estos movimientos consiste en una rotación de $90 degree$
en sentido horario de una de las caras del cubo. El sentido horario,
se determina desde la perspectiva en la que dicha cara es la frontal.
Cada uno de estos movimientos se representa con una letra mayúscula.


#figure(caption: [Movimientos Principales])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    stroke: 1pt,
    inset: .5em,
    ..("R", "U", "F", "L", "D", "B").map(i => block(breakable: false)[
      #image("../assets/cubo_"+i+".svg", width: 3cm)
      #line(length: 100%)
      *$#i$*
      #v(.25em)
    ])
  )
]

Mediante la composición de estos movimientos se puede reproducir
todas las permutaciones posibles del cubo de Rubik.

Para cada uno de los movimientos, podemos considerar sus potencias. En particular,
dado el movimiento $"X"$,
- $"X"^2="X2"$ representa la repetición del movimiento dos veces.
- $"X"^3="X"^(-1)="X'"$ es la repetición del movimiento $"X"$ tres
 veces, o equivalentemente, un giro de $90 degree$ en sentido antihorario.

Por ejemplo, si repetimos $"R"$ dos veces obtenemos un movimiento al que llamamos $"R2"$, y si lo hacemos 3 veces (o hacer $"R"$ pero en sentido contrario), entonces se llama $"R'"$.

#figure(caption: [Ejemplo $"R2"$ y $"R'"$])[
  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    stroke: 1pt,
    inset: .5em,
    ..("R", "R2", "R'").map(i => block(breakable: false)[
      #image("../assets/cubo_"+i+".svg", width: 3cm)
      #line(length: 100%)
      *$#i$*
      #v(.25em)
    ])
  )
]

A la hora de contar el número de movimientos empleados para una resolución del cubo, todos estos cuentan como solo uno.

#nota[
  Se usará indistintamente la notación $"X'"$ y $"X3"$ por su simplicidad para los subgrupos cíclicos.

  Aunque hay nombre para más movimientos, estos son solo una composición de los básicos y por tanto, se prescindirá de ellos.
]

