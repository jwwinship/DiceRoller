`timescale 1ns/1ps

module TB_ENCODER;


reg [3:0] correct;
reg clk;



reg button1;
reg button2;
reg button3;
reg button4;
reg button5;
reg button6;
reg button7;
wire [3:0] result;


encoder u_encooder(

.buttonD4(button1), .buttonD6(button2), .buttonD8(button3), .buttonD10(button4), .buttonD12(button5), .buttonD20(button6), .switchTest(button7),

.dieSelect(result)

);



initial begin
  clk = 0;
  forever #10 clk = ~clk;
 end

initial begin

correct = 0;
	
//D4
button1 = 1;
button2 = 0;
button3 = 0;
button4 = 0;
button5 = 0;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected 0000, Actual: %b", result);


#10;

//D6
button1 = 0;
button2 = 1;
button3 = 0;
button4 = 0;
button5 = 0;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected b0001, Actual: %b", result);

#10;

//D8
button1 = 0;
button2 = 0;
button3 = 1;
button4 = 0;
button5 = 0;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected b0010, Actual: %b", result);

#10;

//D10
button1 = 0;
button2 = 0;
button3 = 0;
button4 = 1;
button5 = 0;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected b0011, Actual: %b", result);

#10;


//D12
button1 = 0;
button2 = 0;
button3 = 0;
button4 = 0;
button5 = 1;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected b0100, Actual: %b", result);

#10;

//D20
button1 = 0;
button2 = 0;
button3 = 0;
button4 = 0;
button5 = 0;
button6 = 1;
button7 = 0;
@(posedge clk)
$display("Expected b0101, Actual: %b", result);

#10;



//TEST
button1 = 0;
button2 = 0;
button3 = 0;
button4 = 0;
button5 = 0;
button6 = 0;
button7 = 1;
@(posedge clk)
$display("Expected b0111, Actual: %b", result);

#10;

//Nothing
button1 = 0;
button2 = 0;
button3 = 0;
button4 = 0;
button5 = 0;
button6 = 0;
button7 = 0;
@(posedge clk)
$display("Expected b1111, Actual: %b", result);

#10;

//Multiple
button1 = 0;
button2 = 1;
button3 = 0;
button4 = 1;
button5 = 0;
button6 = 1;
button7 = 0;
@(posedge clk)
$display("Expected b1111, Actual: %b", result);

#10;







$finish;	
end



endmodule