`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:15 08/13/2014 
// Design Name: 
// Module Name:    ballCollisionEngine 
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
/*`define DIRECTION_NE 4'b1001
`define DIRECTION_SE 4'b0101
`define DIRECTION_SV 4'b1001
`define DIRECTION_NV 4'b1010*/
`define DIRECTION_NE 2'b10
`define DIRECTION_SE 2'b00
`define DIRECTION_SV 2'b01
`define DIRECTION_NV 2'b11
module ballCollisionEngine(
	input clk,
	input ballDirUpdate,
	input[9:0] ballXPos,
	input[9:0] ballYPos,
	input[9:0] paddleXPos,
	input forceChangeBallDirection,
	output [1:0] directionOut,
	output lock
    );
	parameter ballSize = 16*2;
	reg[1:0] directionReg = `DIRECTION_NE;
	reg directionLockReg = 0;
	assign directionOut = directionReg;
	assign lock = directionLockReg;
	always @(posedge clk) begin
		if(ballDirUpdate) begin 
			if((ballYPos<= 3)||
					((ballYPos+ballSize>=440)&&
					(((ballXPos>paddleXPos)&&(ballXPos<paddleXPos+100))||
					((ballXPos+ballSize>paddleXPos)&&(ballXPos+ballSize<paddleXPos+100))))||
				(forceChangeBallDirection)) begin
				directionReg[1] <= ~directionReg[1];
			end
			if((ballXPos <= 3)||(ballXPos>=600)) begin  // leftBorder
				directionReg[0] <= ~directionReg[0];
			end
			if(ballYPos>=600) begin 
				directionReg[1] <= ~directionReg[1];
				directionLockReg <= 1;
			end
		end
	end
	
endmodule
