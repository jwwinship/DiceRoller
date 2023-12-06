module debounce(

	input button_in,clk,
	output button_out);


wire slow_clk;

wire Q1,Q2,Q2_bar,Q0;


clock_div u1(

	clk,
	slow_clk
);


dff d0(

	slow_clk, 

	button_in,
	Q0 
);

dff d1(

	slow_clk, 
	Q0,
	Q1 
);


dff d2(

	slow_clk,
	Q1,
	Q2
);


assign Q2_bar = ~Q2;

assign button_out = Q1 & Q2_bar;

endmodule

module clock_div(

	input Clk_100M, 
	output slow_clk

);

	reg slow_clk;
    reg [26:0]counter=0;


always @(posedge Clk_100M)
    begin
        counter <= (counter>=249999)?0:counter+1;
        slow_clk <= (counter < 125000)?1'b0:1'b1;
    end
endmodule



module dff(

	input clk_dff, D, 

	output reg Q
);

    always @ (posedge clk_dff) begin
        Q <= D;
    end

endmodule