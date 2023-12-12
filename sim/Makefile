sim_interface:
	xrun \
		../rtl/interface.v \
		interface_tb.v \
		-access +rwc \
		-top interface_tb 

simgui_interface:
	xrun \
		../rtl/interface.v \
		interface_tb.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top interface_tb

sim_encoder:
	xrun \
		../rtl/encoder.v \
		TB_ENCODER.v \
		-access +rwc \
		-top TB_ENCODER    

simgui_encoder:
	xrun \
		../rtl/encoder.v \
		TB_ENCODER.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top TB_ENCODER 

sim:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
		../rtl/SIPO.v \
		RNGTB.v \
		-access +rwc \
		-top RNGTB 

simgui:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
		../rtl/SIPO.v \
		RNGTB.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top RNGTB 

sim_debounce:
	xrun \
		../rtl/debounce.v \
		debounceTB.v \
		-access +rwc \
		-top debounceTB 

simgui_debounce:
	xrun \
		../rtl/debounce.v \
		debounceTB.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top debounceTB 

simsipo:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
		../rtl/SIPO.v \
		TB_SIPO.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top TB_SIPO 

simint:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
		../rtl/SIPO.v \
		../rtl/postProcess.v \
		TB_POSTPROCESS.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top TB_POSTPROCESS

sim_top:
	xrun \
		../rtl/debounce.v \
		../rtl/encoder.v \
		../rtl/top.v \
		topTB.v \
		-access +rwc \
		-top topTB 

simgui_top:
	xrun \
		../rtl/debounce.v \
		../rtl/encoder.v \
		../rtl/top.v \
		../sim/topTB.v \
		-access +rwc \
		-gui \
		-linedebug \
		-top topTB   

clean:
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ waves.shm
