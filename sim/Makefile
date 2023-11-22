sim:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
	    RNGTB.v \
	-access +rwc \
	-top RNGTB 
 
simgui:
	xrun \
		../rtl/RNG.v \
		../rtl/GARO.v \
	    RNGTB.v \
	-access +rwc \
	-gui \
	-linedebug \
	-top RNGTB 

clean:
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ waves.shm
