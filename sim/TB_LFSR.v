`timescale 1ns / 1ps

module TB_LFSR;

  reg clk;
  reg reset_n;
  wire output_wire;

  lfsr unit_lfsr(
    .clk(clk),    
    .reset_n(reset_n),
    .Q(output_wire)
  );

  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  initial begin
    reset_n = 0;
    #10
    reset_n = 1;
  end

endmodule
