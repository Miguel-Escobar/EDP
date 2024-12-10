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
#set heading(numbering: "1.1.")


#align(center, [#text(30pt)[
  Ecuación de Onda] \ #text(13pt)[Ecuaciones en Derivadas Parciales]
])

= Definición de la ecuación de onda

#definición[Ecuación de Onda][La ecuación de onda para un dominio $U subset RR^n$ abierto, $t > 0$, y $f: U times \[0, infinity\) arrow.r RR$ dada es: 
$
  u_(t t) - Delta u = f
$
Sujeta a condiciones iniciales $u(x, 0) = g(x), u_t(x, 0)= h(x)$
]

= Soluciones a la ecuación homogénea mediante medias esféricas

Primero resolveremos la ecuación para dimensión 1 ($n = 1$), luego extenderemos el resultado mediante el _método de medias esféricas_. En esta sección siempre trabajaremos con $U = RR^n$ completo.

== Solución $n = 1$:

Gracias a la conmutatividad de las derivadas podemos reescribir la ecuación de onda 1D como:

$
  (partial_t + partial_x)(partial_t - partial_x) u = 0
$

Esto nos permite trabajar operador por opderador, es decir, consideramos primero $v$ una solución de:
$
  (partial_t + partial_x) v = 0
$

Esto es una ecuación de transporte, con solución $v(x, t) = v_0(x - t)$. Lo podemos encontrar explorando las curvas características, que en ecuaciones de transporte en verdad son rectas. Ahora consideremos que:

$
  v = (partial_t - partial_x) u
$

Esto es una ecuación de transporte nuevamente, sólo que esta vez es no homogénea. La solución viene dada por la fórmula:

$
  u(x, t) = g(x + t) + integral_0^t f(x - (s - t), s) dif s
$

con $f(x, t)$ siendo la parte inhomogénea. Es decir, en nuestro caso sería $v_0(x - t)$, y $g(x - t)$ sería la solución homogénea dada por las condiciones iniciales. Los signos vienen de la forma de la ecuación de transporte, ahora con un signo cambiado respecto a la anterior. Reemplazando la forma de $v_0$ tenemos que $integral_0^t v_0 (x - ( s - t ) - s) = integral_0^t v_0(x + t - 2s) = integral_0^t v_0(x + t - 2s)$ y con un cambio de variable $eta = x + t - 2s, med dif eta = -2 dif s$ queda $= integral_(x + t)^(x - t) -v_0(eta) (dif eta)/2 = integral_(x - t)^(x + t) v_0(eta) (dif eta)/2$. Así tenemos que:

$
  u(x, t) = g(x + t) + 1/2 integral_(x-t)^(x+t) v_0(eta) dif eta
$

Reemplazando las condiciones iniciales $g, h$, podemos reescribir $v_0 = h - partial_x g$ y así obtenemos la solución general, o la _fórmula de D'Alambert_:
$
  u(x, t) = 1/2 [g(x + t) + g (x - t)] + 1/2 integral_(x-t)^(x+t) h ( eta ) dif eta
$ <formulaDalambert>

Ahora mostraremos que esto efectivamente es una solución.

#teorema[Solución de la Ec. de Onda, $n = 1$][
  Asumiendo que $g in cal(C)^2(RR)$, $h in cal(C)^1(RR)$ si definimos $u$ como en la @formulaDalambert, entonces:
+ $u in cal(C)^2(RR times \[0, infinity\))$
+ $u_(t t) - u_(x x) = 0$
+ $lim_((x, t) arrow.r (x^0, 0), t>0)u(x, t) = g(x^0), lim_((x, t) arrow.r (x^0, 0), t>0) u_t(x, t) = h(x^0)$
]

#dem[Hay que aplicarle a la matraca nomás. Es decir, verificar que las segundas derivadas existan y que sean continuas.]

#obs[En general, consideremos $F, G$ suficientemente diferenciables. Definamos $u(x, t) = F(x + t) + G(x - t)$, notemos que:

$
  u_(x x) = F'' + G''
  u_(t t) = F'' - (- G')' = F'' + G''
$

Esto es, cumplen la ecuación de onda. En general estas son las soluciones, algunas con tiempo hacia adelante y otras con el tiempo hacia atrás. Todas son válidas.
]

#obs[La fórmula de D'Alambert también nos dice que las soluciones de la ecuación de onda no se ven suavizadas, a diferencia de las de la ecuación del calor. La suavidad depende de las condiciones iniciales.]

== Medias esféricas:

Para extender nuestros resultados a dimensiones superiores estudiamos primero las medias esféricas. Escribamos antes un poco de notación. Sea x en el interior del dominio:

$
  U(x; r, t) = integral.dash_(partial B(x, r)) u(y,t) dif S(y),
$

Similarmente, podemos definir este mismo promedio para las condiciones iniciales $G, H$. Notemos que si fijamos x, las medias esféricas cumplen la siguiente ecuación para (r,t):

