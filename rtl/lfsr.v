`timescale 1ns/1ps
module lfsr (
	input clk,    
	input reset_n,
	output Q//20,17

);


reg [0:19] current_val, next_value;
wire taps;

assign taps = current_val[19] ^ current_val[16];

always @(posedge clk, negedge reset_n)

begin
	
	if(~reset_n)
		current_val <= 'd1;
	else
		current_val <= next_value;

end

always @(*)
		next_value = {taps, current_val[0:18]};

assign Q = current_val[0];




endmodule