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
#set heading(numbering: "P1.a)")


#align(center, [#text(30pt)[
  Tarea 2] \ #text(13pt)[Ecuaciones en Derivadas Parciales]
])

= $1 <= p < infinity$, $U$ acotado
== Propiedades de $u^+, u^-$:

Para verificar que $u^+, u^- in W^(1, p) (U)$ es necesario verificar que $u^+, u^- in L^p (U)$ y que sus derivadas parciales existen en el sentido débil (osea, igualdades c.t.p) y pertenecen a $L^p (U)$. Empecemos:

=== $u^+ in L^p (U)$:

Sabemos que $u in W^(1, p) (U)$, lo que implica $u in L^p (U)$. Luego, tenemos que:

$
  norm(u^+)_(L^p (U)) &= (integral_(U) abs(u^+)^p dif lambda)^(1/p) \
  &= (integral_(U) abs(max(u, 0))^p dif lambda)^(1/p) \
  &<= (integral_(U) abs(u)^p dif lambda)^(1/p) \
  &= norm(u)_(L^p (U)) < infinity
$

Aquí, usamos que el valor $abs(max(u, 0))$ es siempre menor o igual a $abs(u)$, ya que $abs(u) >= 0$, y que al estar en $L^p (U)$, entonces $norm(u)_(L^p (U)) < infinity$. Por lo tanto, $u^+ in L^p (U)$.

=== $u^- in L^p (U)$:

De manera análoga, tenemos que:

$
  norm(u^-)_(L^p (U)) &= (integral_(U) abs(u^-)^p dif lambda)^(1/p) \
  &= (integral_(U) abs(min(u, 0))^p dif lambda)^(1/p) \
  &<= (integral_(U) abs(u)^p dif lambda)^(1/p) \
  &= norm(u)_(L^p (U)) < infinity
$

Por lo tanto, $u^- in L^p (U)$.

=== Derivadas débiles de $u^+, u^-$:

Para esto, enunciaré el siguiente lema:

#lema[Regla de la cadena débil][Sea $1 <= p < infinity, U$ acotado. Si $u in W^(1, p) (U)$ y $g in C^1 (R)$ acotada y con derivada acotada, entonces $g(u) in W^(1, p) (U)$ y $D_i (g(u)) = g'(u) D_i u$ en el sentido débil.]

#dem[ Primero, recordemos que para una función $u in W^(1, p) (U)$, con $U$ un abierto acotado y $p < infinity$ se tiene que existe una familia de funciones $(u_m)_(m in NN) subset C^(infinity) (U) sect W^(1, p) (U)$ tales que $u_m arrow_(W^(1, p) (U)) u$. Por lo tanto, tenemos que en particular $u_m arrow_(L^p (U)) u$ y en consecuencia, hay una subsucesión (que para evitar muchos subíndices, asumiremos igual a la sucesión completa), tal que $u_m arrow u$ puntualmente salvo un conjunto de medida nula. La continuidad de $g$ permite entonces asegurar que $g(u_m) arrow g(u)$ puntualmente salvo un conjunto de medida nula. Notemos que si $g$ además es acotada, podemos aplicar el teorema de convergencia dominada para obtener:
$
  integral_U g(u) D_i phi dif lambda &= lim_(m -> infinity) integral_U g(u_m) D_i phi dif lambda \
  &= lim_(m -> infinity) - integral_U g'(u_m) D_i u_m phi dif lambda arrow " la IPP y la derivada \n son en el sentido usual" \
  &= - integral_U g'(u) D_i u phi dif lambda \
$

La última igualdad la obtenemos por TCD utilizando la cota sobre g' y una cota sobre la subsucesión con convergencia puntual de $D_i u_m$ que obtenemos usando el TCD inverso, es decir, dado que $D_i u_m arrow_(L^p (U)) D_i u$, entonces existe una subsucesión $u_m$ que converge puntualmente c.t.p y una función $f in L^p (U)$ que la domina. En este espacio de medida finita, $L^p implies L^1$. Los términos de borde de la IPP no afectan pues $phi$ es función test, luego $0$ en los bordes.

Como esto es válido para cualquier función test $phi in C^(infinity)_c (U)$, entonces $D_i (g(u)) = g'(u) D_i u$ en el sentido débil (c.t.p).

Veamos que además es cierto que $g(u) in L^p (U) and g'(u) D_i u in L^p (U)$:

