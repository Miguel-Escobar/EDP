#import "preamble.typ": *

#set text(
  font: "JetBrainsMono NF",
  lang: "es",
  size: 10pt)
#show: thmrules

// #show heading.where(level: 1): set text(headingcolors.at(0))
// #show heading.where(level: 2): set text(headingcolors.at(1))
// #show heading.where(level: 3): set text(headingcolors.at(2))
// #show heading.where(level: 4): set text(headingcolors.at(3))


#set math.equation(numbering: none)
#show math.equation.where(block: false): box
#set par(justify: true)
#set table(stroke: tablecolor)


= Cálculo:
+ Teorema Gauss-Green: 
  $ integral_U u_(x_i) dif x &eq integral_(partial U) u nu^i dif S quad (i eq 1,dots,n)\ integral_U div bold(u) dif x &eq integral_(partial U) bold(u) dot nu dif S  $

+ Integración por partes: $ integral_U u_(x_i) v dif x = - integral_U u v_(x_i) dif x + integral_(partial U) u v nu^i dif S quad (i = 1,dots, n) $

+ Formulas de Green: $ integral_U laplace u dif x &= integral_(partial U) (partial u)/(partial nu) dif S\ integral_U (u laplace v - v laplace u) dif x &= integral_(partial U) (u (partial v)/(partial nu) - v (partial u)/(partial nu)) dif S \ integral_U D v dot D u dif x &= -integral_U u laplace v dif x + integral_(partial U) (partial v)/(partial nu) u dif S $

+ Coordenadas polares: $ &integral_(RR^n) f dif x = integral_0^oo (integral_(partial B(x_0, r))f dif S) dif r\ &d/(dif r)(integral_(B(x_0, r)) f dif x) eq integral_(partial B(x_0, r)) f dif S $

+ Fórmula de coarea: $ integral_(RR^n) f abs(D u) dif x = integral_(-oo)^oo (integral_({u = r}) f dif S) dif r $

+ Mollifiers: Sean ${rho_epsilon}$ mollifiers, $f^epsilon colon.eq rho_epsilon * f$ cumple:
  - $f^epsilon in C^oo (U_epsilon)$
  - $f^epsilon xarrow(epsilon -> 0) f$ c.t.p
  - Si $f in C(U)$, entonces $f^epsilon -> f$ uniforme en compactos
  - Si $1 lt.eq p lt oo$ y $f in L^p_"loc" (U)$, entonces $ f^epsilon xarrow(L^p_"loc" (U)) f $

+ Volúmenes de esferas: sea $alpha (n)$ el volumen de la esfera unitaria en $RR^n$.
$
  abs(partial B(0, r)) &= n alpha (n) r^(n-1) \ abs(B(0, r)) &= alpha (n) r^n
$

= Funciones Test y Distribuciones:

#definición[Topología para $C^oo (Omega)$ ($tau_o$)][Es la topología formada por las seminormas $ P_N (f) = sup_(x in KK_n) max_(abs(alpha) lt.eq N) abs(partial^alpha f(x))  $]

#definición[Espacios $D_k (Omega)$ y $D(Omega)$][
  Para un compacto $K$ fijo definimos $D_k (Omega) = {f in C^oo (Omega) | "Supp"(f) subset.eq K}$ con la topología $tau_k colon.eq tau_0|_k$. Esta está generada por las *normas* $ norm(f)_N colon.eq sup_(x in Omega \ abs(alpha)lt.eq N) abs(partial^alpha f) $

  Para definir la topología $tau$ en $C^oo_c (Omega)$, se construye la siguiente base de vecindades del 0:
  $
    beta colon.eq {tilde(V) "convexo, balanceado en" C^oo (Omega) "tales que" tilde(V) sect D_K (Omega) in D_K (Omega) "para todo compacto" K}
  $
  Con esto, se denota espacio de funciones test a $D(Omega) colon.eq (C^oo_c (Omega), tau)$.
]

#teorema[Convergencia de tests][
  Si $(f_n)$ es sucesión de Cauchy en $D(Omega)$, existe $K$ tal que $(f_n) subset.eq D_K(Omega)$ y además $abs(f_n-f_m)_N -> 0$ para todo $N$ fijo

  Si $f_n -> 0$ en $D(Omega)$ entonces existe $K$ tal que $(f_n) subset.eq D_K(Omega)$ y $partial^alpha f_n -> 0$ uniforme en $K$ para todo multi índice $alpha$
]

