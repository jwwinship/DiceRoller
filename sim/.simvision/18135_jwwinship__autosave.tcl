
# XM-Sim Command File
# TOOL:	xmsim	22.09-s011
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
set vcd_compact_mode 0
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves TB_POSTPROCESS.clk TB_POSTPROCESS.dataa TB_POSTPROCESS.datab TB_POSTPROCESS.done TB_POSTPROCESS.f TB_POSTPROCESS.i_data_in TB_POSTPROCESS.r_dieSelect TB_POSTPROCESS.r_randomValid TB_POSTPROCESS.r_rollResult TB_POSTPROCESS.r_stop TB_POSTPROCESS.reset_n TB_POSTPROCESS.result TB_POSTPROCESS.w_random TB_POSTPROCESS.w_tx
probe -create -database waves TB_POSTPROCESS.RNG_DUT.clk TB_POSTPROCESS.RNG_DUT.clk_en TB_POSTPROCESS.RNG_DUT.dataa TB_POSTPROCESS.RNG_DUT.datab TB_POSTPROCESS.RNG_DUT.done TB_POSTPROCESS.RNG_DUT.f TB_POSTPROCESS.RNG_DUT.i_data_in TB_POSTPROCESS.RNG_DUT.r_dieSelect TB_POSTPROCESS.RNG_DUT.r_randomValid TB_POSTPROCESS.RNG_DUT.r_rollResult TB_POSTPROCESS.RNG_DUT.r_stop TB_POSTPROCESS.RNG_DUT.reset TB_POSTPROCESS.RNG_DUT.reset_n TB_POSTPROCESS.RNG_DUT.result TB_POSTPROCESS.RNG_DUT.start TB_POSTPROCESS.RNG_DUT.w_random TB_POSTPROCESS.RNG_DUT.w_tx
probe -create -database waves TB_POSTPROCESS.RNG_DUT.DUT_GARO.bitCount TB_POSTPROCESS.RNG_DUT.DUT_GARO.clk TB_POSTPROCESS.RNG_DUT.DUT_GARO.meta1 TB_POSTPROCESS.RNG_DUT.DUT_GARO.meta2 TB_POSTPROCESS.RNG_DUT.DUT_GARO.random TB_POSTPROCESS.RNG_DUT.DUT_GARO.reset_n TB_POSTPROCESS.RNG_DUT.DUT_GARO.stage TB_POSTPROCESS.RNG_DUT.DUT_GARO.stop

simvision -input /home/jwwinship/Resources/DiceRoller/sim/.simvision/18135_jwwinship__autosave.tcl.svcf
