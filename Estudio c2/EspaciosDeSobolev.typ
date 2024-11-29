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


#align(center, [#text(30pt)[Espacios de Sobolev] \ #text(13pt)[Cap. 5 del Evans]
])

= Espacios de Hölder

A modo de introducción, estudiemos unos espacios enteros penca que son los Hölder.

#definición[Hölder continuidad][Una función se dice Hölder continua de exponente $gamma$ si cumple:
$
  abs(u(x) - u(y)) <= C abs(x - y)^gamma
$]

#definición[Seminorma de Hölder][La $gamma$-ésima seminorma de Hölder de $u$ es:
$
[u]_(C^(0, gamma) (overline(U))) := sup_(x, y in U \ x != y) {abs(u(x) - u(y))/abs(x - y)^gamma}
$
]

#definición[Norma de Hölder][Definimos la norma de Hölder de $u$ como:
$
  norm(u)_(C^(0, gamma) (overline(U))) := sup_(x in U) med abs(u(x)) + [u]_(C^(0, gamma) (overline(U)))
$]

#definición[Espacio de Hölder][El espacio de Hölder $C^(k, gamma) (overline(U))$ osn simplemente todas las funciones que tienen norma de Hölder finita para hasta la $k$-ésima derivada. Equivalentemente, aquellas funciones para las cuales:

$ 
  norm(u)_(C^(k, gamma) (overline(U))) := sum_(abs(alpha) <= k) sup_(x in U) {abs(D^alpha u(x))} + sum_(abs(alpha)=k) [D^alpha u]_(C^(0, gamma) (overline(U))) < infinity
$
]

#teorema[Los espacios de Holder son Banach]

Ya listo, estos espacios no los usaremos jamás así que chao nomás.

= Espacios de Sobolev

Ya ahora sí, estos son los wenos... Escribamos unas definiciones base:

#definición[Derivada débil][Sea $u in L^1_"loc"(U)$ y $alpha$ un multiíndice. Si esque existe una función $v in L^1_"loc"$ tal que para toda función test $phi$:
$
  integral_U u D^alpha phi dif x = (-1)^abs(alpha) integral_U v phi dif x
$

Entonces decimos que $v$ es la $alpha$-ésima derivada débil de $u$, denotada $D^alpha u$.
]


#propiedad[Unicidad][La derivada débil está únicamente definida salvo conjuntos de medida nula]

#dem[Restando 2 derivadas débiles de $u$ vemos que para toda función test integran 0.]

#obs[Cómo demostramos que una función no tiene n-ésima derivada débil? Obviamente nuestra fiel amiga la contradicción, e utilizar adecuadamente las funciones test. Demostremos por ejemplo que:
$
  u(x) = cases(delim: "{",x "si" 0 < x <= 1, 2 "si" 1< x < 2)
$

no tiene primera derivada débil. Supongamos que existe una función $v$ que cumpla la definición de derivada débil. Luego, nos aprovecharemos de que podemos integrar hasta la parte donde hay una discontinuidad de la función $u$.

$
  - integral_0^2 v phi dif x = integral_0^2 u phi' dif x = integral_0^1 x phi' dif x + 2 integral_1^2 phi' dif x
$

Integrando por partes el primer término obtenemos:
$
  = -integral_0^1 phi dif x + 2 ( 0 - phi(1))
$

Ojo que $phi(2)$ es 0 pues consideramos funciones test dentro del dominio, que es un abierto. Luego siempre son 0 en los bordes. La integral entonces nos dice que
$
  integral_0^2 v phi dif x - integral_0^1 phi dif x = phi(1)
$

Ahora, podemos tomar algunos límites que nos anulen el lado izquierdo pero mantengan el derecho. El límite que toma el Evans es $0 <= phi_m <= 1, phi_m(1) = 1, phi_m (x != 1) arrow.r 0$. Naturalmente entonces, por teorema de convergencia dominada podemos concluir que el lado izquierdo integra a 0, mientras que el derecho se mantiene en 1. Una contradicción.
]

