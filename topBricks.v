`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:22:56 08/13/2014 
// Design Name: 
// Module Name:    topBricks 
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
module topBricks(
	input clk,
	output wire[7:0] color,
	output wire hSync,
	output wire vSync,
	input leftBtn,
	input rightBtn
	);
	
	wire[9:0] xCoord;
	wire[9:0] yCoord;
	wire shouldDisplay;
	wire[7:0] displayColor;
	vgaSync vgaSyncModule(
						.clk(clk),
						.hSync(hSync),
						.vSync(vSync),
						.xIndex(xCoord),
						.yIndex(yCoord),
						.displayEnable(shouldDisplay)
					);
					
	colorMux colorEngine(
						.clk(clk),
						.xIndex(xCoord),
						.yIndex(yCoord),
						.displayEnable(shouldDisplay),
						.color(displayColor),
						.leftBtn(leftBtn),
						.rightBtn(rightBtn)
					);
	assign color = displayColor;
endmodule
