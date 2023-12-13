module RNG_NIOS_INSTR ( clk, clk_en, reset, start, dataa, datab, result, done);
	input clk;
	input clk_en;
	input reset;
	input start;
	input [31:0] dataa;
	input [31:0] datab;
	output [31:0] result;
	output done;
	
	//reg clk;
	wire reset_n;
	wire w_data_in;
	
	wire[31:0] f;
	
	wire [3:0]r_dieSelect;
	
	wire r_stop;
	wire [6:0] w_random;
	wire r_randomValid;
	wire [4:0] r_rollResult;
	wire w_tx;
	
	assign done = r_randomValid;
	assign reset_n = !reset; //Negate reset
	assign r_dieSelect = dataa[3:0]; //Die Selection is first 4 bits of input dataa
	
	lfsr DUT_LFSR(.clk(clk), .reset_n(reset_n),.Q(w_data_in));
	SIPO DUT_SIPO(.clk(clk), .reset_n(reset_n), .i_data_in(w_data_in), .i_start(!r_stop), .o_data_out(w_random), .o_valid(r_randomValid));
	postProcess DUT_PP(.i_dieSelect(r_dieSelect),
						.i_randomData(w_random),
						.i_clk(clk),
						.i_reset_n(reset_n),
						.i_uart(1'b0),
						.i_valid(r_randomValid), //Indicates valid random number input 
						.o_stop(r_stop),
						.o_dieRoll(r_rollResult),
						.o_tx(w_tx)); //Serial output
						
	assign result = (done) ? {27'b0, r_rollResult[4:0]} : result;
endmodule