== Definición del espacio de Sobolev

#definición[Espacio de Sobolev][Definimos el espacio de Sobolev $W^(k, p) (U)$ como el conjunto de funciones tales que todas sus derivadas débiles hasta el orden $k$ existen y además pertenecen a $L^p(U)$.]

#definición[Norma del espacio de Sobolev][Definimos la norma del espacio de Sobolev como:
$
  norm(u)_(W^(k, p) (U)) := sum_(abs(alpha) <= k) (norm(D^alpha u)_(L^p(U))^p)^(1/p)
$]

#definición[Localmente Sobolev][$u in W_"loc"^(k, p) (U)$ ssi $forall V subset U$, $V$ contenido en un compacto en $U$, $u in W^(k, p) (V)$]

#definición[$W_0^(k, p) (U)$][Denotamos la cerradura de las funciones test en $W^(k, p) (U)$ como $W_0^(k, p) (U)$]

#obs[Notemos que todas las funciones test y sus derivadas son necesariamente $L^p$ si usamos una medida de Radón (es decir, finita para compactos) (válido para la medida de Lebesgue). Luego, las funciones test están en todos los Sobolev.]

#ejemplo[Veamos un ejemplo feo de una función Sobolev. Veamos cuándo la función $u(x) = abs(x)^(-alpha)$ está en $W^(1, p) (B(0, 1))$. Para esto hay que saber cuándo la primera derivada débil de $u$ existe y es integrable en el 0, pues en el resto del dominio es suave y como que todo okey cierto? Entonces verifiquemos que esta función es en efecto la derivada débil.

$
  u_x_i (x) &= -alpha abs(x)^(-alpha - 1) x_i/abs(x)
$

$
  implies integral_(U - B(0, epsilon)) u phi_x_i dif x = - integral_(U - B(0, epsilon)) alpha abs(x)^(-alpha - 1) x_i/abs(x) phi dif x - integral_(partial B(0, epsilon)) u phi nu^i dif S
$

Acá, mi $nu$ es la normal de la bolita que apunta hacia afuera, por eso ese signo menos. ¿Qué podemos hacer ahora? Resulta que uno de estos términos ya podemos llegar y acotarlo no? El segundo término podemos acotarlo, pues $phi in L^(infinity)$ y por otro lado, la función $u$ en el borde de la bola es constante. Luego:

$
  abs(integral_(partial B(0, epsilon)) u phi nu^i dif S) &<= norm(phi)_(L^(infinity)) integral_(partial B(0, epsilon)) abs(u) dif S \
  &= norm(phi)_(L^(infinity)) integral_(partial B(0, epsilon)) epsilon^(-alpha) dif S \
  &= norm(phi)_(L^(infinity)) epsilon^(-alpha) dot C epsilon^(n-1)
$

Aquí $C$ es una constante que viene de la fórmula para el área de una esfera en $n$ dimensiones ah. Okey, ¿qué nos dice esto? Que si $n - 1 > alpha$, entonces cuando tiro el epsilon a 0 eso no me va a dar problemas. Esto me permite concluir que en este régimen, la función $u_x_i$ es efectivamente la derivada débil de $u$.

Ahora queremos ver cuándo esta función está efectivamente en $L^p$. Podemos rápidamente usar una integral en esféricas y tirar los límites para ver que si $(alpha+1)p < n$, entonces $abs(D u(x))^p$ es integrable. Entonces los alpha que buscamos son $alpha < (n - p)/p$. En particular, si $p >= n,$ entonces $ u in.not W^(1, p) (U)$
]

#propiedad[Propiedades de las derivadas débiles][Sea $u in W^(k, p) (U), abs(alpha) <= k$
+ $D^alpha u in W^(k - abs(alpha), p) (U)$, y además las derivadas parciales débiles conmutan hasta el orden donde son integrables en $L^p$.

+ Hasta el orden $k$, derivar débilmente es una operación lineal.

