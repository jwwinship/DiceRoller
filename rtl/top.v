`timescale 1 ps / 1 ps
module top(
        //Reset and Clocks
        input CLOCK_50,    //2.5v
        input CPU_RESETn,  //3.3-v LVCMOS
        input [3:0] KEY,   //1.5v; the pushbuttons
        input [9:0] SW,    //For the switch	
		  
        output [9:0] LEDR, //1.5v
        output [6:0] HEX0,HEX1,HEX2,HEX3,HEX4,HEX5  //For the 7seg displays
); 

//Instantiate Qsys based Nios system
//Software LED assignment

architectureV1 u0 (
.clk_clk (CLOCK_50), //clk.clk
.led_external_connection_export    (LEDR[9:0]),  //led_external_connection.export
.reset_reset_n                     (CPU_RESETn), //reset.reset_n
.button_external_connection_export (KEY[3:0]),   //button_external_connection.export
.switch_external_connection_export (SW[9:0]),    //switch_external_connection.export
.hex0_external_connection_export   (HEX0),       //hex0_external_connection.export
.hex1_external_connection_export   (HEX1),       //hex1_external_connection.export
.hex2_external_connection_export   (HEX2),       //hex2_external_connection.export
.hex3_external_connection_export   (HEX3),       //hex3_external_connection.export
.hex4_external_connection_export   (HEX4),       //hex4_external_connection.export
.hex5_external_connection_export   (HEX5)        //hex5_external_connection.export
);
endmodule