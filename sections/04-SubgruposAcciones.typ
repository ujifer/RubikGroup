#import "@local/math:1.0.0": *
#import "../utils.typ": *

= Subgrupos y Acciones <subgrupos-acciones>

Sea $Omega={1,...,48}$ el conjunto de posiciones del cubo siguiendo el esquema de la @fig6-diagrama-resuelto, consideraremos las acciones de subgrupos de $cal(R)$ sobre $Omega$ por aplicación. 

También consideraremos el conjunto $Omega_C={(v_i)_(i=1)^48 in Omega^48 :v_i!=v_j forall i!=j in Omega}$ que representa una configuración de las pegatinas del cubo de manera que $cal(R)$ actúa por aplicación a cada componente del vector: Sean $arrow(v)=(v_i)_(i=1)^48 in Omega_C$ y $h in cal(R)$

$
  arrow(v)dot h = (h(v_i))_(i=1)^48
$
Esta acción es interesante desde un punto de vista didáctico, ya que permite ver la acción sobre el cubo completo, como normalmente estamos acostumbrados.

== Subgrupos Cíclicos Principales <subgrupos-ciclicos-principales>

Se trata de los subgrupos $langle"U"rangle,langle"D"rangle,langle"R"rangle,langle"L"rangle,langle"F"rangle,langle"B" rangle$ de orden 4. Por ejemplo,
$
  langle"U"rangle={1,"U","U2","U3"}
$

Por la acción sobre $Omega$, este subgrupo tiene 5 órbitas de cardinal 4, los cinco 4-ciclos con los que se define $"U"$:
$
  &cal(O)(1)={1,3,5,7}
  &&cal(O)(2)={2,4,6,8}\
  &cal(O)(9)={9,33,25,17}wide
  &&cal(O)(34)={34,26,18,10}\
  &cal(O)(35)={35,27,19,11}
$
El resto de órbitas son de cardinal 1 puesto que las pegatinas no se mueven al aplicar $"U"$.

Si tomamos ahora la acción sobre $Omega_C$ para verlo sobre el cubo completo, tenemos que la órbita del cubo resuelto (el vector $(i)_(i=1)^48$) es:

#{
  let m = (1, "U", "U2", "U3")
  set text(10pt)
  set block(spacing: 10pt)
  table(columns: 2, align: center + horizon,
    inset: (bottom: 10pt, top: 10pt),
  ..range(4).map(i=> {
    cube-numbering-diagram(cube: alg("U "*i), size: 18pt)
    [#line(length: 100%)*$#m.at(i)$*]
  }))
}
#figure(caption: [Órbita de $langle"U"rangle$ sobre el cubo resuelto])[]

== Subgrupo que fija la orientación

#def(title: [orientación])[
  Decimos que una pieza está orientada si 
  - Tiene una pegatina blanca o amarilla en alguna de estas cara, o
  - Si dicha pieza no posee pegatinas blancas o amarillas pero tiene una pegatina verde o azul en alguna de estas dos últimas caras.
] <orientación>

Los movimientos que no modifican la orientación son los cuadrados de los movimientos básicos, por lo que estamos hablando del grupo $G=langle "U2","D2","R2","L2","F2","B2" rangle$.

Es muy sencillo ver las órbitas de este grupo. Una de las características que tiene es que no se puede deshacer un cubo con caras opuestas del mismo color:

#align(center, cube-numbering-diagram(display-numbers: false, color-function: i => {
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
}))
#figure(caption: [Cubo de Rubik invariante bajo G])[]

Aquí, la acción sobre $Omega_C$ "vendría" dada por $alpha dot g = alpha quad forall alpha in Omega_C, g in G$. Se ha entrecomillado _vendría_ puesto que no tenemos bien definido $Omega_C$ para este cubo ya que hay piezas iguales con nombres diferentes. Por ejemplo las dos esquinas que poseen las pegatinas $(7,11,17)$ y $(3,27,33)$ son iguales con estos colores.

Un subgrupo similar, ligeramente mayor se obtiene al permitir cualquier giro de las caras superiores e inferiores, es decir $H=langle "U","D","R2","L2","F2","B2" rangle$.

Este subgrupo juega un papel fundamental en el estudio estructural del grupo del cubo de Rubik y, en particular, en la demostración de que toda configuración del cubo se puede resolver en 20 movimientos o menos, resultado conocido como _God's number_. Se puede ver brevemente el procedimiento empleado en la demostración en @rokicki2013diameter.

Todo cubo resuelto al que se le aplique una permutación de $H$ tendrá la forma que se muestra en la @fig10-cubo-H tras aplicar el siguiente cambio de pegatinas: cambiar amarillo por blanco, naranja por rojo, azul por verde y quitar las pegatinas de las esquinas que no sean blancas.

#align(center, cube-numbering-diagram(size: 1.75em, display-numbers: false, color-function: i => {
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
#figure(caption: [Cubo de Rubik invariante bajo $H$])[] <fig10-cubo-H>

La justificación para el cálculo de posiciones del cubo de Rubik se abordará en la @orden-grupo-cubo, de momento afirmamos sin justificación que el cubo invariante por $H$ tiene $8!8!4!"/"2=19.508.428.800$. De este modo, en vez de comprobar cada configuración del cubo y encontrar la solución óptima, se estudia el conjunto de clases a derecha
$
  frac(cal(R), H, style: "skewed")={H dot f | f in cal(R)}
$
que particiona $cal(R)$ en $abs(cal(R))"/"abs(H)=2.217.093.120$ clases de equivalencia donde hay que comprobar un solo representante, reduciendo drásticamente el coste computacional.

#align(center, cube-numbering-diagram(size: 1.5em, display-numbers: false, cube: r(), color-function: i => {
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
#figure(caption: [Clase lateral $H R={h dot R | h in H}$])[]

*Acción de $cal(R)$ sobre $cal(R)"/"H$ por multiplicación a derecha*

#let RH=$frac(cal(R), H, style: "skewed")$
#let prod=$ast.op.o$
$
  prod: RH times cal(R) &--> RH\
  (H x,g)&mapsto H x prod g = H(x g)
$

Veamos que está bien definida. Sean $H x=H y in display(RH)$, entonces existe $h in H$ tal que $y=h x$ y por tanto, $H x prod g = H(x g)=H(h x g)=H(y g)=H y prod g$.

Desde el punto de vista del cubo de Rubik, cada clase lateral $H g$ representa un tipo de configuración caracterizado por el cubo invariante asociado a $H$.
Aplicar un movimiento $g in cal(R)$ no altera la estructura interna de la clase, sino que transporta la configuración a otra clase lateral.

Se trata de una acción transitiva, pues solo tiene una órbita. Dados $H g_1, H g_2 in display(RH)$, se tiene que $H g_2 = H (g_1 (g_1^(-1)g_2))=H g_1 prod g_1^(-1)g_2$

El estabilizador de la clase $H 1 = H$ bajo esta acción es precisamente el subgrupo 

$ "Stab"_cal(R) (H)={g in cal(R) | H prod g = H}=H $
