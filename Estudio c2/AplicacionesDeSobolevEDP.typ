#import "../preamble.typ": *

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


#align(center, [#text(30pt)[
  Aplicaciones de los Espacios de Sobolev a EDP] \ #text(13pt)[Del capítulo 6 del Evans]
])

= Ecuaciones Elípticas:

#definición[
  Una ecuación elíptica es aquella que podemos escribir como:

  $
    L u &= f " en " U \
    u &= 0 " en " partial U
  $

  Donde el dominio $U$ es un abierto acotado subconjunto de $RR^n$. Aquí, el operador $L$ puede ser o bien de forma de divergencia:

  $
    L = partial_j a_(i j) partial_i + b_i partial_i + c
  $

  O bien de forma no-divergencia:

  $
    L = - a_(i j) partial_i partial_j + b_i partial_i + c
  $

  Aquí, los coeficientes $a_(i j), b_i, c$ son en general funciones.
]

#obs[ Si el coeficiente de mayor orden ($a_(i j)$) son funciones $C^1$ entonces un operador dado en forma de divergencia puede ser reescrito en forma no-divergencia y vice-versa. Sin embargo existen beneficios tangibles a escribir el operador de distintas maneras.]


#definición[Uniforme elipticidad.][Decimos que $L$ es _uniformemente elíptico_ si hay una constante $theta$ tal que se cumpla c.t.p que:
$
  a_(i j) xi_i xi_j >= theta abs(xi^2)
$
]

#definición[Formulación Débil][Inspirados en lo bello que puede ser la integración por partes, definimos la siguiente forma bilineal, que actúa sobre elementos de $H_0^1 (U)$:

$
  B[u, v] := integral_U a_(i j) (partial_i u) (partial_j v) + b_i (partial_i u) v + c u v dif x
$

Decimos que $u in H^1_0 (U)$ es una solución débil de la EDP si para cualquier $v in H^1_0(U)$:

$
  B[u, v] = (f, v)
$

Donde el RHS denota el producto interno de $L^2(U)$. Esta formulación la ecuación se puede extender un poquito más si consideramos que $f$ es un elemento del espacio dual de $H^1_0(U)$. Osea, $angle.l f, v angle.r = integral_U f^0 v dif x + f^i partial_i v dif x$.
]

#teorema[Lax-Milgram][Asumiendo que $B$ es una forma bilineal para la cual existen constantes $alpha, beta$ tal que:

$
  abs(B[u, v]) <= alpha norm(u) norm(b) \
  beta norm(u)^2 <= B[u, u]
$

Y asumiendo que $f$ es un elemento del dual de $H$, entonces la ecuación a estudiar (en su forma general) efectivamente _tiene solución única_.
]

== Estimaciones de Energía

La forma bilinear $B$ definida anteriormente efectivamente cumple las condiciones de Lax-Milgram. Esto lo podemos sacar con métodos energéticos:

#teorema[Estimaciones de Energía][Efectivamente, existen constantes $alpha, beta$ no nulas, positivas, y $gamma$ positiva (quizás nula) tal que:
$
  abs(B[u, v]) <= alpha norm(u)_(H^1_0 (U)) norm(u)_(H_0^1 (U)) \
  beta norm(u)_(H^1_0 (U))^2 <= B[u, u] + gamma norm(u)_(L^2(U))^2
$]