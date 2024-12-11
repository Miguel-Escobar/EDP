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
  Problema de Neumann] \ #text(13pt)[P3 - Guía 6 - EDP]
])

#bloque(Titulo: "Enunciado")[
  Suponga que $Omega subset RR^N$ es conexo. Decimos que $u in H^1 (Omega)$ es una solución débil del problema de Neumann
  $
    -Delta u = f "en" Omega, \
    (partial u)/(partial nu) = 0 "en" partial Omega
  $
  si
  $
    integral_Omega nabla u dot nabla v dif x = integral_Omega f v dif x, thick forall v in H^1(Omega)
  $

  Suponiendo $f in L^2 (Omega)$. Pruebe que el problema tiene una solución débil _ssi_
  $
    integral_Omega f dif x = 0
  $
]

== Ideas informales

Lo que nos dicen las condiciones de Von Neumann es que no hay crecimiento en los bordes de la región $Omega$. Por otro lado, la ecuación de Poisson es típica de cosas donde tenemo "fuentes" de campo, nos dice que el gradiente de $u$ tiene como "fuente" la distribución $f$. En el caso de electrodinámica, la ley de Gauss es un ejemplo, como formulación equivalente de la ecuación de Poisson para el potencial. También  Ahora cómo ayuda esto a Huachipato, no lo tengo muy claro. Sigamos el tip de la Jessica, y empecemos a hacer integraciones por partes con una función test.

== Buscando la forma bilineal

Supongamos $v in H^1 (Omega)$ cualquiera. Probemos la solución de manera débil. Aquí tendríamos que:

$
  - integral_Omega v Delta u dif x &= integral_Omega v f dif x
$

Ahora la gracia es integrar por partes:

$
  integral_Omega grad u dot grad v dif x - integral_(partial Omega) v grad u dot nu dif x = integral_Omega f v dif x
$

Hagamos entonces lo que nos piden.
== $underline(implies)$ Suponer que $integral_Omega f dif x = 0$


// Para imponer la condición de borde, quisieramos que ese término de borde siempre se anule. De alguna manera, queremos vincular esto con una condición sobre $f$. Podríamos tomar $v_m in C^oo (Omega) sect H^1(Omega)$, y una bolita $B$ compactificada contenida en $Omega$ tal que $v_m (x) = 1$ para $x in m B sect Omega$ y $v_m (x) = 0$ para $x in.not  (m+1)B sect Omega$. Esto permite calcular cosas sobre el lado izquierdo de la ecuación.

// $
  
// $