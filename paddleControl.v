`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:00 08/13/2014 
// Design Name: 
// Module Name:    paddleControl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module paddleControl(
				input clk,
				input rightSwitch,
				input leftSwitch,
				output leftOut,
				output rightOut
			);
	
	debounce  debLeft(.clk(clk),  .in(leftSwitch), .out(leftOut));
	debounce debRight(.clk(clk), .in(rightSwitch), .out(rightOut));
endmodule
