`timescale 1ns / 1ps
module debounce(
input pb,clk_in,
output pb_out);

wire slow_clk;
wire Q1,Q2,Q2_bar,Q0;

clk_div u1(clk_in,slow_clk);

dff d0(clk_in,slow_clk,pb,Q0);
dff d1(clk_in,slow_clk,Q0,Q1);
dff d2(clk_in,slow_clk,Q1,Q2);



assign Q2_bar = ~Q2;
assign pb_out = Q1 & Q2_bar;
endmodule




module clk_div(
	input fast_clk,
	output slow_clk_en
);

    reg [26:0]counter=0;
    always @(posedge fast_clk)
    begin
       counter <= (counter>=249999)?0:counter+1;
    end
    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
endmodule



module dff(
	input DFF_CLOCK,
	input clock_enable,
	input D, 
	output Q
);

	reg Q = 0;
    always @ (posedge DFF_CLOCK) begin
  if(clock_enable==1) 
           Q <= D;
    end
endmodule 