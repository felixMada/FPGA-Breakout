`timescale 1ns / 1ps

module clkDiv(input clk, output outClk);
	reg[4:0] counter;
	always @(posedge clk) begin
		counter <= counter + 1;
	end
	assign outClk = counter[1];
endmodule