$
  integral_U abs(g(u))^p dif lambda &<= integral_U g_max^p dif lambda =g_max^p mu(U) < infinity \
  integral_U abs(g'(u) D_i u)^p dif lambda &<= integral_U g'_max^p abs(D_i u)^p dif lambda = g'_max^p integral_U abs(D_i u)^p dif lambda < infinity
$

Aquí aprovechamos que $U$ es acotado, luego tiene medida de Lebesgue finita. Con esto, queda demostrado el lema.
]

Notemos que el $F_epsilon$ propuesto cumple con las hipótesis del lema $forall epsilon > 0$ (es continua y derivable por construcción, y podemos ver que $0 <= F'_epsilon (x) = max{0, z/sqrt(z^2 + epsilon^2)} <= 1$). Por lo tanto, invocando al lema, $forall epsilon > 0, F_epsilon (u) in W^(1, p) (U)$. Nos falta ver que $epsilon arrow 0 implies F_epsilon (u) arrow_(L^p (U)) u_+ $:

$
  norm(F_epsilon (u) - u_+)_(L^p (U)) &= norm(bb(1)_{u >= 0} (sqrt(u^2 + epsilon^2) - epsilon - u))_(L^p (U)) \
  &<= norm(bb(1)_{u >= 0}(sqrt(u^2 + epsilon^2) - u))_(L^p (U)) + norm(bb(1)_{u >= 0} epsilon)_(L^p (U)) \
$
Tenemos convergencia puntual monótona decreciente (c.t.p) para ambos términos cuando $epsilon -> 0$. Luego, por TCM obtenemos que $norm(F_epsilon (u) - u_+)_(L^p (U)) -> 0$.

Y por último, nos falta ver que $D_i F_epsilon (u) arrow_(L^p (U)) bb(1)_{u >= 0} D_i  u$. Esto es directo pues ya vimos que $F'_epsilon (u) = bb(1)_{u >= 0}(u/sqrt(u^2 + epsilon^2))$ que es una sucesión monótona creciente cuanto $epsilon -> 0$, convergente a $1 in L^p (u)$. Luego, por TCM, $integral_U abs(F'_epsilon (u) D_i u)^p dif lambda arrow integral_U bb(1)_{u >= 0}abs(D_i u)^p dif lambda $. 

Con esto, $F_epsilon (u)$ converge con la norma de Sobolev $norm(dot)_(W^(1, p) (U))$ a $u^+$, que por completitud de los espacios de Sobolev debe ser miembro de ese mismo espacio. El límite además es único. Por lo tanto, $u^+ in W^(1, p) (U)$, y su derivada débil corresponde a la que converge la derivada débil de $F_epsilon (u)$, es decir, es igual c.t.p a $D_i u^+$.

Ahora, para demostrar el resultado de $u^-$, notaremos primero que $u^- = (-u)^+$. Como el espacio de Sobolev es un espacio vectorial, $-u in W^(1, p) (U)$. Por lo tanto, aplica el resultado recién demostrado, y obtenemos que $(- u )^+ in W^(1, p) (U)$ y su derivada débil es $(D_i (-u))^+$ (c.t.p). Notemos que esto equivale a que $u^- in W^(1, p) (U)$ y que su derivada débil sea $-D_i u$ cuando $-u > 0$, y $0$ cuando $-u <= 0$. Reorganizando las desigualdades, vemos que esto es equivalente al $D_i u^-$ definido en el enunciado.

== Aplicación a $abs(u)$:

Notemos que:
$
  abs(u) = u^+ + u^-
$

El espacio de Sobolev es un espacio vectorial. Luego, por linealidad, podemos concluir (dado que acabamos de demostrar que $u^+, u^- in W^(1, p) (U)$) que $abs(u) in W^(1, p) (U)$ y que su derivada débil es $D_i abs(u) = D_i u^+ + D_i u^-$.

== Aplicación a $D u$:

Ahora notemos que

$
  norm(D u)^2 &= D u dot D u \
  &= D (u^+ - u^-) dot D (u^+ - u^-) arrow " por definición de "u^+, u^- \
  &= D u^+ dot D u^+ + D u^- dot D u^- - D u^+ dot D u^- - D u^- dot D u^+ arrow " por linealidad de \n la derivada débil"\
$

Por como se definen $D u^+, D u^-$ vemos que en el conjunto ${u = 0}$ ambas toman el valor $0$ c.t.p. Luego, reemplazando obtenemos que:

$
  norm(D u)^2 &= 0 "c.t.p en {u = 0}" \
$

Con esto, hemos demostrado que $D u = 0$ c.t.p en ${u = 0}$.