#lema[Las medias radiales cumplen la ecuación de Euler-Poisson-Darboux:
$
  U_(t t) - U_(r r) - (n-1)/r U_r = 0\
  U = G, U_t = H
$

Además, si $u in cal(C)^k$, entonces $U in cal(C)^k$ también.
]

Esto es una ecuación de onda si hacemos un buen cambio de variables. La idea es que estamos buscando ahora ondas esféricamente simétricas, y me atrevo a decir que la solución van a ser ondas tipo $f(r - t)/r$ claro que con $r-t$ positivo. Okey ahora sigamos leyendo el libraco.

== Caso $n = 3$

Para este caso es más simple, así que supongamos que hay una solución de la ecuación de onda $u$. Entonces tomemos los siguientes trucazos:

$ 
  hat(U) := r U \
  hat(G) := r G, med hat(H) := r H
$

Veremos que esa $hat(U)$ si es solución de una ecuación de onda, con las condiciones de borde $hat(G), hat(H)$. De hecho, calculando sus derivadas la igualdad sale altiro, si reemplazamos adecuadamente. Lo que queda ver es que las condiciones de borde son las correctas. Bueno esto se da altiro por definición de las variables con gorrito.

Aplicamos entonces la fórmula de D'Alambert:

$
  hat(U)(r, t ; x) = 1/2 [hat(G)(r + t) - hat(G)(t - x)] + 1/2 integral_(-r + t)^(r + t) hat(H) (y) dif y
$
#obs[Aquí los límites de la integral son distintos, pues la fórmula de D'Alambert es válida para cuando el dominio espacial es todo $RR$, entonces hay que aprovecharse de que en $r = 0$ necesariamente es 0 $hat(U)$, con lo que podemos buscar una extensión impar. Esto lo que termina haciendo es cambiar unos signos nomás.]

Reemplazando de vuelta en las definiciones correspondientes, y tomando el límite cuando $r arrow.r 0$ llegamos a la fórmula de Khirchhoff (que tiene 2 formas equivalentes):

$
  u(x, t) &= partial_t (t integral.dash_(partial B(x, t)) g dif S) + 1/(2r) integral.dash_(partial B(x, t)) h(y) dif S(y) \
  &= integral.dash_(partial B(x, t)) t h(y) + g(y) + D g(y) dot (y - x) dif S(y)
$

Ojo que aquí hicimos un truco para calcular $partial_t integral.dash_(partial B(x,t)) g(y) dif S(y)$, que consiste en básicamente justificar que lo que crece esa integral es la integral de la parte del gradiente que apunta hacia afuera de la bola.

== Caso $n = 2$:

No existe una transformación con la de 2 dimensiones. Agregaremos una tercera dimensión ficticia tal que no aparezca en la fórmula. Trivialmente, si suponemos que existe una solución en $RR^2$ podemos extenderla a $RR^3$ sin dramas, simplemente haciendo que sean constantes en la tercera dimensión. Sin embargo, las integrales en la solución de Kirchhoff si cambiarían, ahora siendo en $RR^3$ la tercera dimensión sí tiene un efecto. Denotemos como $overline(B)(x, t)$ la bola en $RR^3$.

$
  integral.dash_(partial overline(B)(x, t)) g dif S &= 1/(4 pi t^2) integral_(partial overline(B)(x, t)) g dif S
  &= 2/(4 pi t^2) integral_(B(x, t)) g(y)(1 + abs(D gamma(y))^2)^(1/2) dif y 
$

Donde $gamma(y) = (t^2 - abs(y - x)^2)^(1/2)$ es la altura del cascarón esférico en $RR^3$ con respecto al punto del disco $y in B(x, t) subset RR^2$. El 2 sale porque hay 2 hemisferios de la bolita. Esto es un cálculo puramente geométrico. Después de algo de matraca de la dura, llegamos a que:

$
  u(x, t) = 1/2 integral.dash_(B(x, t)) (t g(y) + t^2 h(y) + t D g(y) dot (y - x))/(t^2 - abs(y - x)^2)^(1/2) dif S(y)
$

Esta es la fórmula de Poisson para la ecuación de onda en 2 dimensiones.

== Solución para n impares:

Podemos generalizar el procedimiento realizado acá para los $n$ impares, luego bajar una dimensión a los $n$ pares. La matraca en verdad se pone densa, así que es mejor revisar el Evans en detalle, porque no tengo tiempo de replicarla acá. La idea es la misma si, sólo que con cambios de variables más complicados. Finalmente se llega a que:

$
  u(x, t) = 1/(gamma_n) [partial_t (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) g dif S) + (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) h dif S) ], \ gamma_n = 1 dot 3 dot 5 dot dot dot (n-2)
$

== Solución para n pares:

Haciendo nuevamente el truco de reducción de la dimensionalidad obtenemos que:

$
  u(x, t) = 1/gamma_n [ partial_t (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) g(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) + (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) h(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) ], \ gamma_n = 2 dot 4 dot 6 dot dot dot n
