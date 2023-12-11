/*This module attempts to implement a Galois Ring Oscillator for TRNG. 
	taps are located at bits 31,27,23,21,20,17,16,15,13,10,9,8,6,5,4,3,and 1 for maximal LFSR length
*/

module GARO (input stop,clk, reset_n, 
			 output random);

(* OPTIMIZE="OFF" *)                    //stop *xilinx* tools optimizing this away
wire [31:1] stage /* synthesis keep */; //stop *altera* tools optimizing this away
reg meta1, meta2;
reg [2:0] bitCount;

//assign random = meta2;

always@(posedge clk or negedge reset_n)
if(!reset_n)
  begin
    meta1 <= 1'b0;
    meta2 <= 1'b0;
	bitCount <= 0;
	//stage <= (1 << 31) | 1;
  end
else if(clk)
  begin
	if (!stop) begin
		if (bitCount < 7)
		begin
			random <= (bitCount % 2 == 0); //Modeled data 
			bitCount <= bitCount + 1;
		end
		
		else
		begin
			random <= 0;
			bitCount <= 0;
		end
	end
    //meta1 <= stage[1];
    //meta2 <= meta1;
  end

// assign stage[1] = ~&{stage[2] ^ stage[1],stop};
// assign stage[2] = !stage[3];
// assign stage[3] = !stage[4] ^ stage[1];
// assign stage[4] = !stage[5] ^ stage[1];
// assign stage[5] = !stage[6] ^ stage[1];
// assign stage[6] = !stage[7] ^ stage[1];
// assign stage[7] = !stage[8];
// assign stage[8] = !stage[9] ^ stage[1];
// assign stage[9] = !stage[10] ^ stage[1];
// assign stage[10] = !stage[11];
// assign stage[11] = !stage[12];
// assign stage[12] = !stage[13] ^ stage[1];
// assign stage[13] = !stage[14];
// assign stage[14] = !stage[15] ^ stage[1];
// assign stage[15] = !stage[16] ^ stage[1];
// assign stage[16] = !stage[17] ^ stage[1];
// assign stage[17] = !stage[18];
// assign stage[18] = !stage[19];
// assign stage[19] = !stage[20] ^ stage[1];
// assign stage[20] = !stage[21] ^ stage[1];
// assign stage[21] = !stage[22];
// assign stage[22] = !stage[23]; //^ stage[1];
// assign stage[23] = !stage[24];
// assign stage[24] = !stage[25];
// assign stage[25] = !stage[26];
// assign stage[26] = !stage[27] ^ stage[1];
// assign stage[27] = !stage[28];
// assign stage[28] = !stage[29];
// assign stage[29] = !stage[30];
// assign stage[30] = !stage[31];
// assign stage[31] = !stage[1];

endmodule