= Conjuntos Estrellados

== Sobre $u_lambda$:

Sea $phi$ una función test cualquiera sobre $lambda^(-1) U$. Tenemos que:

$
  integral_(lambda^(-1) U) u_lambda (x) D^alpha_x_i phi (x) dif x = integral_(lambda^(-1) U) u(lambda x) D^alpha_x_i phi (x) dif x 
$

Haciendo un cambio de variable $y = lambda x in U$, y usando la regla de la cadena usual (clásica) sobre $phi in C^infinity_c (lambda^(-1) U)$ obtenemos:
$
  &= integral_(U) u(y) D^alpha_x phi (y/lambda) (dif y) / lambda^n \
  &= integral_(U) u(y) lambda^abs(alpha) (D^alpha_y phi(y/lambda))  (dif y)/lambda^n arrow " Regla de la cadena multivariada: \n Cada derivada sólo me bota un  \n lambda afuera." \
  &= lambda^abs(alpha) dot 1/lambda^n integral_U u(y) D^alpha_y phi(y/lambda) dif y \
  &= lambda^abs(alpha) dot 1/lambda^n dot (-1)^abs(alpha) integral_(U) D_y^alpha u(y) phi(y/lambda) dif y arrow phi(y/lambda) in C^infinity_c (U) implies "Puedo usar la def \n de derivada débil" \
  &= lambda^abs(alpha) dot 1/lambda^n dot (-1)^abs(alpha) integral_(lambda^(-1) U) D^alpha_y u(y)|_(y = lambda x) phi (x) (lambda^n dif x) arrow " Otro cambio de variable clásico. \n No hemos hecho nada fuera de CVV." \
  &= lambda^abs(alpha) dot (-1)^abs(alpha) integral_(lambda^(-1) U) (D^alpha_y u)_lambda (x) phi(x) dif x
$

Donde en el último paso nos damos cuenta que evaluar las derivadas en $lambda x$ es justo lo que hace la notación de subíndice. Con esto, tenemos que la derivada débil $D_x^alpha u_lambda (x) =lambda^abs(alpha) [D^alpha_x u]_lambda (x)$ 

#obs[Pequeña sutileza][Pude hacer la integración por partes gracias a que el soporte de $phi(dot /lambda)$ es un compacto _contenido en $U$_ gracias a este ser conjunto estrellado (es $"supp"(phi) subset lambda^(-1) U$ multiplicado por lambda). Además, gracias a la regla de la cadena usual, $phi(dot/lambda)$ sigue siendo suave. Luego, es una función test sobre $U$. Esto permite aplicar la definición de la derivada débil de $u$, que sabemos existe pues $u in W^(k, p)(U)$, y $abs(alpha) <= k$.]

#obs[Sutileza de la sutileza][Ojo que $U$ estrellado implica $lambda^(-1) U$ estrellado. Esto se sigue de multiplicar la contención de la definición por $lambda^(-1)$ (las inclusiones se mantienen). Luego, sí es cierto que $lambda "supp"(phi) subset U$.]
Ahora veamos que $u_lambda in W^(k, p) (lambda^(-1) U)$. Primero verifiquemos que $u_lambda in L^p (lambda^(-1) U)$:

$
  norm(u_lambda)_(L^p (lambda^(-1) U)) &= (integral_(lambda^(-1) U) abs(u_lambda (x))^p dif x)^(1/p) \
  &= (integral_(lambda^(-1) U) abs(u(lambda x))^p dif x)^(1/p) \
  &= (integral_U abs(u(y))^p (dif y)/lambda^n)^(1/p) = lambda^(-n/p) norm(u)_(L^p (U)) < infinity
$

De igual manera, vemos que la derivada débil está en $L^p (lambda^(-1) U)$:

$
  integral_(lambda^(-1) U) abs(D_x^alpha u_lambda (x))^p dif x &= integral_(lambda^(-1) U) abs(lambda^abs(alpha) [D^alpha_y u(y)]_(lambda x))^p dif x \
  &=lambda^abs(alpha) integral_(U) abs([D^alpha_y u] (y))^p (dif y)/lambda^n arrow " Cambio de variable usual"\
  &= lambda^(abs(alpha) - n) integral_U abs(D^alpha_y u(y))^p dif y < infinity
$

Con esto, confirmamos que $u_lambda in W^(k, p) (lambda^(-1) U)$.

== Límite $lambda arrow 1$:

