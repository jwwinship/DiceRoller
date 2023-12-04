module encoder(

input buttonD4, buttonD6, buttonD8, buttonD10, buttonD12, buttonD20, switchTest,

output dieSelect

);



reg [6:0] comboButton;
reg [2:0] dieSelect;

assign combobutton = {buttonD4 + buttonD8 + buttonD10 + buttonD12 + buttonD20 + switchTest};




always @ (comboButton) begin

	case (combobutton) begin


	7'b1000000: dieSelect = 3'b000;
	7'b0100000: dieSelect = 3'b001;
	7'b0010000: dieSelect = 3'b010;
	7'b0001000: dieSelect = 3'b011;
	7'b0000100: dieSelect = 3'b100;
	7'b0000010: dieSelect = 3'b101;
	7'b0000001: dieSelect = 3'b111;
	default: dieSelect = 3'b111;

	endcase

	end

end