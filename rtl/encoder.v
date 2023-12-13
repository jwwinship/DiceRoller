`timescale 1ns/1ps
module encoder(
    input buttonD4, buttonD6, buttonD8, buttonD10, buttonD12, buttonD20, switchTest,
    output reg [3:0] dieSelect
);

reg [6:0] comboButton;
reg [3:0] r_dieSelect;

always @ (*) begin
    comboButton = {buttonD4, buttonD6, buttonD8, buttonD10, buttonD12, buttonD20, switchTest};
    case (comboButton)
        7'b1000000: r_dieSelect = 4'b0000; //D4
        7'b0100000: r_dieSelect = 4'b0001; //D6
        7'b0010000: r_dieSelect = 4'b0010; //D8
        7'b0001000: r_dieSelect = 4'b0011; //D10
        7'b0000100: r_dieSelect = 4'b0100; //D12
        7'b0000010: r_dieSelect = 4'b0101; //D20
        7'b0000001: r_dieSelect = 4'b0111; //Test
        default: r_dieSelect = 4'b1111; //nothing
    endcase
    dieSelect <= r_dieSelect;
end

endmodule
