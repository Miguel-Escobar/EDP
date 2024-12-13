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
// #show math.equation.where(block: false): box
#set par(justify: true)
#set table(stroke: tablecolor)

= Cálculo:
+ *Teorema Gauss-Green:* $integral_U u_(x_i) dif x &eq integral_(partial U) u nu^i dif S quad (i eq 1,dots,n)$ o equivalentemente,\ $integral_U div bold(u) dif x &eq integral_(partial U) bold(u) dot nu dif S$
+ *Integración por partes:* $integral_U u_(x_i) v dif x = - integral_U u v_(x_i) dif x + integral_(partial U) u v nu^i dif S quad (i = 1,dots, n)$
+ *Formulas de Green:* $integral_U laplace u dif x &= integral_(partial U) (partial u)/(partial nu) dif S$, $integral_U (u laplace v - v laplace u) dif x &= integral_(partial U) (u (partial v)/(partial nu) - v (partial u)/(partial nu)) dif S$, \ $integral_U D v dot D u dif x &= -integral_U u laplace v dif x + integral_(partial U) (partial v)/(partial nu) u dif S$
+ *Coordenadas polares:* $integral_(RR^n) f dif x = integral_0^oo (integral_(partial B(x_0, r))f dif S) dif r$, $d/(dif r)(integral_(B(x_0, r)) f dif x) eq integral_(partial B(x_0, r)) f dif S$
+ *Fórmula de coarea:* $integral_(RR^n) f abs(D u) dif x = integral_(-oo)^oo (integral_({u = r}) f dif S) dif r$
+ *Mollifiers:* Sean ${rho_epsilon}$ mollifiers, $f^epsilon colon.eq rho_epsilon * f$ cumple:
  - $f^epsilon in C^oo (U_epsilon)$
  - $f^epsilon xarrow(epsilon -> 0) f$ c.t.p
  - Si $f in C(U)$, entonces $f^epsilon -> f$ uniforme en compactos
  - Si $1 lt.eq p lt oo$ y $f in L^p_"loc" (U)$, entonces $f^epsilon xarrow(L^p_"loc" (U)) f$
+ *Volúmenes de esferas:* $alpha (n)$ := Volumen de la esfera unitaria en $RR^n$. Luego $abs(partial B(0, r)) &= n alpha (n) r^(n-1)$ y $abs(B(0, r)) &= alpha (n) r^n$.

= Funciones Test y Distribuciones:
+ *Topología para $C^oo (Omega)$ ($tau_o$)*: Es la topología formada por las seminormas: $P_N (f) = sup_(x in KK_n) max_(abs(alpha) lt.eq N) abs(partial^alpha f(x))$
+ *Espacios $D_k (Omega)$ y $D(Omega)$*
  Para un compacto $K$ fijo definimos $D_k (Omega) = {f in C^oo (Omega) | "Supp"(f) subset.eq K}$ con la topología $tau_k colon.eq tau_0|_k$. Esta está generada por las *normas*: $ norm(f)_N colon.eq sup_(x in Omega \ abs(alpha)lt.eq N) abs(partial^alpha f) $

  Para definir la topología $tau$ en $C^oo_c (Omega)$, se construye la siguiente base de vecindades del 0:
  $
    beta colon.eq {tilde(V) "convexo, balanceado en" C^oo (Omega) "tales que" tilde(V) sect D_K (Omega) in D_K (Omega) "para todo compacto" K}
  $
  Con esto, se denota espacio de funciones test a $D(Omega) colon.eq (C^oo_c (Omega), tau)$.
+ *Convergencia de tests*
  Si $(f_n)$ es sucesión de Cauchy en $D(Omega)$, existe $K$ tal que $(f_n) subset.eq D_K(Omega)$ y además $abs(f_n-f_m)_N -> 0$ para todo $N$ fijo

  Si $f_n -> 0$ en $D(Omega)$ entonces existe $K$ tal que $(f_n) subset.eq D_K(Omega)$ y $partial^alpha f_n -> 0$ uniforme en $K$ para todo multi índice $alpha$
+ *Caracterización del dual*
  Se llama espacio de distribuciones a $D'(Omega)$. Sea $T: C^oo_c (Omega) -> RR$ lineal, LSSE:
  - $T in D'(Omega)$
  - Para cada compacto $K$, existen $N(K) gt.eq 0$ y $C(K) gt 0$ tal que $abs(innerproduct(T, phi.alt)) lt.eq C norm(phi.alt)_N$
  Si existe $N$ que no depende del compacto, se dice que el menor de ellos es el orden de $T$.
+ *Derivada en distribuciones*
  $innerproduct(D^alpha T, phi) colon.eq (-1)^abs(alpha) innerproduct(T, D^alpha phi)$
+ Sea $T:D(Omega) -> Y$ lineal. Entonces:
  $T$ es continuo $iff$ $T$ es acotado $iff$ $forall phi.alt_n -> 0$ en $D(Omega)$ $iff$ $T phi.alt_n ->  0$ en $Y$ $iff$ $T|_(D_k (Omega))$ es continuo para todo $K$.
+ Si $f in C^oo (Omega)$ y $T in D'(Omega)$, definimos $innerproduct(f T, phi.alt) colon.eq innerproduct(T, f phi.alt)$
+ Sea $(T_n)_(n in NN) subset.eq D'(Omega)$ tal que $lim_(n -> oo) innerproduct(T_n, phi.alt)$ existe para toda $phi.alt$ test, Definimos: $innerproduct(T, phi.alt) colon.eq lim_(n -> oo) innerproduct(T_n, phi.alt)$, entonces $T in D'(Omega)$ y $partial^alpha T_n xarrow(D'(Omega)) partial^alpha T$
+ *Anulación en distribuciones:*
  Si $w$ es abierto en $Omega$, decimos que $T$ se anula en $w$ si $forall phi in D(w), innerproduct(T, phi) = 0$
+ *Soporte de una distribución:* Definimos el soporte de una distribución $T$ como el *complemento* de $A_T colon.eq union.big_(w "abierto" \ T "se anula en" w) w$
+ *Distribucion de soporte compacto:* $cal(E)'(Omega)$ son las distribuciones de soporte compacto.  
+ Si $T in cal(E)'(Omega)$ tiene soporte ${x_0}$ entonces existen $N in NN$, $(C_alpha)_(abs(alpha) lt.eq N)$ tales que.
  $T eq sum_(abs(alpha) lt.eq N) C_alpha D^alpha delta_(x_0)$
+ Si $"Supp" T = K$ compacto en $Omega$, entonces $forall V subset.eq Omega$ abierto $V subset K$, existen funciones continuas $(f_alpha)_(abs(alpha) lt.eq N)$ tales que
  $T eq sum_(abs(alpha) lt.eq N) D^alpha_x f_alpha$
+ *Convolución de distribuciones:* Si $T_1 in D'(Omega), T_2 in cal(E)'$, se define $T_1 * T_2 in D'(Omega)$ como $innerproduct(T_1 * T_2, phi) colon.eq innerproduct(T_1 (x), innerproduct(T_2 (y), phi(x+y))_y)_x$
+ *Propiedades de la convolución de distribuciones:*
  - Si $T_1, T_2 in cal(E)'(Omega)$, entonces $T_1 * T_2 in cal(E)'(Omega)$
  - $partial^alpha (T_1 * T_2) eq partial^alpha T_1 * T_2 = T_1 * partial^alpha T_2$
  - Si $T in D'(Omega)$, entonces $T*delta_0 = delta_0 * T = T$
  - Si $T_1 in S', T_2 in cal(E)'$ entonces: $cal(F) (T_1*T_2) eq (2 pi)^(d"/"2) underbrace(hat(T_1), in S') underbrace(hat(T_2), in C^oo)$

= Transformada de Fourier:
+ *Definición*: Para $f in L^1 (RR^n)$, $hat(f) (xi) colon.eq integral_(RR^n) f(x) e^(-2pi i x dot xi) dif x$
+ Propiedades para $f, g in L^1 (RR^n)$:
  - $norm(hat(f))_(L^oo) <= norm(f)_(L^1)$
  - $[(tau_y f)]^and (xi) = e^(i 2 pi xi y) hat(f)(xi)$
  - $T: RR^n arrow RR^n$ lineal invertible, $S = (T^*)^(-1)$, entonces $[f compose T]^and = 1/abs(det(T)) hat(f) compose S$
  - $[f * g]^and = hat(f) hat(g)$
  - $alpha$ multiíndice: $x^alpha f in L^1 implies hat(f) in C^k$, y $D^alpha hat(f) = [(- 2 pi i x)^abs(alpha) f]^and$
  - $f in C^k$ tal que $forall abs(alpha) <= k,D^alpha f in L^1$ entonces $forall abs(alpha) <= k-1, [D^alpha f]^and = (2 pi i xi)^alpha hat(f) (xi)$
+ *Clase de Schwarz:* $S(RR^n) colon.eq {f in C^oo (RR^n) | forall alpha, beta "multiíndices", abs(x^alpha D^beta f) < oo}$
  - Prop: $cal(F)$ es un isomorfismo de la clase de Schwarz.
  - $S(RR^n)$ es denso en $L^p (RR^n)$ para $1 <= p < oo$
+ *Fórmula de Parseval:* Para $f, g in L^1$, $integral_(RR^n) hat(f)(x) g(x) dif x = integral_(RR^n)  f(x) hat(g)(x) dif x$
+ *Inversión de Fourier:* Para $f, hat(f) in L^1$, $f = (hat(f))^or := integral_(RR^n) hat(f) e^(2 pi i x xi) dif x$ c.t.p.
+ *Plancherel*: Podemos extender la transformada a $f in L^2 (RR^n)$, donde $norm(f)_(L^2) = norm(hat(f))_(L^2)$ y $cal(F)_(L^2): L^2 arrow L^2$.
+ *Dist. Temperadas*: Llamamos al dual $S'(RR^n)$ el espacio de dist. temperadas.
+ *Fourier en $S'$*: Para $T in S'$, $hat(T)$ se define por su acción $angle.l hat(T), phi angle.r = angle.l T, hat(phi) angle.r$. La transformada es una operación continua en $S'$.

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
  Si $g in C^0(partial U), f in C^0 (U)$ entonces a lo mas existe una solución \ $u in C^2 (U) sect C^0 (overline(U))$ de $- Delta u = f$ en $U$ y $u = g$ en $partial U$
+ *Regularidad:*
  Si $u in C^0(U)$ satisface la fórmula de la media para toda bola, entonces $u in C^oo$ (mas aún es analítica)
+ *Estimaciones en derivadas:*
  Si $u$ es armónica en $U$, entonces $ abs(D^alpha u(x_0)) lt.eq (C_k)/(r^(n+k)) norm(u)_(L^1 (B(x_0, r))) quad (abs(alpha) = k;B(x_0, r)subset.eq U) $
+ *Liouville:*
  Si $u: RR^n -> RR$ es armónica y acotada, entonces $u$ es constante.
+ *Representación:*
  Si $f in C^2_c (RR^n), n gt.eq 3$. Entonces cualquier solución acotada de $-laplace u eq f$ en $RR^n$ es de la forma $u = Phi * f + c$ con $c in RR$.
+ *Desigualdad de Harnack:*
  Para cada abierto conexo $V subset subset U$, existe $C(V)gt 0$ tal que $sup_V u lt.eq C inf_V u$,  $forall u$ armónica no negativa.
  En concreto, para $x,y in V$ se cumple $1/C u(y) lt.eq u(x) lt.eq C u(y)$.
+ *Función de Green:*
  Queremos obtener una formula de representación para
  $
    cases(
      -laplace u = f &quad "en" U,
      u = g &quad "en" partial U
    )
  $
  Para ello, para un $x$ fijo buscamos la función corrector como la solución a
  $
    cases(
      -laplace phi.alt^x = 0 &quad "en" U,
      phi.alt^x = Phi(y - x) &quad "en" partial U
    )
  $
  Con esto definimos la función de Green para la región $U$
  $
    G(x,y) colon.eq Phi(y-x) - phi.alt^x (y) quad (x eq.not y)
  $
+ *Representación usando Green:*
  Si $u$ resuelve el IVP anterior, entonces
  $
    u(x) = - integral_(partial U) g(y)(partial G)/(partial nu)(x,y) dif S(y) + integral_U f(y)G(x,y) dif y 
  $
+ *Simetría de Green:* 
  Para todo par $x,y in U$ distintos, $G(x,y) = G(y,x)$ 
+ *Green para el semiespacio positivo $(RR^n_+)$:*
  $tilde(x) := (x_1, x_2, dots, -x_n)$, entonces $G(x,y) = Phi(y-x) - Phi(y-tilde(x))$ para $x,y in RR^n_+$. Por lo que la solución es 
  $
    u(x) = (2x_n)/(n alpha(n)) integral_(partial RR^n_+) (g(y))/(abs(x-y)^n) dif y
  $
+ *Green para la bola unitaria:* Si $x in RR^n - {0}$, $tilde(x) := x/abs(x)^2$, 
  luego $G(x,y) = Phi(y-x) - Phi(abs(x) (y-tilde(x)))$, con lo que la solución es:
  $
    u(x) eq (1-abs(x)^2)/(n alpha(n)) integral_(partial B(0, 1)) (g(y))/(abs(x-y)^n) dif S(y)
  $
+ *Solución para $B(0, r)$:* Se define 
  $ u_r (x) = (r^2-abs(x)^2)/(n alpha(n) r) integral_(partial B(0, r)) g(y)/(abs(x-y)^n) dif S(y) $
  Entonces $u_r$ es armónica en $B(0, r)$ y $lim_(x -> x_0 \ x in B_0 (0,r)) u_r (x) = g(x_0)$ para $x_0 in partial B(0,r)$


= Ecuación de Calor:

+ *Ecuación del calor:* Se llama ecuación del calor a la ecuación $u_t - laplace u = f$ 
+ *Solución fundamental del calor:*
  $
    Phi(x, t) colon.eq cases(
      1/((4 pi t)^(n/2)) e^(-abs(x)^2/(4t)) &quad t>0,
      0 &quad t<0
    )
  $
  Para $t>0$ fijo se cumple $integral_(RR^n) Phi(x, t) dif x = 1$
+ *Solución al problema con condición inicial:*
  $
    u(x, t) = integral_(RR^n) g(y) Phi(x-y, t) dif y = 1/(4 pi t)^(n"/"2) integral e^(- (abs(x-y)^2)/(4t)) g(y) dif y 
  $
  soluciona el problema $u_t - laplace u = 0$ en $RR^n_+ times (0, oo)$, $u = g$ en $RR^n_+ times {t = 0}$
+ *Solución al caso no homogeneo:* La solución al problema
  $
    cases(
      u_t - laplace u = f &quad "en" RR^n_+ times (0, oo),
      u = 0 &quad "en" RR^n_+ times {t = 0}
    )
  $
  está dada por $u(x,t) = integral_0^t integral_(RR^n) Phi(x-y, t-s)f(y,s) dif y dif s$
+ *Cilindro parabólico:* Dado un abierto $Omega$ acotado y $T$ un tiempo fijo, se define el cilindro parabólico como $U_T colon.eq U times (0, T]$ y la frontera parabólica como $Gamma_T = overline(U)_T - U_T$
+ *Bola de calor:* Dados $x in RR^n, t in RR, r>0$ se define
  $
    E(x, t, r) colon.eq {(y, s) in RR^(n+1) | s lt.eq t, Phi(x-y, t-s) gt.eq 1/(r^n)}
  $
+ *Fórmula de la media:* Si $u in C_1^2 (U_T)$ soluciona calor, entonces
  $ u(x,t) eq 1/(4 r^n) integral integral_(E(x,t,r)) u(y,s) abs(x-y)^2/(t-s)^2 dif y dif s $
+ *Principio del máximo:* Si $u in C^2_1 (U_T) sect C(overline(U)_T)$ soluciona calor, entonces $max_(overline(U)_T) u = max_(Gamma_T) u$. Y si $U$ es conexo y existe $(x_0,t_0) in U_T$ tal que $u(x_0,t_0) = max_(overline(U)_T) u$ entonces $u$ es constante en $overline(U)_(t_0)$
+ *Unicidad:* Si $g in C(Gamma_T), f in C(U_T)$, entonces existe a lo mas una solución del calor no homogeneo con condición inicial.
+ *Principio del máximo para problema de Cauchy:* Si $u in C^2_1 (RR^n times (0, T]) sect C(RR^n times [0, T])$ resuelve $u_t - laplace u = 0$ en $RR^n times (0, T)$ con condición inicial $u = g$ y es tal que $u(x, t) lt.eq A e^(a abs(x)^2)$ para $A, a gt 0$, entonces $sup_(RR^n times [0, T]) u = sup_(RR^n) g$ 
+ *Unicidad para el PC:* Bajo las mismas hipótesis del teorema anterior, se cumple que el problema de Cauchy tiene a lo mas una solución.
+ *Suavidad:* Si $u in C^2_1 (U_T)$ resuelve calor, entonces $u in C^oo (U_T)$
+ *Estimadores para las derivadas:* Para cada par de enteros $k,l$ existe $C_(k,l)$ tal que
  $
    max_(C(x, t, r"/"2)) abs(D^k_t D^l_x u) lt.eq C_(k,l)/r^(k+2l+n+2) norm(u)_(L^1 (C(x, t, r)))
  $
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
+ *Derivada débil:* $v = D^alpha u iff forall phi in C^oo_c (Omega), integral_Omega u D^alpha phi dif x = (-1)^(abs(alpha)) integral_Omega v phi dif x$
+ $W^(k, p) (Omega) := {u in L^p (Omega) | forall abs(alpha) <= k, D^alpha u in L^p (Omega) "existe en el sentido Débil" }$
+ $norm(u)_(W^(k, p) (Omega)) := (sum_(abs(alpha) <= k) norm(D^alpha u )^p_(L^p (Omega)) )^(1/p)$. Con esta norma, $W^(k, p) (Omega)$ es Banach. $H^k (Omega):= W^(k, 2) (Omega)$ además es Hilbert.
+ Equivalente en $RR^n$: $H^s (RR^n) := {u in S' | (1 + |xi|^2)^(s/2) hat(u) in L^2 (RR^n)}$ con\ norma  $norm(u)_(H^s) := norm((1 + |xi|^2)^{s/2} hat(u))_(L^2 (RR^n))$
+ $W_0^(k, p) (Omega) := overline(C^oo_c (Omega))$ con respecto a $norm(dot)_(W^(k, p) (Omega))$.
+ *Teoremas de densidad ($p$ finito)*:
  - $C^infinity (Omega) sect W^(k, p) (Omega)$ es denso en $W^(k, p)_"loc" (Omega)$ (sin supuestos extras sobre $Omega$).
  - Si además $Omega$ es acotado: $C^infinity (Omega) sect W^(k, p) (Omega)$ es denso en $W^(k, p) (Omega)$.
  - Si $Omega$ es acotado y borde $C^1$: $C^infinity (overline(Omega)) sect W^(k, p) (Omega)$ es denso en $W^(k, p) (Omega)$.
+ *Teorema de Extensión*:
  - $Omega$ es acotado y borde $C^1$ $implies$ $exists E: W^(k, p) (Omega) -> W^(k, p) (RR^n)$ lineal continuo tal que $E u = u$ en $Omega$ (c.t.p), y $E u$ tiene soporte en un abierto $V$ acotado en $RR^n$, $Omega subset subset V$.
+ *Traza*: $Omega$ acotado $and partial Omega in C^1 implies  exists T: W^(1, p)(Omega) arrow.r L^p (partial Omega)$ lineal continuo tal que $forall u in C (overline(Omega)) sect W^(1, p) (Omega), thick T u = u|_(partial Omega)$. Además, $T u = 0 iff u in W^(1, p)_0 (Omega)$.
+ *Desigualdades de Sobolev*:
  - *Caso $1 <= p < n$*: Definimos $p^* = (n p)/(n - p)$
    - (Gagliardo-Niremberg-Sobolev) *En $RR^n$*: $forall u in C^1_c (RR^n)$, $norm(u)_(L^(p^*) (RR^n)) <= C norm(D u)_(L^p (RR^n))$.
    - $Omega$ *acotado y frontera suave*: $1 <= p < n thick implies exists C > 0$ tal que $forall u in W^(1, p) (Omega), norm(u)_(L^p (Omega)) <= C norm(u)_(W^(1, p) (Omega))$.
    - (Poincaré) $Omega$ *acotado*: $forall u in W^(1, p)_0 (Omega), forall q in [1, p^*], norm(u)_(L^q (Omega)) <= C norm(D u)_(L^p (Omega))$
  - *Caso $n < p <= oo$:* Aquí, las sobolev son _Hölder continuas_ (identificable con continuas).
    - Espacio de Hölder: 
    $u in C^(k, gamma) (overline(Omega)) iff norm(u)_(C^(k, gamma) (overline(Omega))) := sum_(abs(alpha) <= k) sup_(x in Omega) abs(D^alpha u (x)) + sum_(abs(alpha) = k) sup_( x, y in U \ (x != y)) {abs(u(y) - u(x))/abs(y - x)^gamma}$
    - (Morrisey) $forall u in C^1 (RR^n), gamma := 1 - n/p, norm(u)_(C^(0, gamma) (RR^n)) <= C norm(u)_(W^(1, p) (RR^n))$
    - (Morrisey 2) Si *$Omega$ es acotado y $partial Omega$ es $C^1$*: $norm(u^*)_(C^(0, gamma) (overline(Omega))) <= C norm(u)_(W^(1, p) (U))$ donde \ $gamma = 1 - n/p$ y $u^* = u$ c.t.p. Esto permite identificar $u$ sobolev con funciones continuas.
+ *Inclusiones compactas* (Rellich-Kondrachov): Si $Omega$ acotado y $partial Omega$ es $C^1$, $W^(1, p) (Omega)$ es compactamente embebido en $L^q (Omega)$ para $1 <= q < p^*$. Es decir, toda sucesión acotada en $W^(1, p) (Omega)$ tiene subsucesión convergente en $L^q (Omega)$.
+ *Desigualdad Poincaré - Weintenger*: Si $Omega$ acotado, $partial Omega$ es $C^1$, y $1 <= p < oo$ entonces $exists C > 0$ tal que $forall u in W^(1, p) (Omega), norm( u - integral.dash_Omega u)_(L^p (Omega)) <= C norm(grad u)_(L^p (Omega))$

= Aplicaciones a EDP:
+ *Operador Diferencial*: Sea $Omega subset RR^d$ acotado y borde $C^1$, $A (x) = (a_(i j) (x)), thick b(x) = (b_j (x))$, y $c(x)$ tales que $a_(i j), b_j, c in L^oo (Omega)$, definimos los operadores diferenciales en forma: _(notación: índices repetidos $implies$ sumar el índice de 1 a $d$)_
  - *De divergencia*: $L u = - partial_i (a_(i j) (x) partial_j u) + b_j (x) partial_j u + c(x) u$
  - *General*: $L u = - a_(i j)(x) partial_i partial_j u + b_j (x) partial_j u + c(x) u$
  *obs*: Estas formas son equivalentes si $a_(i j) in C^1 (Omega)$ 
+ *Elipticidad*: $A(x) = (a_(i j)(x))$ se dice *uniformemente elíptico* (*acotado*) si $forall xi in RR^d , angle.l xi, A xi angle.r >= (<=) med C_0 angle.l xi, xi angle.r$. Habitualmente se trabaja con $A$ simétrica.
+ *Formulación Variacional*: $u$ se dirá _solución débil_ del problema $L u = f$ si $forall v$ en un espacio adecuado (ej: $u in H^1 (Omega), v in H^1_0 (Omega)$) $B[u, v] = angle.l f , v angle.r$, donde $B$ es una forma bilineal obtenida al integrar por partes el problema original, y $f$ es promovido a un elemento del dual del espacio de $v$. Los detalles dependen del problema y las condiciones de borde en particular.
+  *Lax-Milgram*: Sean $u, v in H$, con $H$ un hilbert. El problema *$B[u, v] = angle.l f , v angle.r$ tiene solución única* si existen $alpha, beta > 0$ tal que:
  - $B$ continua: $abs(B[u, v]) <= alpha norm(u) norm(v)$ 
  - $B$ coerciva: $beta (u, u) <= B[u, u]$
+ *Teorema de Representación de Riesz*: A veces $B$ además es simétrica. En este caso es más simple definir $((u , v)) := B[u, v]$, mostrar que es nuevo producto interno, y así el teorema de representación de Riesz nos garantiza existencia de solución.
+ *Alternativa de Fredholm*: Sea el problema primal con $L$ op diferencial de divergencia: $L u = f, u|_(partial Omega) = 0$. El operador adjunto de $L$ se puede escribir como $L^* v = -partial_i (a_(i j) partial_j v) - b_i partial_i v + (c - (partial_i b_i)) v$. La forma bilineal adjunta se define $B^* [u, v] := B[v, u]$. El problema débil adjunto consiste en encontrar $v in H_0^1 (Omega)$ tal que $forall u in H^1_0 (Omega), B^* [v, u] = (f, u)$. Con esto, *sólo una* de las siguientes es cierta:
  + Existe solución débil única del problema primal para cualquier \ $f in L^2 (Omega)$.
  + Existe una solución débil no nula del problema homogéneo $L u = u$, \ $u|_(partial Omega) = 0$. En este caso, la dimension de $"Ker"(L)$ es igual a la de $"Ker" (L^*)$ y finita.
  + Existe solución débil única del problema primal ssi $f in "Ker"(L^*)^bold(perp)$