$

== Principio de Hyugens

El principio de Hyugens nos habla de una característica fundamental que distingue a las soluciones de la ecuación de onda en dimensiones pares v/s impares. Esto es, que en dimensiones impares las condiciones iniciales sólo importan en el frente de onda, osea, si tenemos una perturbación en un x dado, _para las soluciones en dimensión impar esta perturbación sólo se va a sentir en el frente de onda_, sin embargo, _cuando estamos en una dimensión par, se va a sentir en el frente de onda y además en el interior_. Esto lo podemos ver pictóricamente imaginandonos una gota que cae en un vaso, no sólo se va a sentir una pura ondita sino que también van a venir ondas más chicas tipo réplica. Sin embargo, en el interior del vaso sólo se va a sentir el golpe de la gota, no el resto de las ondas en la superficie. Pucha en verdad no es tán pictórico el ejemplo, pero es lo que hay ah no se quejen.

= Solución de la ecuación de onda inhomogénea

La idea acá es utilizar el _principio de Duhamel_ que nos permite usar una familia de soluciones a la ecuación de onda homogénea con condiciones iniciales parametrizadas con $s in RR$ para luego obtener una solución de la ecuación inhomogénea integrando sobre los $s$. Cachense el meo truquito:

#definición[$u(dot, s)$][Dado el problema inhomogéneo efinimos $u(dot; s) = u(x, t; s)$ como la familia de soluciones a la ecuación de onda homogénea para $t >= s$:
$
  u_(t t)(dot; s) - Delta u (dot; s)= 0 \
  u( dot ; s) = 0, thick u_t( dot ; s) = f(dot, s) " cuando " t = s.
$]

#teorema[Solución a la ecuación de onda inhomogénea][Asumiendo que $n >= 2, f in cal(C)^([n/2]+1)(RR^n  times [0, infinity)),$ y dada la familia de funciones $u( dot ; s)$ definida anteriormente, tenemos que la función definida como:
$
  u(x, t) = integral_0^t u(x, t; s) dif s
$
es una solución a la ecuación de onda inhomogénea, $u in cal(C)^2(RR^n times [0, infinity))$.]

= Métodos basados en energía:

A medida que subimos la dimensión del problema pareceos necesitar condiciones iniciales cada vez más suaves para tener una solución $cal(C)^2$. Veremos que usando la energía podremos extraer resultados más naturales al respecto, partiendo por la unicidad de la solución.

== Unicidad

Cambiando un poco la notación para ahora trabajar con dominios espaciales con frontera no nula, es decir $U subset.neq RR^n$. Fijaremos también $U_T = U times (0, T], thick Gamma_T = overline(U)_T - U_T$. Esto es casi lo mismo que antes, sólo que ahora también hay una condición de borde en la frontera que puede depender del tiempo (imaginen a alguien haciendo mover la cuerda).

#definición[Energía de una solución de la ec. de onda][Dado $omega$ que solucione la ecuación de onda, podemos definir su energía como:
$
  E_omega (t) := 1/2 integral_U omega_t^2 + norm(D omega)^2 dif x
$
]

#propiedad[Si la ecuación de onda es homogénea, con velocidad inicial nula y condiciones de borde fijas (osea $g$ no es una función del tiempo jamasitas):
$
  partial_t E(t) &= 1/2 integral_U 2 omega_t omega_(t t) + 2 D omega dot partial_t D omega dif x \
  &= integral_U omega_t w_(t t) + sum_i (omega_(x_i) w_(x_i t))
$

Integrando por partes el segundo término:

$
  &= integral_U omega_t omega_(t t) - integral_U omega_t Delta omega dif x + sum_i integral_(partial U) underbrace(omega_t, = 0 ", condiciones de borde fijas.") omega_x_i nu^i dif S \
  &= integral_U omega_t (omega_(t t) - Delta omega) dif x
  &= 0
$

Es decir, la energía es constante en el tiempo.
]

Esta última propiedad permite demostrar la unicidad de la solución. Se sigue directamente de la propiedad anterior aplicada sobre la resta de 2 soluciones, y la energía inicial es 0 pues coinciden en la condición de borde.

== Dominio de dependencia

Digamos que fijamos un punto en el espacio-tiempo $(x_0, t_0)$. Definimos su cono del pasado como $K(x_0, t_0) := {(x, t) | 0 <= t <= t_0, norm(x - x_0) <= t_0 - t}$.

#teorema[Velocidad finita de propagación][Podemos demostrar que si $u eq.triple u_t eq.triple 0$ en $B(x_0, t_0)$ con $t = 0$, entonces $u eq.triple 0$ en todo el interior del cono del pasado.]

Es decir, si tengo un radio donde sé que mi superficie está en reposo, si llega un random y me tira una perturbación, sé que _al menos_ le va a demorar un radio/velocidad en llegar a mi. En este caso matemático, la velocidad es 1 por eso la simplicidad de las expresiones.


