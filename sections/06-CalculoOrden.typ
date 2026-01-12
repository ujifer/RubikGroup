#import "@local/math:1.0.0": *

= Cálculo de todas las posibles configuraciones de un cubo de Rubik  <orden-grupo-cubo>

Una vez establecidas las restricciones estructurales, se puede calcular el número total de configuraciones distintas alcanzables del cubo de Rubik.

*Vértices*.
- Existen 8! permutaciones posibles de las 8 esquinas.
- Cada esquina tiene 3 orientaciones posibles, lo que supone $3^8$ combinaciones. Sin embargo, por la @prop-orientacion-vertices, solo una de cada tres combinaciones de orientaciones es válida.

Por tanto, el número de configuraciones posibles de las esquinas es $8! dot 3^7$

*Aristas*.
- Existen $12!$ permutaciones posibles de las 12 aristas.
- Cada arista tiene 2 orientaciones posibles, lo que da $2^12$ combinaciones. Por la @prop-orientacion-aristas, reduce este número a la mitad.

Así, el número de configuraciones válidas de las aristas es $12! dot 2^11$

*Paridad conjunta*.

Solo la mitad de las parejas de permutaciones de esquinas y aristas cumplen la condición de
tener la misma paridad, por lo que es necesario dividir entre 2.
Combinando todos los factores, el número de combinaciones válidas del cubo de Rubik es:

$
  (8!dot 3^7 dot 12! dot 2^11)/2=43.252.003.274.489.856.000approx 4.3 dot 10^19
$