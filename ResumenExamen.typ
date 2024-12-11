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

= Funciones Test y Distribuciones:

= Transformada de Fourier:

= Ecuación de Laplace:

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