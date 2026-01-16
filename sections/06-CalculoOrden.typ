#import "@local/math:1.0.0": *

= Cálculo del orden del grupo de Rubik  <orden-grupo-cubo>

Una vez establecidas las restricciones estructurales, se puede calcular el número total de configuraciones distintas alcanzables del cubo de Rubik, que coincide con el orden del grupo, $abs(cal(R))$, y el orden de $X$ con las restricciones:

1. $abs(S_12)dot abs(S_8)=12! dot 8!$ pero solo una de cada dos $(pi,rho)in S_12 times S_8$ cumple la @prop-restriccion-paridad$imp 12! dot 8!"/"2$

2. $abs((ZZ_3)^8)=3^8$ pero solo un tercio de los $arrow(v) in (ZZ_3)^8$ cumple la @prop-orientacion-vertices $imp 3^7$

3. $abs((ZZ_2)^12)=2^12$ pero solo un medio de los $arrow(w) in (ZZ_2)^12$ cumple la @prop-orientacion-aristas $imp 2^11$

De este modo, multiplicando, obtenemos que el orden del grupo de Rubik es
$
  abs(X)=(8!dot 3^7 dot 12! dot 2^11)/2=43.252.003.274.489.856.000approx 4.3 dot 10^19
$