$
  norm(D^alpha u_lambda - D^alpha u)_(L^p (U))^p &= norm(lambda^(abs(alpha)) (D^alpha u)_lambda - D^alpha u)_(L^p (U)) \
  &= integral_U abs(lambda^(abs(alpha)) (D_x^alpha u)_lambda - D_x^alpha u)^p dif x \
  &= integral_U abs(lambda^(abs(alpha)) (D^alpha_x u)(lambda x) - D_x^alpha u (x))^p dif x \
$

Hummmmmm no está tan fácil... Separemos los términos:

$
  &= integral_U abs(lambda^(abs(alpha)) (D^alpha_x u) (lambda x) - (D^alpha_x u) (lambda x) + D^alpha_x u(lambda x) -  D_x^alpha u (x))^p dif x \
  &<= integral_U abs((lambda^(abs(alpha)) - 1) (D^alpha_x u) (lambda x))^p + abs(D^alpha_x u(lambda x) -  D_x^alpha u (x))^p dif x \
$

El primer término ya lo tengo casi listo. El otro término creo que se debe poder hacer con teoría de la medida nomás, pero para sacarme algunos cachos de encima, utilizaré teoremas de aproximación. Tenemos que como las funciones test son densas en $L^p (U)$ (resultado que se sigue de Hahn-Banach) entonces existe una sucesión $g_m$ de funciones test que convergen con $ norm(dot)_(L^p (U))$ a $(D^alpha u) in L^p (U)$. Ahora, tomamos una subsucesión tal que convergen puntualmente c.t.p (y además están dominadas por una función en $L^p (U)$), que renombro $g_m$. De esta manera planeo usar el teorema de convergencia dominada para el segundo término:

$
  lim_(lambda arrow 1) integral_U abs(D^alpha_x u (lambda x) - D^alpha_x u (x))^p dif x \
  = lim_(m arrow infinity) lim_(lambda arrow 1) integral_U abs(D_x^alpha u (lambda x) - g_m (lambda x) + g_m ( lambda x) - g_m(x) + g_m (x) - D_x^alpha u (x))^p dif x \
  <= lim_(m arrow infinity) [lim_(lambda arrow 1) integral_U abs(D_x^alpha u (lambda x) - g_m (lambda x))^p + abs(g_m (x) - g_m (lambda x))^p + abs(g_m (x) - D^alpha_x u(x)) dif x] \ 
  = lim_(m arrow infinity)[lim_(lambda arrow 1) integral_U abs(D_x^alpha u (lambda x) - g_m (lambda x))^p dif x arrow "Para todo m, por TCD el término\n del medio se muere." \
  + lim_(lambda arrow 1) integral_U abs(g_m (x) - D^alpha_x u(x)) dif x = 0] 
$

Mucho mejor, ahora puedo aplicar el límite $m arrow infinity$, que me mata el segundo término, y me queda que:

$
  lim_(m arrow infinity) lim_(lambda arrow 1) integral_U abs(D^alpha_x u (lambda x) - g_m (lambda x))^p dif x &= lim_(m arrow infinity) lim_(lambda arrow 1) integral_(lambda U) abs(D^alpha_x u (y) - g_m (y))^p (dif y)/lambda^n \
  &<= lim_(m arrow infinity) lim_(lambda arrow 1)lambda^(-n) integral_U abs(D^alpha_x u (y) - g_m (y))^p dif y = 0 arrow "pues" lambda U subset U \
  &= lim_(m arrow infinity) norm(D^alpha u - g_m)_(L^p (U))^p = 0
$

Ahora que ganamos con el término más difícil, veamos el otro:

$
  lim_(lambda arrow 1) integral_U abs((lambda^(abs(alpha)) - 1) (D^alpha_x u) (lambda x))^p dif x <= lim_(lambda arrow 1) integral_U abs(lambda^(abs(alpha)) - 1)^p abs(D^alpha_x u (y))^p (dif y)/lambda^n prop lim_(lambda arrow 1) abs(lambda^abs(alpha) - 1)/lambda^n\
  = 0
$

Con esto, finalmente sí concluimos lo pedido.

== Conclusión:

Se me tiene que ocurrir una familia regularizadora que se parezca a $u_lambda$. Bueno, la idea que se me ocurre es tomar funciones que sean suaves en un abierto que contenga a $overline(U)$ (como $lambda^(-1) U$), y tirar un límite diagonal con el $lambda arrow 1$. Por mientras, dejaré esta idea porque no tengo claro cómo justificaría el límite cruzado, y el tiempo apremia.

= Items varios

== ¿Fourier sirve post control 1?