+ Si $V subset U$ abierto, entonces $W^(k, p) (V) subset W^(k, p)(U)$

+ Si $zeta in C_0^infinity$, entonces $zeta u in W^(k, p)(U)$ y se cumple la fórmula de Leibniz.
]

== Teoremas de aproximación

*Pequeño recuerdo de molificadores:*

Dado $U subset RR^n$ abierto, denotamos $U_epsilon := {x in U | op("dist")(x, partial U ) > epsilon}$. Podemos definir un molificador $eta_epsilon in C^infinity(RR^n)$ como:

$
  eta(x) := cases(C exp(1/(abs(x)^2- 1)) "si " abs(x) < 1, 0 "si " abs(x) >= 1) \
  eta_epsilon (x) := 1/epsilon^n eta(x/epsilon)
$

$eta_epsilon$ se conoce como el molificador estándar. La gracia es que podemos convolucionarlo con una función para obtener una versión $C^infinity$ de la función.

#definición[Molificación de $f$][Si $f : U arrow.r RR$ cumple que $f in L^1_"loc"$ entonces definimos su molificación $f^epsilon$ como:
$
  f^epsilon (x) := eta_epsilon * f(x)
$

A esta función le restringimos su dominio a $U_epsilon$
]

#propiedad[
  + $f^epsilon in C^infinity(U_epsilon)$
  + $f^epsilon arrow.r f$ c.t.p cuando $epsilon arrow.r 0$
  + $f in C(U) implies $ la convergencia de $f^epsilon arrow.r f$ es uniforme en compactos.
]

*fin recuerdo molificadores*

#teorema[Aproximación por molificación][Si tenemos una función sobolev $u in W^(k, p) (U)$ _con $p$ finito_. Entonces los molificadores $u^epsilon = eta_epsilon * u$ definidos en $U_epsilon$ no sólo son suaves, sino que también convergen localmente en la norma de Sobolev.]

#dem[Es suave pues la derivada de la convolución se la puedo pasar al molificador. Converge localmente pues podemos tirar las derivadas débiles al $u$ ]

#teorema[Aproximación por funciones suaves][*Asumiendo que el dominio U es acotado*, y nuevamente que $p$ es finito, entonces existen funciones $u_m$ suaves y Sobolevs del mismo orden que $u$ tal que $u_m arrow.r u$. Aquí, no tenemos ningún presupuesto sobre la frontera de $U$.]

#dem[
  Marciana...
]

#teorema[Aproximación por funciones suaves en la cerradura del dominio][*Asumiendo U acotado y $partial U$ es $C^1$*. Nuevamente, $p$ debe ser finito. Entonces existen funciones $u_m in C^infinity(overline(U))$ _suaves sobre la cerradura de U_ tales que aproximan $u$ con la norma de Sobolev.]

== Extensiones

Muchas veces será util considerar la extensión de una función sobolev en un dominio $U$ a sobolev en todo $RR^n$.

#teorema[Teorema de Extensión][Asumir que el dominio de partida $U$ es acotado y $C^1$, y además, que hay un conjunto abierto acotado $V$ que lo contiene compactamente. Entonces, si $u in W^(1, p) (U)$, existe una extensión $v in W^(1, p) (RR^n)$ tal que $v = u$ c.t.p en $U$, el soporte de $v$ está contenido en $V$ y además $norm(v)_(W^(1, p) (RR^n)) <= C norm(u)_(W^(1, p) (U))$. Más aún, el operador que asocia a cada $u$ su extensión $v$ es un operador lineal acotado.]

#dem[En verdad voy a comentar nomás la demostración:

- Primero, suponemos que el borde es planito. La idea es que después podemos relajar esto porque el borde es $C^1$.

- Aquí, podemos trabajar con una bolita justo en la frontera, y considerar la reflexión de $u$ en el borde.

- De ahí, podemos darnos cuenta que la norma de la extensión es simplemente una constante multiplicada por la norma de $u$ en la parte donde está bien definida.

