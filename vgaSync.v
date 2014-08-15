`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:47 08/11/2014 
// Design Name: 
// Module Name:    vgaSync 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:  aebaeba
//
//////////////////////////////////////////////////////////////////////////////////
module vgaSync(
	input clk,
	output wire hSync,
	output wire vSync,
	output[9:0] xIndex,
	output[9:0] yIndex,
	output reg displayEnable
    );

	parameter hPixels = 800;// horizontal pixels per line
	parameter vLines = 521; // vertical lines per frame
	parameter hPulseLength = 96; 	// hsync pulse length
	parameter vPulseLength = 2; 	// vsync pulse length
	parameter hBackPorch = 144; 	// end of horizontal back porch
	parameter hFrontPorch = 784; 	// beginning of horizontal front porch
	parameter vBackPorch = 31; 		// end of vertical back porch
	parameter vFrontPorch = 511; 


	wire vgaClk;
	clkDiv vgaClkDivision(.clk(clk), .outClk(vgaClk));

	reg [9:0] hCounter;
	reg [9:0] vCounter;

	always @(posedge vgaClk) begin
		if (hCounter < hPixels - 1)
			hCounter <= hCounter + 1;
		else begin
			hCounter <= 0;
			if (vCounter < vLines - 1)
				vCounter <= vCounter + 1;
			else
				vCounter <= 0;
		end
	end


	assign hSync = (hCounter < hPulseLength) ? 0:1;
	assign vSync = (vCounter < vPulseLength) ? 0:1;
	assign xIndex = hCounter - hBackPorch;
	assign yIndex = vCounter - vBackPorch;
	
	always @(*) begin
		if (vCounter >= vBackPorch && vCounter < vFrontPorch && hCounter >= hBackPorch && hCounter < hFrontPorch)	begin
				displayEnable = 1;
		end else begin
			displayEnable = 0;
		end
	end
endmodule
