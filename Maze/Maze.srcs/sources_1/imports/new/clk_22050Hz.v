`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2020 10:02:46 AM
// Design Name: 
// Module Name: clk_22050Hz
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


module clk_22050Hz(
	input clk,
    input rst_n,
	output reg clk_22050Hz
    );
	reg[31:0] cnt;
	
	always @ (posedge clk) begin
        if(!rst_n)
            cnt <= 0;
        else begin
            if (cnt < 2267) begin
                cnt <= cnt + 1;
            end 
            else begin
                cnt <= 0;
                clk_22050Hz <= ~clk_22050Hz;
            end            
        end
	end
endmodule

