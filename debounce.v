`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:02:02 08/13/2014 
// Design Name: 
// Module Name:    debounce 
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
module debounce(
			input clk,
			output out,
			input in
		);
 
	parameter limitDeb = 30'd650000;
	parameter limitDown = 30'd650001;
	parameter limitUp = 30'd5700000;
 
	reg [29:0] counter;
	reg hit;
 
	assign out = hit;
 
	always@(posedge clk) begin
		if(!in) begin
			counter <= 0;
			hit <= 0;        
		end else if(counter == limitDeb) begin
			hit <= 1;
			counter <= counter + 1;
		end else if(counter == limitDown) begin 
			hit <= 0;
			counter <= counter + 1;
		end else if(counter == limitUp) begin 
			hit <= 1;
			counter <= limitDeb;
		end else if(in) begin
			counter <= counter + 1;
		end
	end
endmodule
