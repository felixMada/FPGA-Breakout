`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:16:02 08/13/2014 
// Design Name: 
// Module Name:    brickCollision 
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
module brickCollision(
		input clk,
		input update,
		input[9:0] ballXPos,
		input[9:0] ballYPos,
		output[29:0] visibleBricks,
		output reg changeDir
	);
	
	reg[29:0] visibleBricksReg;
	initial visibleBricksReg = 30'b111111111111111111111111111111;
	assign visibleBricks = visibleBricksReg;
	always @(posedge clk) begin 
		if(update) begin 
			if((ballYPos>=20)&&(ballYPos<40)) begin 
				if(visibleBricksReg[0]) begin 
					if((ballXPos>=20)&&(ballXPos<=120)) begin 
						changeDir <= 1;
						visibleBricksReg[0] <= 0;
					end
				end
				if(visibleBricksReg[1]) begin 
					if((ballXPos>=120)&&(ballXPos<=220)) begin 
						changeDir <= 1;
						visibleBricksReg[1] <= 0;
					end
				end
				if(visibleBricksReg[2]) begin 
					if((ballXPos>=220)&&(ballXPos<=320)) begin 
						changeDir <= 1;
						visibleBricksReg[2] <= 0;
					end
				end
				if(visibleBricksReg[3]) begin 
					if((ballXPos>=320)&&(ballXPos<=420)) begin 
						changeDir <= 1;
						visibleBricksReg[3] <= 0;
					end
				end
				if(visibleBricksReg[4]) begin 
					if((ballXPos>=420)&&(ballXPos<=520)) begin 
						changeDir <= 1;
						visibleBricksReg[4] <= 0;
					end
				end
				if(visibleBricksReg[5]) begin 
					if((ballXPos>=520)&&(ballXPos<=620)) begin 
						changeDir <= 1;
						visibleBricksReg[5] <= 0;
					end
				end				
			end
			if((ballYPos>=40)&&(ballYPos<60)) begin 
				if(visibleBricksReg[6]) begin 
					if((ballXPos>=20)&&(ballXPos<=120)) begin 
						changeDir <= 1;
						visibleBricksReg[6] <= 0;
					end
				end
				if(visibleBricksReg[7]) begin 
					if((ballXPos>=120)&&(ballXPos<=220)) begin 
						changeDir <= 1;
						visibleBricksReg[7] <= 0;
					end
				end
				if(visibleBricksReg[8]) begin 
					if((ballXPos>=220)&&(ballXPos<=320)) begin 
						changeDir <= 1;
						visibleBricksReg[8] <= 0;
					end
				end
				if(visibleBricksReg[9]) begin 
					if((ballXPos>=320)&&(ballXPos<=420)) begin 
						changeDir <= 1;
						visibleBricksReg[9] <= 0;
					end
				end
				if(visibleBricksReg[10]) begin 
					if((ballXPos>=420)&&(ballXPos<=520)) begin 
						changeDir <= 1;
						visibleBricksReg[10] <= 0;
					end
				end
				if(visibleBricksReg[11]) begin 
					if((ballXPos>=520)&&(ballXPos<=620)) begin 
						changeDir <= 1;
						visibleBricksReg[11] <= 0;
					end
				end				
			end
			if((ballYPos>=60)&&(ballYPos<80)) begin 
				if(visibleBricksReg[12]) begin 
					if((ballXPos>=20)&&(ballXPos<=120)) begin 
						changeDir <= 1;
						visibleBricksReg[12] <= 0;
					end
				end
				if(visibleBricksReg[13]) begin 
					if((ballXPos>=120)&&(ballXPos<=220)) begin 
						changeDir <= 1;
						visibleBricksReg[13] <= 0;
					end
				end
				if(visibleBricksReg[14]) begin 
					if((ballXPos>=220)&&(ballXPos<=320)) begin 
						changeDir <= 1;
						visibleBricksReg[14] <= 0;
					end
				end
				if(visibleBricksReg[15]) begin 
					if((ballXPos>=320)&&(ballXPos<=420)) begin 
						changeDir <= 1;
						visibleBricksReg[15] <= 0;
					end
				end
				if(visibleBricksReg[16]) begin 
					if((ballXPos>=420)&&(ballXPos<=520)) begin 
						changeDir <= 1;
						visibleBricksReg[16] <= 0;
					end
				end
				if(visibleBricksReg[17]) begin 
					if((ballXPos>=520)&&(ballXPos<=620)) begin 
						changeDir <= 1;
						visibleBricksReg[17] <= 0;
					end
				end				
			end
			if((ballYPos>=80)&&(ballYPos<100)) begin 
				if(visibleBricksReg[18]) begin 
					if((ballXPos>=20)&&(ballXPos<=120)) begin 
						changeDir <= 1;
						visibleBricksReg[18] <= 0;
					end
				end
				if(visibleBricksReg[19]) begin 
					if((ballXPos>=120)&&(ballXPos<=220)) begin 
						changeDir <= 1;
						visibleBricksReg[19] <= 0;
					end
				end
				if(visibleBricksReg[20]) begin 
					if((ballXPos>=220)&&(ballXPos<=320)) begin 
						changeDir <= 1;
						visibleBricksReg[20] <= 0;
					end
				end
				if(visibleBricksReg[21]) begin 
					if((ballXPos>=320)&&(ballXPos<=420)) begin 
						changeDir <= 1;
						visibleBricksReg[21] <= 0;
					end
				end
				if(visibleBricksReg[22]) begin 
					if((ballXPos>=420)&&(ballXPos<=520)) begin 
						changeDir <= 1;
						visibleBricksReg[22] <= 0;
					end
				end
				if(visibleBricksReg[23]) begin 
					if((ballXPos>=520)&&(ballXPos<=620)) begin 
						changeDir <= 1;
						visibleBricksReg[23] <= 0;
					end
				end				
			end
			if((ballYPos>=100)&&(ballYPos<120)) begin 
				if(visibleBricksReg[24]) begin 
					if((ballXPos>=20)&&(ballXPos<=120)) begin 
						changeDir <= 1;
						visibleBricksReg[24] <= 0;
					end
				end
				if(visibleBricksReg[25]) begin 
					if((ballXPos>=120)&&(ballXPos<=220)) begin 
						changeDir <= 1;
						visibleBricksReg[25] <= 0;
					end
				end
				if(visibleBricksReg[26]) begin 
					if((ballXPos>=220)&&(ballXPos<=320)) begin 
						changeDir <= 1;
						visibleBricksReg[26] <= 0;
					end
				end
				if(visibleBricksReg[27]) begin 
					if((ballXPos>=320)&&(ballXPos<=420)) begin 
						changeDir <= 1;
						visibleBricksReg[27] <= 0;
					end
				end
				if(visibleBricksReg[28]) begin 
					if((ballXPos>=420)&&(ballXPos<=520)) begin 
						changeDir <= 1;
						visibleBricksReg[28] <= 0;
					end
				end
				if(visibleBricksReg[29]) begin 
					if((ballXPos>=520)&&(ballXPos<=620)) begin 
						changeDir <= 1;
						visibleBricksReg[29] <= 0;
					end
				end				
			end
		end else begin 
			changeDir <= 0;
		end
	end

endmodule
