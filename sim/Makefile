
sim_interface:
	xrun  \
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
	xrun  \
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

clean:
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ waves.shm
