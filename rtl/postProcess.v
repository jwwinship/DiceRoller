module postProcess(

input wire [3:0] i_dieSelect,
input wire [6:0] i_randomData,
input wire i_clk,
input wire i_reset_n,
input wire  i_uart,
input wire i_valid, //Indicates valid random number input 
output wire o_stop,
output wire [4:0] o_dieRoll,
output wire o_tx //Serial output 

);

reg [4:0] r_dieRoll;
reg [3:0] r_dieSelect;
reg r_tx;
reg r_stop; 				//Stop should always be high until we need to generate random number. 
reg [6:0] r_randomData; 

//internal registers
reg r_transmitDone; //Flag to indicate complete transmission

//State registers
reg [1:0] r_current_state, r_next_state;

localparam s_resetRNG = 0, s_IDLE = 1, s_CALC = 2, s_TRANSMIT = 3; //Declare local parameters for state machine




//Sequential Logic
always @(posedge i_clk) begin
	if (!i_reset_n)
	begin	
		r_dieRoll <= 0;
		r_dieSelect <= 4'b1111; //Reset die select
		r_stop <= 1; //Initialize r_stop
		r_transmitDone <= 0;
		r_tx <= 0;
		//r_randomData <= 0;
		r_current_state <= s_resetRNG;
	end
	r_current_state <= r_next_state; //Set current State
	
	
	case(r_current_state)
		s_resetRNG: begin
			
			 if (!i_valid) begin // if no valid number, deassert stop several times until a valid signal is given
					r_stop <= 1'b0; 
	
			end
			
			else if (i_valid) begin
				r_stop <= 1'b1; //If valid number is given, reset oscillator
				r_randomData <= i_randomData; //If signal is valid, capture signal with 
			end
		end
		
		s_IDLE: begin
			//Assign output to hexadecimal display corresponding to no roll
			//
			r_dieRoll <= 0; //Reset roll result
			r_transmitDone <= 0; //Reset transmission flag
			r_dieSelect <= i_dieSelect; //set die select
		end
		
		s_CALC: begin
			
			case (r_dieSelect)
				4'b0000: r_dieRoll <= r_randomData[6:0] % 4;
				4'b0001: r_dieRoll <= r_randomData[6:0] % 6;
				4'b0010: r_dieRoll <= r_randomData[6:0] % 8;
				4'b0011: r_dieRoll <= r_randomData[6:0] % 10;
				4'b0100: r_dieRoll <= r_randomData[6:0] % 12;
				4'b0101: r_dieRoll <= r_randomData[6:0] % 20;
				default: r_dieRoll <= 0; //Default case, no roll. 
			endcase
		end
		
		s_TRANSMIT: begin
			//Transmit data
			
			r_transmitDone <= 1;
		end
		
		default: begin
			r_next_state <= s_resetRNG;
		end
	endcase

end

//Combinational State Logic
always @(*) begin
	if (!i_reset_n)
	begin
		r_next_state <= s_resetRNG; //on reset, generate new random number. 
	end
	
	case(r_current_state)
		//Reset state: Issue request for random number, and wait for valid response
		s_resetRNG: begin
		
			
			if (i_valid && i_randomData >= 1 && i_randomData <= 120) begin
				r_next_state <= s_IDLE;
				//r_randomData <= i_randomData; //Relocate
			end
			
			else if (i_valid && !(i_randomData >= 1 && i_randomData <= 120)) begin
				r_next_state <= s_resetRNG; //If data is valid, but range is invalid, stay in s_resetRNG
				
			end
			
			else if (!i_valid) begin //IF no valid number is present, wait for valid number
				r_next_state <= s_resetRNG;
			end
		end
		
		s_IDLE: begin
			if (i_dieSelect == 4'b1111) begin //If no input is given
				r_next_state <= s_IDLE;
			end
			
			else begin	//If button input has been given, or if developer test mode is enabled
				r_next_state <= s_CALC;
			end
		end
		
		s_CALC: begin
			r_next_state <= s_TRANSMIT; //It should only take one cycle for modulo operation to complete. If not, add "answer_ready" flag in sequential logic, and add here
		end
		
		s_TRANSMIT: begin
			if (r_transmitDone) r_next_state <= s_resetRNG;
			else 				r_next_state <= s_TRANSMIT;
		end
		
		default: begin
			r_next_state <= s_resetRNG;
		end
	endcase
end
/*always @ (r_dieSelect) begin

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

*/

assign o_dieRoll = r_dieRoll; //Assign output
assign o_stop = r_stop;
assign o_tx = r_tx;
//assign r_dieSelect = i_dieSelect; //Assign input to register

endmodule