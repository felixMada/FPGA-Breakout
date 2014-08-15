`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:28:19 08/13/2014 
// Design Name: 
// Module Name:    colorMux 
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
module colorMux(
		input clk,
		input[9:0] xIndex,
		input[9:0] yIndex,
		input displayEnable,
		output reg[7:0] color,
		input leftBtn,
		input rightBtn
    );
	
	wire[7:0] bricksOutColor;
	wire bricksShouldDisplay;
	
	wire[7:0] paddleOutColor;
	wire paddleShouldDisplay;
	wire moveLeft;
	wire moveRight;
	
	wire[7:0] ballOutColor;
	wire ballShouldDisplay;
	wire[1:0] ballDirection;
	wire[9:0] paddleXPos;
	wire[9:0] ballYPos;
	wire[9:0] ballXPos;
	
	wire ballDirUpdate;
	wire ballPosUpdate;
	wire brickUpdate;
	wire forceChangeBallDirection;
	wire[29:0] bricksDisplay;
	
	wire gameOverSig;
	wire gameOverFinal;
	wire gameOverOutColor;
	ballClkDiv ballClk(.clk(clk), .dirUpdate(ballDirUpdate), .posUpdate(ballPosUpdate), .brckUpdate(brickUpdate));
	
	paddleControl paddleControler(
				.clk(clk),
				.leftSwitch(leftBtn),
				.rightSwitch(rightBtn),
				.leftOut(moveLeft),
				.rightOut(moveRight)
			);
			
	bricks brickEngine(
				.xIndex(xIndex),
				.yIndex(yIndex),
				.displayEnable(displayEnable),
				.color(bricksOutColor),
				.bricksDisplay(bricksDisplay),
				.shouldDisplay(bricksShouldDisplay)
			);

	paddle paddleEngine(
				.xIndex(xIndex),
				.yIndex(yIndex),
				.displayEnable(displayEnable),
				.color(paddleOutColor),
				.shouldDisplay(paddleShouldDisplay),
				.moveLeft(moveLeft),
				.moveRight(moveRight),
				.clk(clk),
				.xPos(paddleXPos)
			);
			
	ballEngine ballEnginer(
				.clk(clk),
				.ballPosUpdate(ballPosUpdate),
				.xIndex(xIndex),
				.yIndex(yIndex),
				.displayEnable(displayEnable),
				.color(ballOutColor),
				.shouldDisplay(ballShouldDisplay),
				.xPos(ballXPos),
				.yPos(ballYPos),
				.direction(ballDirection)
			);
	
	ballCollisionEngine ballCollision(
				.clk(clk),
				.ballDirUpdate(ballDirUpdate),
				.ballXPos(ballXPos),
				.ballYPos(ballYPos),
				.paddleXPos(paddleXPos),
				.forceChangeBallDirection(forceChangeBallDirection),
				.directionOut(ballDirection)
			);
	brickCollision brickCollisionMod(
				.clk(clk),
				.update(brickUpdate),
				.ballXPos(ballXPos),
				.ballYPos(ballYPos),
				.visibleBricks(bricksDisplay),
				.changeDir(forceChangeBallDirection)
			);
	always @(bricksShouldDisplay, paddleShouldDisplay, displayEnable, paddleOutColor, bricksOutColor) begin 
		if(displayEnable) begin
			
				if(ballShouldDisplay) begin 
					color = ballOutColor;
				end else	if(paddleShouldDisplay) begin 
					color = paddleOutColor;
				end else if(bricksShouldDisplay) begin 
					color = bricksOutColor;
				end else begin 
					color = 8'b00000000;
				end
		end else begin 
			color = 8'b00000000;
		end
	end
endmodule
