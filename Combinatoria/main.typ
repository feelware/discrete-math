#import "template.typ": *

#let datos = (
  title: "Título del documento",
  professor: "Dr. Ciro Rodríguez Rodríguez",
  author: "Jesus Stevan Diaz Ingol"
)

#show: documento.with(datos)

= Combinaciones y permutaciones

== Ejercicio 1
Queremos codificar los símbolos alfanuméricos (28 letras y 10 cifras) en palabras de una cierta longitud k de un alfabeto binario $A = {0, 1}$. ¿Cuál es la mínima longitud necesaria para poderlo hacer?

=== Solución
Para que la palabra tenga la menor longitud posible, debemos poder representar la mayor cantidad de símbolos posibles con la menor cantidad de bits posibles. En este sentido, elegimos a la permutación con repetición como estrategia de conteo. Dado que cada ordenamiento representa un símbolo distinto, estamos aprovechando al máximo la cantidad de bits disponibles.

Sea $P R _2 ^k$ el total de permutaciones con repetición de 2 dígitos tomados de $k$ en $k$, tenemos

$ P R _2 ^k = 2^k $

Se nos pide representar como mínimo 38 símbolos distintos, entonces

$ 2^k >= k $
$ k >= log_2 38 $
$ k >= 5.248 $

Siendo que la longitud de la palabra debe ser un número entero, tenemos que la longitud mínima es 6.

\

== Ejercicio 2
¿Es suficiente con palabras de hasta 4 de longitud para representar todas las letras del alfabeto ordinario en lenguaje Morse (el lenguaje Morse dispone sólo de dos símbolos: punto y raya)?

=== Solución
El total de posibles palabras Morse de longitud 4 equivale al total de permutaciones con repetición de 2 dígitos tomados de 4 en 4, es decir

$ P R _2 ^4 = 2^4 = 16 $

Dado que el alfabato ordinario tiene 26 letras (sin contar la ñ), queda en evidencia que no es posible representar todas ellas con palabras Morse de longitud 4.

\

== Ejercicio 3
De cuántas maneras se pueden escoger tres números del 1 al 9 de manera que no salgan dos consecutivos?

=== Solución
Para resolver este problema, empezamos considerando el total de permutaciones con repetición de 2 dígitos del 1 al 9 tomados de 3 en 3 (sin restricciones), es decir

$ P R _9 ^3 = 9^3 = 729 $

Podemos entender a este número como los nodos finales de un árbol de tres niveles, cada nivel representando a un dígito de la permutación. Así, el primer nivel tendrá 9 nodos, cada uno representando a un dígito del 1 al 9. Dado que en el escenario actual no existen restricciones de consecutividad, de cada nodo se ramifican 9 nodos más.

Pasemos a considerar las ramas que, dadas las restricciones del problema, no pueden existir. En general, ningún nodo puede ramificarse hacia otro nodo que representa el dígito consecutivo. Esto significa que, en el primer nivel, se debe eliminar un subnodo de cada nodo del 1 al 8, incluyendo los 9 subnodos de cada uno de estos subnodos. En total, se eliminan 72 nodos finales.

El único nodo del primer nivel que conserva todos sus subnodos es el 9. Con estos, hacemos lo mismo que hicimos antes: eliminamos un subnodo de cada nodo del 1 al 8. En total, se eliminan 8 nodos finales.

El nodo 8 del primer nivel ha perdido su subnodo 9, por lo que ahora tiene 8 subnodos del 1 al 8. Con estos hacemos lo mismo: eliminamos un subnodo de cada nodo del 1 al 8. En total, se eliminan 8 nodos finales.

Los nodos 1 al 7 del primer nivel también han perdido un subnodo. Por ejemplo

- El nodo 1 ha perdido a su subnodo 2, quedándole los subnodos ${1, 3, 4, 5, 6, 7, 8, 9}$, de los cuales, a excepción del 9, se elimina un subnodo de cada uno de ellos.

