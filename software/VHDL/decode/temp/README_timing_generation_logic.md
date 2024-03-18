UUUUUX : s_timing_n(0)
=> not s_t0
=> not (s_t_reset(0) or (s_timing_c2(0) and not s_t0_c2_rdy))
=> not s_t_reset(0) and not (s_timing_c2(0) and not s_t0_c2_rdy)
=> not s_t_reset(0) and (not s_timing_c2(0) or s_t0_c2_rdy)
=> not (not (s_sync or (not i_rcl_t_zero and i_pl_tzpre))) and (not (not s_timing_n(0) [CLK2]) or (s_timing_c2(0) and i_rc_rdy))
=> (s_sync or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or (not s_timing_n(0) [CLK2] and i_rc_rdy))
=> (i_rcl_t_res_1 [CLK1] or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or i_rc_rdy)

UUUUU0 : s_timing_n(0) = 0 [CLK1]
=> (i_rcl_t_res_1 [CLK1] or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or i_rc_rdy) = 0
=> (i_rcl_t_res_1 or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or i_rc_rdy) = 0

=>(i_rcl_t_res_1 or (not i_rcl_t_zero and i_pl_tzpre)) = 0 or (s_timing_n(0) [CLK2] or i_rc_rdy) = 0
=>(i_rcl_t_res_1 = 0 and (i_rcl_t_zero = 1 and i_pl_tzpre = 0)) or (s_timing_n(0) [CLK2] = 0 and i_rc_rdy = 0)

UUUUU1 : s_timing_n(0) = 1 [CLK1]
=> (i_rcl_t_res_1 or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or i_rc_rdy) = 1
=> (i_rcl_t_res_1 or (not i_rcl_t_zero and i_pl_tzpre)) and (s_timing_n(0) [CLK2] or i_rc_rdy) = 1
=>(i_rcl_t_res_1 or (not i_rcl_t_zero and i_pl_tzpre)) = 1 and (s_timing_n(0) [CLK2] or i_rc_rdy) = 1
=>(i_rcl_t_res_1 = 1 or (i_rcl_t_zero = 0 and i_pl_tzpre = 1)) and (s_timing_n(0) [CLK2] = 1 or i_rc_rdy = 1)



UUUUXU : s_timing_n(1)
=> not s_t_reset_c1(1)
=> not s_t_reset(1) [CLK1]
=> not (s_timing_c2(0) and i_rc_rdy) [CLK1]
=> not (not s_timing_n(0) [CLK2] and i_rc_rdy) [CLK1]
=> (s_timing_n(0) [CLK2] or not i_rc_rdy) [CLK1]

UUUU0U : s_timing_n(1) = 0 [CLK1]
=> (s_timing_n(0) [CLK2] or not i_rc_rdy) [CLK1] = 0
=> (s_timing_n(0) [CLK2] or not i_rc_rdy) = 0
=> (s_timing_n(0) [CLK2] = 0 and i_rc_rdy = 1)

UUUU1U : s_timing_n(1) = 1 [CLK1]
=> (s_timing_n(0) [CLK2] or not i_rc_rdy) [CLK1] = 1
=> (s_timing_n(0) [CLK2] or not i_rc_rdy) = 1
=> (s_timing_n(0) [CLK2] = 1 or i_rc_rdy = 0)