#teorema[Caracterización del dual][
  Se llama espacio de distribuciones a $D'(Omega)$. Sea $T: C^oo_c (Omega) -> RR$ lineal, LSSE:
  - $T in D'(Omega)$
  - Para cada compacto $K$, existen $N(K) gt.eq 0$ y $C(K) gt 0$ tal que $ abs(innerproduct(T, phi.alt)) lt.eq C norm(phi.alt)_N $
  Si existe $N$ que no depende del compacto, se dice que el menor de ellos es el orden de $T$.
]

#definición[Derivada en distribuciones][
  $innerproduct(D^alpha T, phi) colon.eq (-1)^abs(alpha) innerproduct(T, D^alpha phi)$
]

#teorema[Sea $T:D(Omega) -> Y$ lineal, LSSE:
  - $T$ es continuo
  - $T$ es acotado
  - $forall phi.alt_n -> 0$ en $D(Omega)$, $T phi.alt_n ->  0$ en $Y$.
  - $T|_(D_k (Omega))$ es continuo para todo $K$
]

#definición[
  Si $f in C^oo (Omega)$ y $T in D'(Omega)$, definimos $innerproduct(f T, phi.alt) colon.eq innerproduct(T, f phi.alt)$
]

#teorema[
  Sea $(T_n)_(n in NN) subset.eq D'(Omega)$ tal que $lim_(n -> oo) innerproduct(T_n, phi.alt)$ existe para toda $phi.alt$ test, Definimos: $innerproduct(T, phi.alt) colon.eq lim_(n -> oo) innerproduct(T_n, phi.alt)$, entonces $T in D'(Omega)$ y $partial^alpha T_n xarrow(D'(Omega)) partial^alpha T$
]

= Transformada de Fourier:

= Ecuación de Laplace:

= Ecuación de Calor:

= Ecuación de Onda:

+ *Fórmula de D'Alambert ($U = RR^n$):*
 $ u(x; r, t)= 1/2 [g(x + t) - g(x - t)] + 1/2 integral_(x - t)^(x + t) h(y) dif y $

+ *Medias Esféricas:* $U(r, t; x) = integral.dash_(partial B(x, r)) u(y, t) dif y$, $U_(t t) - U_(r r) - (n-1)/r U_r = 0$ s.a. $U = G, thin U = H$ en $RR_+ times {t = 0}$

+ *Fórmula de Kirchhoff:* $u(x, t) = integral.dash_(partial B(x, t)) t h(y) + g(y) + D g(y) dot (y - x) dif S(y)$, válida sólo para $n=3$.

+ *Fórmula de Poisson 2D:* $u(x, t) = 1/2 integral.dash_(B(x, t)) (t g(y) + t^2 h(y) + t D g(y) dot (y - x))/(t^2 - abs(y - x)^2)^(1/2) dif S(y)$

+ *Fórmulas de Poisson 3D:* $u(x, t) = partial_t (t integral.dash_(partial B(x, t)) g dif S) + 1/(2r) integral.dash_(partial B(x, t)) h(y) dif S(y)$$ = integral.dash_(partial B(x, t)) t h(y) + g(y) + D g(y) dot (y - x) dif S(y)$

+ *Solución homogénea general $n$ impar:*
  $
    u(x, t) = 1/(gamma_n) [partial_t (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) g dif S) + (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) h dif S) ], \ gamma_n = 1 dot 3 dot 5 dot dot dot (n-2)
  $

+ *Solución homogénea general $n$ par:*
  $
    u(x, t) = 1/gamma_n [ partial_t (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) g(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) + (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) h(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) ], \ gamma_n = 2 dot 4 dot 6 dot dot dot n
  $

+ *Solución no-homogénea:* $u(x, t) = integral_0^t u(x, t; s) dif s$, donde para $t >= s$, $u_(t t)(dot; s) - Delta u (dot; s)= 0,$ s.a. $u( dot ; s) = 0, thick u_t ( dot ; s) = f(dot, s)$ en $t = s$
  La solución general se obtiene sumando homogénea + inhomogenea

