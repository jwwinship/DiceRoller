module interface(

input [2:0] i_userInput,
input [7:0] i_randomData,
input i_clk,
input i_reset_n,
input  i_uart,
output reg o_stop,
output [4:0] o_dieRoll,
output reg o_uart

);

reg [4:0] r_dieRoll;
reg [2:0] r_dieSelect;

assign o_dieRoll = r_dieRoll;

always @ (posedge i_clk) begin

 if (i_userInput == 3'b111) begin

	//testing mode, worry about later. Needs to tell the garo to just keep on sending data?

		o_uart = i_randomData;

	end 
	else begin

		r_dieSelect = i_userInput;
		o_stop = 1'b1;

	end  
 
end  


always @ (r_dieSelect) begin

	case(r_dieSelect)  

		3'b000: r_dieRoll = i_randomData[6:0] % 4;
		3'b001: r_dieRoll = i_randomData[6:0] % 6;
		3'b010: r_dieRoll = i_randomData[6:0] % 8;
		3'b011: r_dieRoll = i_randomData[6:0] % 10;
		3'b100: r_dieRoll = i_randomData[6:0] % 12;
		3'b101: r_dieRoll = i_randomData[6:0] % 20;
		default: r_dieRoll = 5'b0000;
		

	endcase
end  



endmodule