UUUXUU : s_timing_n(2)
=> i_rcl_t_zero or s_t_reset_c1(2)
=> i_rcl_t_zero or s_t_reset(2) [CLK1]
=> i_rcl_t_zero or not ((s_timing_c2(2) and not i_rc_rdy) or (s_sync_c2 and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or not ((not s_timing_n(2) [CLK2] and not i_rc_rdy) or (s_sync [CLK2] and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or not ((not s_timing_n(2) [CLK2] and not i_rc_rdy) or (i_rcl_t_res_1 [CLK1->CLK2] and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or (not (not s_timing_n(2) [CLK2] and not i_rc_rdy) and not (i_rcl_t_res_1 [CLK1->CLK2] and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) [CLK1]

UUU0UU : s_timing_n(2) = 0 [CLK1]
=> i_rcl_t_zero or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) [CLK1] = 0
=> i_rcl_t_zero or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) = 0
=>i_rcl_t_zero = 0 and ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) = 0
=>i_rcl_t_zero = 0 and ((s_timing_n(2) [CLK2] or i_rc_rdy) = 0 or (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy) = 0)
=>i_rcl_t_zero = 0 and ((s_timing_n(2) [CLK2] = 0 and i_rc_rdy = 0) or (i_rcl_t_res_1 [CLK1->CLK2] = 1 and i_rc_rdy = 1))

UUU1UU : s_timing_n(2) = 1 [CLK1]
=> i_rcl_t_zero or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) [CLK1] = 1
=> i_rcl_t_zero or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) = 1
=> i_rcl_t_zero = 1 or ((s_timing_n(2) [CLK2] or i_rc_rdy) and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy)) = 1
=> i_rcl_t_zero = 1 or ((s_timing_n(2) [CLK2] or i_rc_rdy) = 1 and (not i_rcl_t_res_1 [CLK1->CLK2] or not i_rc_rdy) = 1)
=> i_rcl_t_zero = 1 or ((s_timing_n(2) [CLK2] = 1 or i_rc_rdy = 1) and (i_rcl_t_res_1 [CLK1->CLK2] = 0 or i_rc_rdy = 0))



UUXUUU : s_timing_n(3)
=> i_rcl_t_zero or s_t_reset_c1(3)
=> i_rcl_t_zero or s_t_reset(3) [CLK1]
=> i_rcl_t_zero or not ((s_timing_c2(3) and not i_rc_rdy) or (s_timing_c2(2) and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or (not (s_timing_c2(3) and not i_rc_rdy) and not (s_timing_c2(2) and i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or ((not s_timing_c2(3) or i_rc_rdy) and (not s_timing_c2(2) or not i_rc_rdy)) [CLK1]
=> i_rcl_t_zero or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) [CLK1]

UU0UUU : s_timing_n(3) = 0 [CLK1]
=> i_rcl_t_zero or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) [CLK1] = 0
=> i_rcl_t_zero or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) = 0
=> i_rcl_t_zero = 0 and ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) = 0
=> i_rcl_t_zero = 0 and ((s_timing_n(3) [CLK2] or i_rc_rdy) = 0 or (s_timing_n(2) [CLK2] or not i_rc_rdy) = 0)
=> i_rcl_t_zero = 0 and ((s_timing_n(3) [CLK2] = 0 and i_rc_rdy = 0) or (s_timing_n(2) [CLK2] = 0 and i_rc_rdy = 1))

UU1UUU : s_timing_n(3) = 1 [CLK1]
=> i_rcl_t_zero or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) [CLK1] = 1
=> i_rcl_t_zero or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) = 1
=> i_rcl_t_zero = 1 or ((s_timing_n(3) [CLK2] or i_rc_rdy) and (s_timing_n(2) [CLK2] or not i_rc_rdy)) = 1
=> i_rcl_t_zero = 1 or ((s_timing_n(3) [CLK2] or i_rc_rdy) = 1 and (s_timing_n(2) [CLK2] or not i_rc_rdy) = 1)
=> i_rcl_t_zero = 1 or ((s_timing_n(3) [CLK2] = 1 or i_rc_rdy = 1) and (s_timing_n(2) [CLK2] = 1 or not i_rc_rdy = 0))



UXUUUU : s_timing_n(4)
=> i_rcl_t_zero or ((s_timing_n(4) [CLK2] or i_rc_rdy) and (s_timing_n(3) [CLK2] or not i_rc_rdy)) [CLK1]

U0UUUU : s_timing_n(4) = 0 [CLK1]
=> i_rcl_t_zero = 0 and ((s_timing_n(4) [CLK2] = 0 and i_rc_rdy = 0) or (s_timing_n(3) [CLK2] = 0 and i_rc_rdy = 1))

U1UUUU : s_timing_n(4) = 1 [CLK1]
=> i_rcl_t_zero = 1 or ((s_timing_n(4) [CLK2] = 1 or i_rc_rdy = 1) and (s_timing_n(3) [CLK2] = 1 or not i_rc_rdy = 0))



XUUUUU : s_timing_n(5)
=> i_rcl_t_zero or ((s_timing_n(5) [CLK2] or i_rc_rdy) and (s_timing_n(4) [CLK2] or not i_rc_rdy)) [CLK1]

0UUUUU : s_timing_n(5) = 0 [CLK1]
=> i_rcl_t_zero = 0 and ((s_timing_n(5) [CLK2] = 0 and i_rc_rdy = 0) or (s_timing_n(4) [CLK2] = 0 and i_rc_rdy = 1))

1UUUUU : s_timing_n(5) = 1 [CLK1]
=> i_rcl_t_zero = 1 or ((s_timing_n(5) [CLK2] = 1 or i_rc_rdy = 1) and (s_timing_n(4) [CLK2] = 1 or not i_rc_rdy = 0))
