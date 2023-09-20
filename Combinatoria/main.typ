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