+ *Energía:* $E(t) = 1/2 integral_(U) (u_t^2 + |D u|^2) dif x$.
  $dot(E) = integral_U u_t (u_(t t) - Delta u) dif x + integral_(partial U) u_t D u dot nu dif S$

= Espacios de Sobolev: ($Omega subset RR^n$ abierto)

+ *Derivada débil:* $v = D^alpha u iff forall phi in C^oo_c (Omega), integral_Omega u D^alpha phi dif x = (-1)^(abs(alpha)) integral_Omega v phi dif x$

+ $W^(k, p) (Omega) := {u in L^p (Omega) | forall abs(alpha) <= k, D^alpha u in L^p (Omega) "existe en el sentido Débil" }$

+ $norm(u)_(W^(k, p) (Omega)) := (sum_(abs(alpha) <= k) norm(D^alpha u )^p_(L^p (Omega)) )^(1/p)$. Con esta norma, $W^(k, p) (Omega)$ es Banach. $H^k (Omega):= W^(k, 2) (Omega)$ además es Hilbert.

+ $W_0^(k, p) (Omega) := overline(C^oo_c (Omega))$ con respecto a $norm(dot)_(W^(k, p) (Omega))$.

+ *Teoremas de densidad ($p$ finito)*:
  - $C^infinity (Omega)$ es denso en $W^(k, p)_"loc" (Omega)$ (sin supuestos extras sobre $Omega$).
  Si además $Omega$ es acotado:
  - $C^infinity (Omega)$ es denso en $W^(k, p) (Omega)$.
  Si $Omega$ es acotado y borde $C^1$:
  - $C^infinity (overline(Omega))$ es denso en $W^(k, p) (Omega)$.

+ *Teorema de Extensión*:
  - $Omega$ es acotado y borde $C^1$ $implies$ $exists E: W^(k, p) (Omega) -> W^(k, p) (RR^n)$ lineal continuo tal que $E u = u$ en $Omega$ (c.t.p), y $E u$ tiene soporte en un abierto $V$ acotado en $RR^n$, $Omega subset subset V$.

+ *Traza*: $Omega$ acotado $and partial Omega in C^1 implies  exists T: W^(1, p)(Omega) arrow.r L^p (partial Omega)$ lineal continuo tal que $forall u in C (overline(Omega)) sect W^(1, p) (Omega), thick T u = u|_(partial Omega)$. Además, $T u = 0 iff u in W^(1, p)_0 (Omega)$.

+ *Desigualdades de Sobolev*:

  - *Caso $1 <= p < n$*: Definimos $p^* = (n p)/(n - p)$

    - *En $RR^n$*: $forall u in C^1_c (RR^n)$, $norm(u)_(L^(p^*) (RR^n)) <= C norm(D u)_(L^p (RR^n))$.

    - $Omega$ *acotado y frontera suave*: $1 <= p < n thick implies exists C > 0$ tal que $forall u in W^(1, p) (Omega), norm(u)_(L^p (Omega)) <= C norm(u)_(W^(1, p) (Omega))$.

    - $Omega$ *acotado*: $forall u in W^(1, p)_0 (Omega), forall q in [1, p^*], norm(u)_(L^q (Omega)) <= C norm(D u)_(L^p (Omega))$
  

  - *Caso $n < p <= oo$:* Aquí, las sobolev son _Hölder continuas_ (osea identificable con continuas).

    - *Holder*: $u in C^(k, gamma) (overline(Omega)) iff norm(u)_(C^(k, gamma) (overline(Omega))) := sum_(abs(alpha) <= k) sup_(x in Omega) abs(D^alpha u (x)) + sum_(abs(alpha) = k) sup_( x, y in U \ (x != y)) {abs(u(y) - u(x))/abs(y - x)^gamma}$

    - $forall u in C^1 (RR^n), gamma := 1 - n/p, norm(u)_(C^(0, gamma) (RR^n)) <= C norm(u)_(W^(1, p) (RR^n))$

    - Si *$Omega$ es acotado y $partial Omega$ es $C^1$*:

      $norm(u^*)_(C^(0, gamma) (overline(Omega))) <= C norm(u)_(W^(1, p) (U))$ donde $gamma = 1 - n/p$ y $u^* = u$ c.t.p.


= Aplicaciones a EDP: