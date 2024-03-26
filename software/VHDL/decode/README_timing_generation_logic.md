# Timing Generation Logic

This README outlines the Timing Generation Logic module of the 6502 processor. It includes a truth table, initialization conditions, timing cases for various cycle lengths, and corresponding timing equations.

## Truth Table

| rdy | tzpre | t_zero | t_res_1 | timing_n_prev |  timing_n_current |
|-----|-------|--------|---------|---------------| ------------------|
|  U  |   U   |   U    |    U    |    UUUUUU     |      UUUUUU       |
|  U  |   U   |   1    |    0    |    UUUUUU     |      UUUUU0       |
|  U  |   0   |   U    |    0    |    UUUUUU     |      UUUUU0       |
|  0  |   U   |   U    |    U    |    UUUUU0     |      UUUUU0       |
|  U  |   U   |   U    |    1    |    UUUUU1     |      UUUUU1       |
|  1  |   U   |   U    |    1    |    UUUUUU     |      UUUUU1       |
|  U  |   1   |   0    |    U    |    UUUUU1     |      UUUUU1       |
|  1  |   1   |   0    |    U    |    UUUUUU     |      UUUUU1       |
|  1  |   U   |   U    |    U    |    UUUUU0     |      UUUU0U       |
|  U  |   U   |   U    |    U    |    UUUUU1     |      UUUU1U       |
|  0  |   U   |   U    |    U    |    UUUUUU     |      UUUU1U       |
|  1  |   U   |   0    |    1    |    UUUUUU     |      UUU0UU       |
|  0  |   U   |   0    |    U    |    UUU0UU     |      UUU0UU       |
|  U  |   U   |   1    |    U    |    UUUUUU     |      UUU1UU       |
|  U  |   U   |   U    |    0    |    UUU1UU     |      UUU1UU       |
|  0  |   U   |   U    |    U    |    UUU1UU     |      UUU1UU       |
|  1  |   U   |   U    |    0    |    UUUUUU     |      UUU1UU       |
|  1  |   U   |   0    |    U    |    UUU0UU     |      UU0UUU       |
|  0  |   U   |   0    |    U    |    UU0UUU     |      UU0UUU       |
|  U  |   U   |   1    |    U    |    UUUUUU     |      UU1UUU       |
|  U  |   U   |   U    |    U    |    UU11UU     |      UU1UUU       |
|  0  |   U   |   U    |    U    |    UU1UUU     |      UU1UUU       |
|  1  |   U   |   U    |    U    |    UUU1UU     |      UU1UUU       |
|  0  |   U   |   0    |    U    |    U0UUUU     |      U0UUUU       |
|  1  |   U   |   U    |    U    |    UU0UUU     |      U0UUUU       |
|  U  |   U   |   1    |    U    |    UUUUUU     |      U1UUUU       |
|  U  |   U   |   U    |    U    |    U11UUU     |      U1UUUU       |
|  0  |   U   |   U    |    U    |    U1UUUU     |      U1UUUU       |
|  1  |   U   |   U    |    U    |    UU1UUU     |      U1UUUU       |
|  0  |   U   |   0    |    U    |    0UUUUU     |      0UUUUU       |
|  1  |   U   |   U    |    U    |    U0UUUU     |      0UUUUU       |
|  U  |   U   |   1    |    U    |    UUUUUU     |      1UUUUU       |
|  U  |   U   |   U    |    U    |    11UUUU     |      1UUUUU       |
|  0  |   U   |   U    |    U    |    1UUUUU     |      1UUUUU       |
|  1  |   U   |   U    |    U    |    U1UUUU     |      1UUUUU       |

## Testbench

### Initialization

- `UUUUUU`: `rdy = U & tzpre = U & t_zero = U & t_res_1 = U`
- `111110`: `rdy = 0 & tzpre = U & t_zero = 1 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = U & t_res_1 = 1`

### 6 Cycles Opcode
- `111011`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `110111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `101111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `011111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `111110`: `rdy = 0 & tzpre = U & t_zero = 1 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = U & t_res_1 = 1`

### 2 Cycles Opcode
- `111010`: `rdy = 1 & tzpre = 0 & t_zero = 0 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = 1 & t_res_1 = 1`

### 5 Cycles Opcode
- `111011`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `110111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `101111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `111110`: `rdy = 0 & tzpre = U & t_zero = 1 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = U & t_res_1 = 1`

### 4 Cycles Opcode
- `111011`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `110111`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `111110`: `rdy = 0 & tzpre = U & t_zero = 1 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = U & t_res_1 = 1`

### 3 Cycles Opcode
- `111011`: `rdy = 1 & tzpre = 1 & t_zero = 0 & t_res_1 = 0`
- `111110`: `rdy = 0 & tzpre = U & t_zero = 1 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = U & t_res_1 = 1`

### 2 Cycles Opcode
- `111010`: `rdy = 1 & tzpre = 0 & t_zero = 0 & t_res_1 = 0`
- `111101`: `rdy = 1 & tzpre = U & t_zero = 1 & t_res_1 = 1`



## Timing Equations

### Case : `UUUUUX` (`timing_n(0) = X`)
- `=> not t0`
- `=> not (t_reset(0) or (timing_c2(0) and not t0_c2_rdy))`
   - `=> not t_reset(0) and not (timing_c2(0) and not t0_c2_rdy)`
   - `=> not t_reset(0) and (not timing_c2(0) or t0_c2_rdy)`
- `=> not (not (sync or (not t_zero and tzpre))) and (not (not timing_n(0) [CLK2]) or (timing_c2(0) and rdy))`
   - `=> not (not sync and not (not t_zero and tzpre)) and (timing_n(0) [CLK2] or (timing_c2(0) and rdy))`
   - `=> not (not sync and (t_zero or not tzpre)) and (timing_n(0) [CLK2] or (timing_c2(0) and rdy))`
   - `=> (sync or not (t_zero or not tzpre)) and (timing_n(0) [CLK2] or (timing_c2(0) and rdy))`
   - `=> (sync or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or (timing_c2(0) and rdy))`
- `=> (sync or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or (not timing_n(0) [CLK2] and rdy))`
   - `=> (sync or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or rdy)`
- `=> (t_res_1 [CLK1] or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or rdy)`

### Case : `UUUUU0` (`timing_n(0) = 0`)
- `=> ((t_res_1 [CLK1] or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or rdy)) = 0`
- `=> (t_res_1 [CLK1] or (not t_zero and tzpre)) = 0 or (timing_n(0) [CLK2] or rdy) = 0`
- `=> (t_res_1 [CLK1] = 0 and (not t_zero and tzpre) = 0) or (timing_n(0) [CLK2] = 0 and rdy = 0)`
- `=> (t_res_1 [CLK1] = 0 and (t_zero = 1 or tzpre = 0)) or (timing_n(0) [CLK2] = 0 and rdy = 0)`

### Case : `UUUUU1` (`timing_n(0) = 1`)
- `=> ((t_res_1 [CLK1] or (not t_zero and tzpre)) and (timing_n(0) [CLK2] or rdy)) = 1`
- `=> (t_res_1 [CLK1] or (not t_zero and tzpre)) = 1 and (timing_n(0) [CLK2] or rdy) = 1`
- `=> (t_res_1 [CLK1] = 1 or (not t_zero and tzpre) = 1) and (timing_n(0) [CLK2] = 1 or rdy = 1)`
- `=> (t_res_1 [CLK1] = 1 or (t_zero = 0 and tzpre = 1)) and (timing_n(0) [CLK2] = 1 or rdy = 1)`

---

### Case : `UUUUXU` (`timing_n(1) = X`)
- `=> not t_reset_c1(1)`
- `=> not t_reset(1) [CLK1]`
- `=> not (timing_c2(0) and rdy) [CLK1]`
   - `=> not timing_c2(0) [CLK1] or not rdy [CLK1]`
- `=> timing_n(0) [CLK2->CLK1] or not rdy [CLK1]`

### Case : `UUUU0U` (`timing_n(1) = 0`)
- `=> (timing_n(0) [CLK2->CLK1] or not rdy [CLK1]) = 0`
- `=> timing_n(0) [CLK2->CLK1] = 0 and rdy [CLK1] = 1`

### Case : `UUUU1U` (`timing_n(1) = 1`)
- `=> (timing_n(0) [CLK2->CLK1] or not rdy [CLK1]) = 1`
- `=> timing_n(0) [CLK2->CLK1] = 1 or rdy [CLK1] = 0`

---

### Case : `UUUXUU` (`timing_n(2) = X`)
- `=> t_zero or t_reset_c1(2)`
- `=> t_zero or t_reset(2) [CLK1]`
- `=> t_zero or not ((timing_c2(2) and not rdy) or (sync_c2 and rdy)) [CLK1]`
   - `=> t_zero or (not (timing_c2(2) and not rdy) and not (sync_c2 and rdy)) [CLK1]`
   - `=> t_zero or ((not timing_c2(2) or rdy) and (not sync_c2 or not rdy)) [CLK1]`
- `=> t_zero or ((timing_n(2) [CLK2] or rdy) and (not sync [CLK2] or not rdy)) [CLK1]`
- `=> t_zero or ((timing_n(2) [CLK2] or rdy) and (not t_res_1 [CLK1->CLK2] or not rdy)) [CLK1]`

### Case : `UUU0UU` (`timing_n(2) = 0`)
- `=> (t_zero or ((timing_n(2) [CLK2] or rdy) and (not t_res_1 [CLK1->CLK2] or not rdy)) [CLK1]) = 0`
- `=> t_zero = 0 and ((timing_n(2) [CLK2] or rdy) and (not t_res_1 [CLK1->CLK2] or not rdy)) [CLK1] = 0`
- `=> t_zero = 0 and ((timing_n(2) [CLK2] or rdy) = 0 or (not t_res_1 [CLK1->CLK2] or not rdy) = 0) [CLK1] `
- `=> t_zero = 0 and ((timing_n(2) [CLK2] = 0 and rdy = 0) or (t_res_1 [CLK1->CLK2] = 1 and rdy = 1)) [CLK1] `

### Case : `UUU1UU` (`timing_n(2) = 1`)
- `=> (t_zero or ((timing_n(2) [CLK2] or rdy) and (not t_res_1 [CLK1->CLK2] or not rdy)) [CLK1]) = 1`
- `=> t_zero = 1 or ((timing_n(2) [CLK2] or rdy) and (not t_res_1 [CLK1->CLK2] or not rdy)) [CLK1] = 1`
- `=> t_zero = 1 or ((timing_n(2) [CLK2] or rdy) = 1 and (not t_res_1 [CLK1->CLK2] or not rdy) = 1) [CLK1]`
- `=> t_zero = 1 or ((timing_n(2) [CLK2] = 1 or rdy = 1) and (t_res_1 [CLK1->CLK2] = 0 or rdy = 0)) [CLK1]`

---

### Case : `UUXUUU` (`timing_n(3) = X`)
- `=> t_zero or t_reset_c1(3)`
- `=> t_zero or t_reset(3) [CLK1]`
- `=> t_zero or not ((timing_c2(3) and not rdy) or (timing_c2(2) and rdy)) [CLK1]`
   - `=> t_zero or (not (timing_c2(3) and not rdy) and not (timing_c2(2) and rdy)) [CLK1]`
   - `=> t_zero or ((not timing_c2(3) or rdy) and (not timing_c2(2) or not rdy)) [CLK1]`
- `=> t_zero or ((timing_n(3) [CLK2] or rdy) and (timing_n(2) [CLK2] or not rdy)) [CLK1]`

### Case : `UU0UUU` (`timing_n(3) = 0`)
- `=> (t_zero or ((timing_n(3) [CLK2] or rdy) and (timing_n(2) [CLK2] or not rdy)) [CLK1]) = 0`
- `=> t_zero = 0 and ((timing_n(3) [CLK2] or rdy) and (timing_n(2) [CLK2] or not rdy)) [CLK1] = 0`
- `=> t_zero = 0 and ((timing_n(3) [CLK2] or rdy) = 0 or (timing_n(2) [CLK2] or not rdy) = 0) [CLK1]`
- `=> t_zero = 0 and ((timing_n(3) [CLK2] = 0 and rdy = 0) or (timing_n(2) [CLK2] = 0 and rdy = 1)) [CLK1]`

### Case : `UU1UUU` (`timing_n(3) = 1`)
- `=> (t_zero or ((timing_n(3) [CLK2] or rdy) and (timing_n(2) [CLK2] or not rdy)) [CLK1]) = 1`
- `=> t_zero = 1 or ((timing_n(3) [CLK2] or rdy) and (timing_n(2) [CLK2] or not rdy)) [CLK1] = 1`
- `=> t_zero = 1 or ((timing_n(3) [CLK2] or rdy) = 1 and (timing_n(2) [CLK2] or not rdy) = 1) [CLK1]`
- `=> t_zero = 1 or ((timing_n(3) [CLK2] = 1 or rdy = 1) and (timing_n(2) [CLK2] = 1 or rdy = 0)) [CLK1]`

---

### Case : `UXUUUU` (`timing_n(4) = X`)
- `=> t_zero or ((timing_n(4) [CLK2] or rdy) and (timing_n(3) [CLK2] or not rdy)) [CLK1]`

### Case : `U0UUUU` (`timing_n(4) = 0`)
- `=> t_zero = 0 and ((timing_n(4) [CLK2] = 0 and rdy = 0) or (timing_n(3) [CLK2] = 0 and rdy = 1)) [CLK1]`

### Case : `U1UUUU` (`timing_n(4) = 1`)
- `=> t_zero = 1 or ((timing_n(4) [CLK2] = 1 or rdy = 1) and (timing_n(3) [CLK2] = 1 or rdy = 0)) [CLK1]`

---

### Case : `XUUUUU` (`timing_n(5) = X`)
- `=> t_zero or ((timing_n(5) [CLK2] or rdy) and (timing_n(4) [CLK2] or not rdy)) [CLK1]`

### Case : `0UUUUU` (`timing_n(5) = 0`)
- `=> t_zero = 0 and ((timing_n(5) [CLK2] = 0 and rdy = 0) or (timing_n(4) [CLK2] = 0 and rdy = 1)) [CLK1]`

### Case : `1UUUUU` (`timing_n(5) = 1`)
- `=> t_zero = 1 or ((timing_n(5) [CLK2] = 1 or rdy = 1) and (timing_n(4) [CLK2] = 1 or rdy = 0)) [CLK1]`