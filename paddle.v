`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:39:24 08/13/2014 
// Design Name: 
// Module Name:    paddle 
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
module paddle(
		input clk,
		input[9:0] xIndex,
		input[9:0] yIndex,
		input displayEnable,
		output reg[7:0] color,
		output reg shouldDisplay,
		input moveLeft,
		input moveRight,
		output[9:0] xPos
		
    );
	parameter startYCoord = 440;
	parameter endYCoord = 460;
	parameter paddleSize = 100;
	parameter paddleColor = 8'b01101101;
	
	reg[9:0] position = 5;
	assign xPos = position;
	always @(posedge clk) begin 
			if(moveRight) begin 
				if(position<500) begin 
					position <= position + 7;
				end
			end else if(moveLeft) begin 
				if(position>4) begin 
					position <= position - 7;
				end
			end else begin
				// wuther fuck
			end
	end
	
	always @(xIndex, yIndex, displayEnable) begin 
		if(displayEnable) begin
			if((xIndex>=position)&&(xIndex<=paddleSize+position)&&(yIndex>=startYCoord)&&(yIndex<=endYCoord)) begin 
				color = paddleColor;
				shouldDisplay = 1;
			end else begin 
				color = 8'b00000000;
				shouldDisplay = 0;
			end
		end else begin 
			shouldDisplay = 0;
		end
	end
endmodule
