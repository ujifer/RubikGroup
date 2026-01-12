#import "@local/math:1.0.0": *

= Restricciones estructurales <restricciones-estructurales>

Hemos visto como se podía expresar el grupo de Rubik, $cal(R)$, como un subgrupo de $S_48$, sin embargo, a la hora de estudiar la estructura del cubo y las restricciones bajo el grupo $cal(R)$, conviene formalizarlo de otra manera.

Como se ha visto en @subgrupos-ciclicos-principales, la órbita de una posición de una esquina siempre es otra esquina, por tanto, considerando la acción de $cal(R)$ sobre el cubo, las esquinas forman una órbita y las aristas otras, por lo que podemos considerarlas por separado.



Cada movimiento actúa permutando las piezas del cubo y
modificando, en algunos casos, su orientación.
Para describir algebraicamente una configuración del cubo, se consideran por separado las
esquinas (vértices) y las aristas, ya que nunca pueden intercambiar sus posiciones entre sí.

#aviso[
  Me gustaría que explicaras como se llega al grupo 
  $ S_12 times S_8 times ZZ_3 times ZZ_2 $
  un poquito y demostrar las proposiciones.
  Lo que tu veas, si no quieres hacer algo y me das permiso, lo hago yo encantado
]

Además, cada pieza posee una orientación interna:

- Las 8 esquinas admiten 3 orientaciones posibles.
- Las 12 aristas admiten 2 orientaciones posibles.
- Los centros permanecen fijos.

Una configuración del cubo puede representarse entonces mediante un cuádruple, donde:

- $pi$ es la permutación de las esquinas
- $rho$ es la permutación de las aristas
- $v$ describe las orientaciones de las esquinas
- $w$ describe las orientaciones de las aristas

No toda configuración teórica es alcanzable mediante movimientos legales del cubo. Existen tres
restricciones fundamentales que caracterizan las configuraciones resolubles.

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
  Las permutaciones inducidas sobre las esquinas y las aristas deben tener la misma paridad. Esta condición se debe a que cada movimiento básico del cubo actúa como un 4-ciclo impar en ambos conjuntos.

  $
    "sgn"(pi)="sgn"(rho)
  $
]<prop-restriccion-paridad>

En conjunto, estas tres restricciones caracterizan completamente el espacio de configuraciones resolubles del cubo de Rubik. Toda configuración que las satisface puede alcanzarse desde la posición resuelta mediante una sucesión de movimientos, mientras que cualquier configuración que viole alguna de ellas es inalcanzable sin desmontar el cubo. Esta caracterización resulta fundamental para el cálculo exacto del orden de su grupo asociado.