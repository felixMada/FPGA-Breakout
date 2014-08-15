`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:06 08/13/2014 
// Design Name: 
// Module Name:    ballClkDiv 
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
module ballClkDiv(
			input clk,
			output posUpdate,
			output dirUpdate,
			output brckUpdate
    );
	reg[19:0] counter=0;
	always @(posedge clk) begin
		counter <= counter + 1;
	end
	assign brckUpdate = (counter == 0);
	assign dirUpdate = (counter == 1);
	assign posUpdate = (counter == 2);
	
endmodule
