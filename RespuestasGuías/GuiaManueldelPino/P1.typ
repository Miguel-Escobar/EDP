#import "../../preamble.typ": *

#set text(
  font: "JetBrainsMono NF",
  fill: textcolors.at(0), 
  lang: "es")
#let up = sym.arrow.t
#let down = sym.arrow.b
#show emph: set text(textcolors.at(1))
#show strong: set text(textcolors.at(2))
#show: thmrules

#set page(fill: backgroundcolor)

// #show heading.where(level: 1): set text(headingcolors.at(0))
// #show heading.where(level: 2): set text(headingcolors.at(1))
// #show heading.where(level: 3): set text(headingcolors.at(2))
// #show heading.where(level: 4): set text(headingcolors.at(3))


#set math.equation(numbering: "(1)")
#set par(justify: true)
#set table(stroke: tablecolor)
// #set heading(numbering: "1.1.")


#align(center, [#text(30pt)[
  Equivalencias de Sobolev] \ #text(13pt)[P1 - Guía Manuel del Pino - EDP]
])

#bloque(Titulo: "Enunciado")[Sea $Omega subset RR^n$ abierto y $u in L^p (Omega)$ con $1 < p <= oo$. Pruebe las siguientes equivalencias:

1. $u in W^(1, p) (Omega)$.

2. Existe una constante $C>0$ tal que para todo $i = 1, ... N$ se tiene que para toda función test:
  $
    abs(lr(angle.l u \, (partial phi)/(partial nu) angle.r)) <= C norm(phi)_(L^(p^*) (Omega))
  $
  Donde $p^*$ es tal que $1/p + 1/p^* = 1$.

3. Existe una constante $C>0$ tal que para todo abierto $U subset subset Omega$ y todo $h in RR^n$ con $abs(h) < "dist"(U, Omega^c)$ se tiene:
  $
    norm(tau_h u - u)_(L^p (U) <= C abs(h)
  $

  Donde $tau_h u(x) = u(x + h)$.

  Además, se puede tomar $C = norm(grad u)_(L^p (Omega))$ en 2. y 3.
]

#dem[
== 1 => 2

La primera implicancia se sigue de la definición de derivada débil de $u$, y el hecho de que su norma $L^p (Omega)$ es finita, ambas propiedades que vienen de $u in W^(1, p) (Omega)$. Es decir:

$
  abs(lr(angle.l u \, (partial phi)/(partial nu) angle.r)) &= abs(integral_Omega u phi_(x_i) dif x) \
  &= abs(- integral_Omega u_(x_i) phi dif x) \
  &<= norm(u_(x_i))_(L^p (Omega)) norm(phi)_(L^(p^*) (Omega))
$

Aquí identificamos $C = (sum_(i = 1)^n norm(u_x_i)^p_(L^p (Omega)))^(1/p) = norm(grad u)_(L^p (Omega))$ que al ser suma de términos positivos y $x^(1/p)$ monótona, cumple con que $C>= norm(u_x_i)_(L^p (Omega))$. Luego:
$
  abs(lr(angle.l u \, (partial phi)/(partial nu) angle.r)) <= C norm(phi)_(L^(p^*) (Omega))
$

== 2 => 1 (Recuerdo de Funcional)

Esta implicancia sale *muy* rápido si recordamos el teorema de representación de Riesz:

#teorema[Representación de Riesz][Sea $1 <= p < oo$. Sea $f in (L^p (Omega))^star$. Entonces existe un único $v in L^(p^*) (Omega)$ tal que $f(phi) = integral_Omega v phi dif x$ para todo $phi in L^(p^*) (Omega)$. Además, $norm(f) = norm(v)_(L^(p^*) (Omega))$.]

Observando que la hipótesis es que el funcional lineal definido por $angle.l F, phi angle.r = integral_Omega u phi_x_i dif x$ es continuo en un subespacio denso de $L^p^* (Omega)$, que además cumple $1 <= p^* < oo$, entonces podemos extender mediante el teorema de Hahn-Banach a un elemento del dual que coincide para las $C^oo_c (Omega) subset L^p^* (Omega)$ (Recordemos que Hahn Banach es aplicable en funcionales sobre subespacios vectoriales continuos, pues la seminorma la podemos tomar efectivamente como la norma. Esto nos da continuidad para el funcional extendido, y si es un denso, entonces podemos obtener los otros valores tomando límites convenientes). Aplicamos Riesz, y obtenemos la definición de la derivada débil además con su norma ahí definida  (la última frase del enunciado).

