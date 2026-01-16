#import "@local/math:1.0.0": *

= Restricciones estructurales <restricciones-estructurales>

Hemos visto como se podía expresar el grupo de Rubik, $cal(R)$, como un subgrupo de $S_48$, sin embargo, a la hora de estudiar la estructura del cubo y las restricciones bajo el grupo $cal(R)$, conviene formalizarlo de otra manera.

Como se ha visto en @subgrupos-ciclicos-principales, la órbita de una posición de una esquina siempre es otra esquina, por tanto, considerando la acción de $cal(R)$ sobre el cubo, las esquinas forman una órbita y las aristas otras, por lo que podemos considerarlas por separado.

Por tanto, podemos considerar cada permutación como una permutación sobre las 12 aristas ($S_12$) y sobre las 8 aristas ($S_8$). Pero también tenemos que tener en cuenta las orientaciones.

- Las 8 esquinas admiten 3 orientaciones posibles.
- Las 12 aristas admiten 2 orientaciones posibles.
- Los centros permanecen fijos.

Por tanto, una permutación del cubo puede expresarse como un elemento de el siguiente conjunto bajo algunas restricciones.

$
  X=S_12 times S_8 times (ZZ_3)^8 times (ZZ_2)^2 
$

#prop(title: [*Restricción de orientación de vértices*])[
  La suma de las orientaciones de las esquinas, considerada módulo 3, debe ser nula. Esto implica que no es posible girar una única esquina de forma aislada.

  $
    sum_(i=1)^8 v_i equiv 0 mod 3
  $
]<prop-orientacion-vertices>

#prop(title: [*Restricción de orientación de aristas*])[
  La suma de las orientaciones de las aristas, considerada módulo 2, también debe ser cero, lo que impide invertir una única arista sin afectar a otra.

  $
    sum_(j=1)^12 w_j equiv 0 mod 2
  $
]<prop-orientacion-aristas>

#prop(title: [*Restricción de paridad*])[
  Cada movimiento actúa como un 4-ciclo sobre aristas y un 4-ciclo sobre esquinas. Por tanto la signatura es impar para ambas y en general, las permutaciones inducidas por los mismos movimientos sobre las esquinas y las aristas deben tener la misma paridad. 

  $
    "sig"(pi)="sig"(rho)
  $
]<prop-restriccion-paridad>

En conjunto, estas tres restricciones caracterizan completamente el espacio de configuraciones resolubles del cubo de Rubik.

- Es trivial que todas la combinaciones alcanzables se encuentran en una 4-tupla de $X$, pues solo hemos añadido restricciones que se han comprobado

- Se nos podría haber olvidado alguna restricción, pero un algoritmo permite resolver cualquier configuración del cubo de Rubik dada por una 4-tupla.

Por tanto, puesto que existe inyección en ambos sentidos entre $X$ y el conjunto de configuraciones válidas del cubo, tenemos una biyección y el orden es el mismo.


