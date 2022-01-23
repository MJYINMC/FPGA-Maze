`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2020 12:11:49 PM
// Design Name: 
// Module Name: clk_352800Hz
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_352800Hz(
	input clk,
    input rst_n,
	output reg clk_352800Hz
    );
	reg[31:0] cnt;
	
	always @ (posedge clk) begin
        if(!rst_n)
            cnt <= 0;
        else begin
            if (cnt < 140) begin
                cnt <= cnt + 1;
            end 
            else begin
                cnt <= 0;
                clk_352800Hz <= ~clk_352800Hz;
            end            
        end
	end
endmodule
