module interface_tb;

reg clk;
reg reset_n;

reg [2:0] userInput;
reg [7:0] randomData;
wire 	   uart;
wire	   stop;
reg [4:0]  r_dieRoll;
wire [4:0] o_dieRoll;
wire	   o_urt;

assign o_dieRoll = r_dieRoll;

 initial begin 
    forever begin
    clk = 0;
    #10 clk = ~clk;
 end 
 end

interface interface_test_unit(

.i_userInput(userInput),
.i_randomData(randomData),
.i_clk(clk),
.i_reset_n(reset_n),
.i_uart(uart),
.o_stop(stop),
.o_dieRoll(o_dieRoll),
.o_uart(o_urt)

);

	initial begin

	clk = 0;
	reset_n = 0;

	@(posedge clk) begin

		reset_n = 1;

		randomData = $random % 128;
		userInput = 3'b000;
		$display("D4: %b", r_dieRoll);
		#10;



		randomData = $random % 128;
		userInput = 3'b001;
		$display("D6: %b", r_dieRoll);
		#10;

		randomData = $random % 128;
		userInput = 3'b010;
		$display("D8: %b", r_dieRoll);
		#10;

		randomData = $random % 128;
		userInput = 3'b011;
		$display("D10: %b", r_dieRoll);
		#10;

		randomData = $random % 128;
		userInput = 3'b100;
		$display("D12: %b", r_dieRoll);
		#10;

		randomData = $random % 128;
		userInput = 3'b101;
		$display("D20: %b", r_dieRoll);
		#10;

		end

		$finish;

	end


endmodule