`timescale 1ns/1ps
/* Serial In, Parallel Out module
	Recieves one bit per 'cycles_per_bit' cycles, storing these bits in a shift register
	
	TODO: Implement state machine?
*/

module SIPO #(parameter cycles_per_bit = 0) 
	(
		input wire clk,
		input wire reset_n,
		input wire i_data_in, 
		input wire i_start,
		output wire[6:0] o_data_out,
		output wire o_valid
	);
	
	reg [6:0] r_data_temp;
	reg r_valid;
	reg [7:0] r_cycle_ctr; //Unsure of max size, depends on how many cycles per bit. Seems difficult to implement logarithm to parameterize this.
	reg [2:0] r_bit_ctr;
	
	reg [1:0] r_current_state, r_next_state;
	
	localparam s_IDLE = 0, s_START = 1, s_SHIFT = 2, s_DONE = 3; //Define state parameters

	always @(posedge clk)
	begin
		if (!reset_n)
		begin
			r_current_state <= s_IDLE;
			r_cycle_ctr <= 0;
			r_bit_ctr <= 0;
			r_valid <= 0;
			r_data_temp <= 0;
		end
		
		else if (r_cycle_ctr == cycles_per_bit)
		begin
			r_current_state <= r_next_state;
			r_cycle_ctr <= 0;
		end
		else begin
			r_current_state <= r_current_state;
			//r_cycle_ctr <= r_cycle_ctr + 1;	
		end
		
		case(r_next_state)
			s_IDLE: begin
				r_cycle_ctr <= 8'b0; //Reset cycle counter
				r_valid <= 0;
				r_data_temp <= 0;
				r_bit_ctr <= 0;
			end
			
			s_START: begin
				r_valid <= 0;
			end
			
			s_SHIFT: begin
				//if (r_cycle_ctr == cycles_per_bit) begin //If we've gone through enough cycles for data to be available, execute shift
					//r_cycle_ctr <= 8'b0; //Reset cycle counter
					r_data_temp <= {i_data_in, r_data_temp[6:1]}; //Shift in new value
					r_bit_ctr <= r_bit_ctr + 1; //Add 1 to bit counter
			end
			
			s_DONE: begin
				r_valid <= 1;
			end
			
			default: r_data_temp <= 7'b1110111;
			
		endcase
	end
	
	assign o_valid = r_valid;
	assign o_data_out = r_data_temp;
	
	
	//Combinational logic
	always @(*) 
	begin
		case(r_current_state)
			s_IDLE: begin
				if (i_start) begin
					r_next_state <= s_SHIFT;
				end
				
				else 
				begin
					r_next_state <= s_IDLE;
				end
			end
			
			s_START: begin
				r_next_state <= s_SHIFT; //A one cycle delay for start bit
			end
			
			s_SHIFT: begin
				if (r_cycle_ctr == cycles_per_bit) begin //If we've gone through enough cycles for data to be available, execute shift
					r_cycle_ctr <= 8'b0; //Reset cycle counter

					if (r_bit_ctr == 3'd7) 
					begin
						//r_valid <= 1; //If we have all bits in the register, set the valid flag
						r_next_state <= s_DONE;
					end
					
					else r_next_state <= s_SHIFT;
				end
				
				else r_cycle_ctr <= r_cycle_ctr + 1;
			end
			
			s_DONE: begin
				r_next_state <= s_IDLE;
			end
			
			default: r_next_state <= r_current_state;
			
		endcase
	end
	
endmodule