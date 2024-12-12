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

#definición[Transformada en $L^1$][
  Para $f in L^1 (RR^n)$, definimos la transformada de Fourier como $ 
  && hat(f) (xi) colon.eq integral_(RR^n) f(x) e^(-2pi i x dot xi) dif x
  $
]



= Ecuación de Laplace:

+ *Ecuación de Poisson:* 
  Las ecuaciones $laplace u = 0$ y $-laplace u = f$ se llaman ecuaciones de Laplace y Poisson respectivamente. Se busca resolver para $u: overline(U) -> RR$ con $U$ abierto en $RR^n$.
  Las soluciones $C^2$ a Laplace se llaman armónicas.

+ *Solución fundamental:*
  La función
  $
    Phi(x) colon.eq cases(
      -1/2pi log(abs(x)) &quad n=2,
      1/(n(n-2)alpha(n)) |x|^(2-n) &quad n gt 2
    )
  $
  definida en $RR^n "/" {0}$ es la solución fundamental a la ecuación de Laplace.

+ *Solución a Poisson:*
  Si $f in C^2_c (RR^n)$, entonces $u(x) colon.eq Phi * f = integral_(RR^n) Phi(x-y) f(y) dif y in C^2 (RR^n)$ es solución de $- Delta u = f$ en $RR^n$


+ *Fórmula de la media:*
  La función $u$ es armónica ssi para toda bola $B(x, r) subset.eq U$ se cumple 
  $
    u(x) eq integral.dash_(partial B(x, r)) u(y) dif S(y) eq integral.dash_B(x, r) u(y) dif y
  $

+ *Principios del máximo:*
  Sea $U$ acotado y $u in C^2 (U) sect C^0 (overline(U))$ solución de $- Delta u = 0$ en $U$. Entonces:
  - $max_overline(U) u = max_(partial U) u$
  - Además, si $U$ es conexo y existe $x_0 in U$ tal que $u(x_0) = max_overline(U) u$, entonces $u$ es constante en $U$
  Se deduce un principio del mínimo, ya que $-u$ es armónica también.

+ *Unicidad:*
  Si $g in C^0(partial U), f in C^0 (U)$ entonces a lo mas existe una solución $u in C^2 (U) sect C^0 (overline(U))$ de $- Delta u = f$ en $U$ y $u = g$ en $partial U$


+ *Regularidad:*
  Si $u in C^0(U)$ satisface la fórmula de la media para toda bola, entonces $u in C^oo$ (mas aún es analítica)


+ *Estimaciones en derivadas:*
  Si $u$ es armónica en $U$, entonces $ abs(D^alpha u(x_0)) lt.eq (C_k)/(r^(n+k)) norm(u)_(L^1 (B(x_0, r))) quad (abs(alpha) = k;B(x_0, r)subset.eq U) $


+ *Liouville:*
  Si $u: RR^n -> RR$ es armónica y acotada, entonces $u$ es constante.


+ *Representación:*
  Si $f in C^2_c (RR^n), n gt.eq 3$. Entonces cualquier solución acotada de $-laplace u eq f$ en $RR^n$ es de la forma $u = Phi * f + c$ con $c in RR$.


= Ecuación de Calor:

= Ecuación de Onda:
+ Fórmula de D'Alambert ($U = RR^n$): $u(x; r, t)= 1/2 [g(x + t) - g(x - t)] + 1/2 integral_(x - t)^(x + t) h(y) dif y$

+ Medias Esféricas: $U(r, t; x) = integral.dash_(partial B(x, r)) u(y, t) dif y$, $U_(t t) - U_(r r) - (n-1)/r U_r = 0$ s.a. $U = G, thin U = H$ en $RR_+ times {t = 0}$

+ Fórmula de Kirchhoff: $u(x, t) = integral.dash_(partial B(x, t)) t h(y) + g(y) + D g(y) dot (y - x) dif S(y)$, válida sólo para $n=3$.

+ Fórmula de Poisson 2D: $u(x, t) = 1/2 integral.dash_(B(x, t)) (t g(y) + t^2 h(y) + t D g(y) dot (y - x))/(t^2 - abs(y - x)^2)^(1/2) dif S(y)$

+ Fórmulas de Poisson 3D: $u(x, t) = partial_t (t integral.dash_(partial B(x, t)) g dif S) + 1/(2r) integral.dash_(partial B(x, t)) h(y) dif S(y)$$ = integral.dash_(partial B(x, t)) t h(y) + g(y) + D g(y) dot (y - x) dif S(y)$

+ Solución homogénea general $n$ impar: 
  $
    u(x, t) = 1/(gamma_n) [partial_t (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) g dif S) + (1/t partial_t)^((n-3)/2) (t^(n-2) integral.dash_(partial B(x, t)) h dif S) ], \ gamma_n = 1 dot 3 dot 5 dot dot dot (n-2)
  $
+ Solución homogénea general $n$ par:
  $
    u(x, t) = 1/gamma_n [ partial_t (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) g(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) + (1/t partial_t)^((n-2)/2) (t^n integral.dash_(B(x, t)) h(y)/(t^2 - abs(y - x)^2)^(1/2) dif y) ], \ gamma_n = 2 dot 4 dot 6 dot dot dot n
  $
+ Solución no-homogénea: $u(x, t) = integral_0^t u(x, t; s) dif s$, donde para $t >= s$, $u_(t t)(dot; s) - Delta u (dot; s)= 0,$ s.a. $u( dot ; s) = 0, thick u_t ( dot ; s) = f(dot, s)$ en $t = s$
  La solución general se obtiene sumando homogénea + inhomogenea

+ Energía: $E(t) = 1/2 integral_(U) (u_t^2 + |D u|^2) dif x$.
  $dot(E) = integral_U u_t (u_(t t) - Delta u) dif x + integral_(partial U) u_t D u dot nu dif S$

= Espacios de Sobolev:

= Aplicaciones a EDP: