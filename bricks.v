`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:43 08/13/2014 
// Design Name: 
// Module Name:    bricks 
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
module bricks(
		input[9:0] xIndex,
		input[9:0] yIndex,
		input displayEnable,
		input [29:0] bricksDisplay,
		output reg[7:0] color,
		output reg shouldDisplay
    );
	// red 6:0
	// orange 12:7
	// yellow 18:13
	// green 24:19
	// blue 30:25
	parameter startXCoord = 20;
	parameter startYCoord = 20;
	parameter endXCoord = 620;
	parameter brickYSize = 20;
	parameter brickXSize = 100;
	parameter redColor = 8'b11000000;
	parameter orangeColor = 8'b11001100;
	parameter yellowColor = 8'b11011000;
	parameter greenColor = 8'b00011000;
	parameter blueColor = 8'b00000011;
	parameter blackColor = 8'b00000000;
	
	
	
	always @(*) begin  
		if((displayEnable)&&(xIndex>=startXCoord)&&(xIndex<startXCoord+brickXSize*6)) begin
			if((yIndex>=startYCoord)&&(yIndex<=startYCoord+brickYSize)) begin 
				if(xIndex<startXCoord+brickXSize) begin
					color = bricksDisplay[0] ? redColor : blackColor;
				end else if(xIndex<startXCoord+2*brickXSize) begin 
					color = bricksDisplay[1] ? redColor : blackColor;
				end else if(xIndex<startXCoord+3*brickXSize) begin 
					color = bricksDisplay[2] ? redColor : blackColor;
				end else if(xIndex<startXCoord+4*brickXSize) begin 
					color = bricksDisplay[3] ? redColor : blackColor;
				end else if(xIndex<startXCoord+5*brickXSize) begin 
					color = bricksDisplay[4] ? redColor : blackColor;
				end else if(xIndex<startXCoord+6*brickXSize) begin 
					color = bricksDisplay[5] ? redColor : blackColor;
				end else begin
					color = 8'b00000000;
				end
				shouldDisplay = 1;
			end else if((yIndex>=startYCoord+brickYSize)&&(yIndex<startYCoord+brickYSize*2)) begin 
				if(xIndex<startXCoord+brickXSize) begin
					color = bricksDisplay[6] ? orangeColor : blackColor;
				end else if(xIndex<startXCoord+2*brickXSize) begin 
					color = bricksDisplay[7] ? orangeColor : blackColor;
				end else if(xIndex<startXCoord+3*brickXSize) begin 
					color = bricksDisplay[8] ? orangeColor : blackColor;
				end else if(xIndex<startXCoord+4*brickXSize) begin 
					color = bricksDisplay[9] ? orangeColor : blackColor;
				end else if(xIndex<startXCoord+5*brickXSize) begin 
					color = bricksDisplay[10] ? orangeColor : blackColor;
				end else if(xIndex<startXCoord+6*brickXSize) begin 
					color = bricksDisplay[11] ? orangeColor : blackColor;
				end else begin
					color = 8'b00000000;
				end
				shouldDisplay = 1;
			end else if((yIndex>=startYCoord+brickYSize*2)&&(yIndex<startYCoord+brickYSize*3)) begin 
				if(xIndex<startXCoord+brickXSize) begin
					color = bricksDisplay[12] ? yellowColor : blackColor;
				end else if(xIndex<startXCoord+2*brickXSize) begin 
					color = bricksDisplay[13] ? yellowColor : blackColor;
				end else if(xIndex<startXCoord+3*brickXSize) begin 
					color = bricksDisplay[14] ? yellowColor : blackColor;
				end else if(xIndex<startXCoord+4*brickXSize) begin 
					color = bricksDisplay[15] ? yellowColor : blackColor;
				end else if(xIndex<startXCoord+5*brickXSize) begin 
					color = bricksDisplay[16] ? yellowColor : blackColor;
				end else if(xIndex<startXCoord+6*brickXSize) begin 
					color = bricksDisplay[17] ? yellowColor : blackColor;
				end else begin
					color = 8'b00000000;
				end
				shouldDisplay = 1;
			end else if((yIndex>=startYCoord+brickYSize*3)&&(yIndex<startYCoord+brickYSize*4)) begin 
				if(xIndex<startXCoord+brickXSize) begin
					color = bricksDisplay[18] ? greenColor : blackColor;
				end else if(xIndex<startXCoord+2*brickXSize) begin 
					color = bricksDisplay[19] ? greenColor : blackColor;
				end else if(xIndex<startXCoord+3*brickXSize) begin 
					color = bricksDisplay[20] ? greenColor : blackColor;
				end else if(xIndex<startXCoord+4*brickXSize) begin 
					color = bricksDisplay[21] ? greenColor : blackColor;
				end else if(xIndex<startXCoord+5*brickXSize) begin 
					color = bricksDisplay[22] ? greenColor : blackColor;
				end else if(xIndex<startXCoord+6*brickXSize) begin 
					color = bricksDisplay[23] ? greenColor : blackColor;
				end else begin
					color = 8'b00000000;
				end
				shouldDisplay = 1;
			end else if((yIndex>=startYCoord+brickYSize*4)&&(yIndex<startYCoord+brickYSize*5)) begin 
				if(xIndex<startXCoord+brickXSize) begin
					color = bricksDisplay[24] ? blueColor : blackColor;
				end else if(xIndex<startXCoord+2*brickXSize) begin 
					color = bricksDisplay[25] ? blueColor : blackColor;
				end else if(xIndex<startXCoord+3*brickXSize) begin 
					color = bricksDisplay[26] ? blueColor : blackColor;
				end else if(xIndex<startXCoord+4*brickXSize) begin 
					color = bricksDisplay[27] ? blueColor : blackColor;
				end else if(xIndex<startXCoord+5*brickXSize) begin 
					color = bricksDisplay[28] ? blueColor : blackColor;
				end else if(xIndex<startXCoord+6*brickXSize) begin 
					color = bricksDisplay[29] ? blueColor : blackColor;
				end else begin
					color = 8'b00000000;
				end
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
