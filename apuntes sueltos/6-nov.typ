#import "preamble.typ": *

#set text(
  font: "JetBrainsMono NF",
  fill: textcolors.at(0), 
  lang: "es")
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
  Apuntes] \ #text(13pt)[EDP clase 6 de Noviembre]
])

#obs[No estoy al día así que voy a anotar cosas sueltas nomás]

= Extensión de Sobolev

#teorema[Extensión][Sea $1 <= p <= infinity$, $Omega subset RR^n$ acotado, $partial Omega in C^1$, $u in W^(1, p)(Omega)$. Sea $Omega subset subset V$, con $V$ abierto. Existe un operador lineal acotado $E: W^(1, p)(Omega) -> W^(1, p)(V)$ tal que:
1.  $E u = u$ en $Omega$
2. $"supp"(E u) subset V$]

#dem[
Para demostrar seguiremos la siguiente estructura:

1. Tomar un borde tal que como que parece plano todo
2. Extender la función con respecto a ese plano en una bolita.
3. Llenar todo de bolitas y llevarlo a la extensión global.

Esto es bastante con las manos. Tomemos un borde plano, y sea $x'$ la reflexión de $x$. Definimos la extensión local como:
$
  tilde(u)(x) = cases(
    u(x) "si" x in Omega,
   -3u(x') + 4 u(x') "si" x in Omega')
$

Con esta, podemos ver que es $C^1$ y más aún su norma está acotada por $C norm(u)_W$
]


