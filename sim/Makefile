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

clean:
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ waves.shm