- Desdoblamos la frontera usando un truco de composición nomás.

- Extendemos la extensión a todo $RR^n$ usando un recubrimiento finito de abiertos sobre la frontera, con las extensiones asociadas, y multiplicamos cada una por una partición de la unidad subordinada a esos abiertos. Esto nos permite ganar.
]

#obs[Si el borde es $C^2$, también podemos extender las funciones a $W^(2, p)(RR^n)$]

== Traza

#teorema[Traza][Supongamos $U$ acotado y $C^1$. Entonces, existe un operador lineal continuo (u acotado) tal que:
$
  T : W^(1, p) (U) arrow.r L^p (partial U)
$

- Además, si $u$ es continua hasta la frontera (incluida), $T u = u|_(partial U)$.
- Y para cualquier u: $norm(T u)_(L^p (partial U)) <= C norm(u)_(W^(1, p) (U))$
]

A este operador lo llamamos la "traza" de u.

#teorema[Funciones con traza 0][Sea $U$ *acotado y $partial U$ $C^1$*. Entonces, si $u in W^(1, p)_0 (U)$ tenemos la siguiente equivalencia:
$
  u in W_0^(1, p) (U) iff T u = 0
$]

== Desigualdades de Sobolev

La idea es que queremos saber cuando una función de Sobolev automáticamente está en algún otro espacio de Sobolev u $L^p$, lo que salga. Así que démosle, escupamos factos.

Para el primer resultado de este tipo, quisieramos saber si las normas de las derivadas nos pueden decir algo sobre las normas de lo no derivado. En específico, quisieramos saber cuándo $norm(u)_(L^q (RR^n)) <= C norm(D u)_(L^p (RR^n))$. Resulta que si consideramos que se cumpla, entonces necesariamente obtenemos algunas restricciones al tomar funciones tipo $u_lambda (x) := u(lambda x)$. Aquí, inmediatamente vemos que obtendríamos contradicciones si $1 - n/q + n/q != 0$. Entonces necesariamente $q = (n p)/(n - p)$. Formalicemos todo esto en un teorema:

#teorema[Gagliardo-Nirenberg-Sobolev][Asumamos que $1 <= p < n$. Entonces se cumple que para toda función $u in C^1_c(RR^n)$:
$
  norm(u)_(L^p^* (RR^n)) <= C norm(D u)_(L^p (RR^n))
$

Donde $p^* = (n p)/(n - p)$ es el conjugado de Sobolev de $p$ que pillamos antes.
]

#teorema[Estimadores para W^(1, p)][Si U es un conjunto abierto y acotado $subset RR^n$, y con frontera $C^1$. Asumamos que $p<n$. Entonces, para toda función $u in W^(1, p) (U)$ se cumple que $u in L^(p^*) (U)$, con una cota sobre la norma:

$
  norm(u)_(L^(p^*) (U)) <= C norm(u)_(W^(1, p) (U))
$
]

#teorema[Estimadores para $W_0^(1, p), 1 <= p < n$][Ahora los supuestos son $U$ un abierto acotado, y $u in W_0^(1, p) (U)$. Ahora la desigualdad es:
$
  norm(u)_(L^(q) (U)) <= C norm(D u)_(L^p (U))
$

Ahora *para cualquier $q in [1, p^*]$*. En particular:
$
  norm(u)_(L^(p) (U)) <= C norm(D u)_(L^p (U))
$

Esto también se conoce como la _desigualdad de Poincaré_]

#teorema[Desigualdad de Morrisey][Ahora, si *$n < p <= infinity$*, entonces TAMBIÉN hay una desigualdad útil. En este caso es con la norma cochina de los Hölder. Es decir, para todo $u in C^1 (RR^n)$, entonces:
$
  norm(u)_(C^(0, gamma)) <= C norm(u)_(W^(1, p) (RR^n))
$

Aquí, *NECESARIAMENTE $gamma = 1 - n/p$*]