== Quíen implica 3 a ver...

Para demostrar 3) trabajemos un poco a lo que debieramos llegar para saber si se nos ilumina un poco el camino:

$
  norm(tau_h u - u )_(L^p (U))^p &= integral_U abs(tau_h u - u)^p dif x \
  &= integral_U abs(u(x + h) - u(x))^p dif x
$
Mis instintos de física me gritan que use Taylor, pero el tema es que no estamos sacando derivadas en si. Pero bueno, algo podría salir si meto la definición y capaz ahí puedo acotar inteligentemente.

$
  integral_U abs(u(x + h) - u(x))^p dif x &= integral_U abs((u(x + h) - u(x))/h)^p abs(h)^p dif x \
  &= abs(h)^p integral_U abs((u(x + h) - u(x))/h)^p dif x
$

Ahora quedaría acotar esa integral. Ok veamos si esto iba bien en el brezis. Okey no, el cambio de variable que puedo usar tal que esto sea más sencillo utiliza 2 cosas:

1. Asumir que $u in C^oo_c (Omega)$, luego extenderemos el resultado a $L^p (Omega)$.

2. Definimos una derivada para la traslación. Para esto primero hay que parametrizar cuanto uno se traslada. Esto escrito en simple es definirse:

$
  nu: [0, 1] -> RR \
  nu(t) = u(x +t h)
$

Notemos que esto está bien definido pues $x + t h$ en $Omega$ gracias a la restricción sobre $h$. Además como suponemos $u in C^oo_c (Omega)$, podemos llegar y aplicar derivadas y todo. La idea entonces es usar el TFC.

$
  abs(u(x + h) - u(x))^p &= abs(integral_0^1 nu'(t) dif t)^p \
  &= abs(integral_0^1 grad u(x + t h) dot h dif t)^p 
  \ &<= abs(h)^p integral_0^1 norm(grad u(x + t h))^p dif t
$

Con lo que nuestro objeto de interés quedaría:

$
  norm(u(x + h) - u(x))_(L^p (U))^p <= abs(h)^p integral_U integral_0^1 norm(grad u(x + t h))^p dif t dif x
$

Ahora estamos casi listos para relacionar el lado derecho con la norma de $grad u$ en $L^p (Omega)$ (entonces nos damos cuenta que conviene usar la hipótesis (1)). Para hacer eso necesitamos volver a $grad u (y)$ en vez del $x + t h$ que definimos antes. Para eso, el Brezis usa Fubini. ¿Por qué podemos usar Fubini? Pues por hipótesis de continuidad la integral sobre $t$ es finita para todo $x$, y también por hipótesis de compacidad, $norm(grad u (x + t h))^p$ alcanza un máximo que lo define el hecho de que $norm(grad u)^p$ es continua, soporte compacto. Al estar $U$ contenido en un compacto, entonces tiene medida finita. Por esto, ambas integrales necesarias para Fubini son finitas, y podemos aplicar.

$
  integral_U integral_0^1 norm(grad u(x + t h))^p dif t dif x = integral_0^1 integral_U norm(grad u(x + t h))^p dif x dif t
$

Ahora esa cochinada de adentro podemos hacerle un cambio de variable. Sea $y = x + t h$. Luego:
$
  integral_0^1 integral_U norm(grad u(x + t h))^p dif x dif t = integral_0^1 integral_(U + t h) norm(grad u(y))^p dif y dif t
$

Recordemos que un supuesto sobre $norm(h)$ es que es menor que la distancia de $U$ al complemento de $Omega$. Esto nos permite decir que $U + t h subset Omega$ para todo $t$. Luego, podemos acotar la integral por la norma de $grad u$ en $L^p (Omega)$, y así quitamos la dependencia de t, por lo que esa integral evalúa 1 nomás. Así, finalmente obtenemos lo pedido:
$
  norm(u(x + h) - u(x))_(L^p (U))^p <= abs(h)^p norm(grad u)_(L^p (Omega))^p
$
]