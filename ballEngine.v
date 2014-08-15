`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:00 08/13/2014 
// Design Name: 
// Module Name:    ballEngine 
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
`define DIRECTION_NE 2'b10
`define DIRECTION_SE 2'b00
`define DIRECTION_SV 2'b01
`define DIRECTION_NV 2'b11

module ballEngine(
		input clk,
		input ballPosUpdate,
		input[9:0] xIndex,
		input[9:0] yIndex,
		input displayEnable,
		output reg[7:0] color,
		output reg shouldDisplay,
		output wire[9:0] xPos,
		output wire[9:0] yPos,
		input [1:0] direction
	);
	
	
	parameter startXCoord = 300;
	parameter startYCoord = 300;
	parameter ballSize = 16*2;
	parameter ballColor = 8'b11111111;
	
	reg[9:0] xPosition = startXCoord;
	reg[9:0] yPosition = startYCoord;

	wire[5:0] dX;
	wire[5:0] dY;
	
	assign dX = (xIndex - xPosition)/2;
	assign dY = (yIndex - yPosition)/2;
	
	assign xPos = xPosition;
	assign yPos = yPosition;
	
	always @(posedge clk) begin 
		if(ballPosUpdate) begin 
			xPosition <= xPosition + 3 - direction[0]*6;
			yPosition <= yPosition + 3 - direction[1]*6;
		end
	end
	
	
	reg[15:0] temp;
	always @(dX, dY) begin 
		case(dY) 
			0: temp = 16'b00000111100000;
			1: temp = 16'b00011111111000;
			2: temp = 16'b00111111111100;
			3: temp = 16'b01111111111110;
			4: temp = 16'b01111111111110;
			5: temp = 16'b11111111111111;
			6: temp = 16'b11111111111111;
			7: temp = 16'b11111111111111;
			8: temp = 16'b11111111111111;
			9: temp = 16'b11111111111111; 
		  10: temp = 16'b11111111111111;
		  11: temp = 16'b11111111111111;
		  12: temp = 16'b01111111111110;
		  13: temp = 16'b01111111111110;
		  14: temp = 16'b00111111111100;
		  15: temp = 16'b00011111111000;
		  16: temp = 16'b00000111100000;
   default: temp = 0;
		endcase
			color = temp[dX] ? ballColor : 8'b00000000;
	end
	
	always @(*) begin  
		if(displayEnable) begin
			if((xIndex>=xPosition)&&(xIndex<xPosition+ballSize)&&(yIndex>=yPosition)&&(yIndex<=yPosition+ballSize+1)) begin 
				shouldDisplay = temp[dX];
			end else begin 
				shouldDisplay = 0;
			end
		end else begin 
			shouldDisplay = 0;
		end
	end

endmodule
