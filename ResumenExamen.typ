#import "preamble.typ": *

#set text(
  font: "JetBrainsMono NF",
  lang: "es")
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

*pendiente*

= Funciones Test y Distribuciones:

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