- El nodo 2 ha perdido su subnodo 3, quedándole los subnodos ${1, 2, 4, 5, 6, 7, 8, 9}$, de los cuales, a excepción del 9, se elimina un subnodo de cada uno de ellos.

Notamos que a cada caso se eliminan 7 nodos finales. En total, se eliminan 49 nodos finales.

Finalmente, restamos todos los nodos finales eliminados al total de nodos finales del árbol, obteniendo

$ 729 - 72 - 8 - 8 - 49 = 592 $

Entonces, se pueden escoger tres números del 1 al 9 de 592 maneras distintas de manera que no salgan dos consecutivos.

\

== Ejercicio 4
Las placas de matrícula tienen cuatro dígitos numéricos seguidos de dos alfabéticos. ¿Cuántos coches se pueden matricular? Una vez se han agotado, se propone que las matrículas puedan estar formadas por seis dígitos alfanuméricos (es decir, cifras del 0 al 9 o letras de la A a la Z). ¿Cuántas matrículas nuevas se pueden hacer? Una vez agotadas éstas, ¿qué estrategia proporcionaría más matrículas nuevas, hacer matrículas con 7 dígitos, o bien añadir un símbolo al alfabeto?

=== Solución
En el primer caso, el total de matrículas posibles equivale al total de permutaciones con repetición de 10 dígitos tomados de 4 en 4, multiplicado por el total de permutaciones con repetición de 26 letras tomadas de 2 en 2, es decir

$ P R _10 ^4 dot P R _26 ^2 = 10^4 dot 26^2 = 6760000 $

En el segundo caso, el total de matrículas posibles equivale al total de permutaciones con repetición de 36 dígitos alfanuméricos (10 cifras o 26 letras sin contar la ñ) tomados de 6 en 6, es decir

$ P R _36 ^6 = 36^6 = 2176782336 $

En el tercer caso, por un lado tenemos el total de permutaciones con repetición de 36 dígitos tomados de 7 en 7, es decir

$ P R _36 ^7 = 36^7 = 78364164096 $

Por otro lado, tenemos el total de permutaciones con repetición de 36 dígitos alfanuméricos más uno nuevo, tomados de 6 en 6, es decir

$ P R _37 ^6 = 37^6 = 2565726409 $

Notamos que la primera estrategia proporciona más matrículas nuevas.

\

== Ejercicio 5
¿Cuántos números hay entre 100 y 900 que tengan las cifras diferentes? ¿Cuántos números más grandes que 6600 con todas las cifras diferentes y sin ninguna de las cifras 7, 8 ni 9?

=== Solución
En el primer caso, las siguientes condiciones pueden derivarse del enunciado:

- El primer dígito puede ser cualquier número entre 1 y 8. En total son 8 posibilidades.

- El segundo dígito puede ser cualquier número entre 0 y 9, excepto aquel que se eligió para el primer dígito. En total son 9 posibilidades.

- El tercer dígito puede ser cualquier número entre 0 y 9, excepto aquellos que se eligieron para el primer y segundo dígito. En total son 8 posibilidades.

Por el principio de multiplicación, el total de números entre 100 y 900 que tienen las cifras diferentes es

$ 8 dot 9 dot 8 = 576 $

En el segundo caso, notamos que ningún número de cuatro cifras puede satisfacer el enunciado, pues para que sea mayor a 6600, o bien

- El primer dígito aumenta (lo que es imposible, pues no puede ser 7, 8 ni 9)

- El primer dígito permanece y el segundo aumenta (lo que es imposible, pues no puede ser 7, 8 ni 9)

- Los dos primeros dígitos permanecen y cualquiera de los dos úlitmos aumenta (lo que es imposible, pues se estarían repitiendo los dos primeros dígitos)

Así, el total de números más grandes que 6600 con todas las cifras diferentes y sin ninguna de las cifras 7, 8 ni 9 es 0.

\

== Ejercicio 6
Cuántas palabras de longitud 4 se pueden formar con las cinco vocales sin que se repita ninguna? ¿Y de longitud 5 (también sin que se repita ninguna)?

=== Solución
En el primer caso, se efectua una permutación sin repetición de 5 elementos tomados de 4 en 4, es decir

$ P _5 ^4 = 5! / (5 - 4)! = 120 $

En el segundo caso, se efectua una permutación sin repetición de 5 elementos tomados de 5 en 5, es decir

$ P _5 ^5 = 5! / (5 - 5)! = 120 $

\

== Ejercicio 7
Un código de colores con barras usa 6 colores para pintar 4 barras, pero dos barras consecutivas no pueden tener el mismo color. ¿Cuántas palabras diferentes se pueden formar?

=== Solución
Notamos que la primera barra puede ser pintada con cualquiera de los 6 colores. El resto de barras puede ser pintado con cualquiera de los 6 colores excepto por el color que se eligió para la barra inmediatamente anterior (puede tomar el color de barras anteriores a la inmediatamente anterior). Por el principio de multiplicación, el total de palabras diferentes que se pueden formar es $6 dot 5 dot 5 dot 5 = 750$

== Ejercicio 8
En un alfabeto de 10 consonantes y 5 vocales, ¿cuántas palabras de cinco letras sin dos vocales seguidas ni tres consonantes seguidas se pueden formar?

=== Solución
Analizando primero el caso sin restricciones, tenemos que el total de palabras de cinco letras que se pueden formar equivale al total de permutaciones con repetición de 15 letras tomadas de 5 en 5, es decir

$ P R _15 ^5 = 15^5 = 759375 $

Restamos los casos que no pueden ocurrir. Para el propósito de representar fácilmente las distribuciones de letras, usaremos cadenas de letras C para consonantes y V para vocales.

- $V V C C C$
- $V C C C V$
- $C C C V V$

Dado que el enunciado no exige que las letras no se repitan, los tres casos pueden ocurrir el mismo número de veces: $5² dot 10³$, representando el total de permutaciones con repetición de 10 consonantes tomadas de 3 en 3 y 5 vocales tomadas de 2 en 2. En total, se eliminan $3 dot 5² dot 10³ = 75000$ casos.

Finalmente, se resta el total de casos sin restricciones a los casos que no pueden ocurrir, obteniendo

$ 759375 - 75000 = 684375 $

Se pueden formar 684375 palabras de cinco letras sin dos vocales seguidas ni tres consonantes seguidas.

\

== Ejercicio 9
La música serial se basa en el principio de que en cualquier línea melódica han de aparecer los 12 tonos de la escala antes de repetirse alguno. ¿Cuántas líneas melódicas de 12 notas se pueden formar según este principio?

=== Solución
El total de líneas melódicas de 12 notas que se pueden formar equivale al total de permutaciones sin repetición de 12 elementos tomados de 12 en 12, es decir

$ P _12^12 = 12! / (12 - 12)! = 479001600 $

\

== Ejercicio 10
En problemas de diseño de redes de interconexión se suelen usar grafos que tienen por vértices palabras de un alfabeto. Por ejemplo, los llamados grafos de Kautz tienen por vértices las palabras de longitud k qur se pueden formar de un alfabeto de n símbolos con la condición que dos letras consecutivas no pueden ser iguales. ¿Cuántas de estas palabras hay?

=== Solución
La primera letra del vértice puede ser cualquiera de las $n$ letras del alfabeto. El resto de letras puede ser cualquiera de las $n - 1$ letras del alfabeto, excepto por la letra que se eligió para la letra inmediatamente anterior (puede tomar el color de letras anteriores a la inmediatamente anterior). Por el principio de multiplicación, el total de palabras que se pueden formar es $n (n - 1)^(k - 1)$

\

== Ejercicio 11
Sea $A = {1, 2, dots, n}$ y $X = {x_1, x_2, dots, x_k}$ conjunto de $k$ símbolos. Una aplicación $f : X arrow A$ es ordenada si $f(x_1) lt.eq f(x_2) lt.eq dots lt.eq f(x_k)$ y estrictamente ordenada si las desigualdades son estrictas. ¿Cuántas aplicaciones ordenadas y cuántas estrictamente ordenadas hay de $X$ en $A$?