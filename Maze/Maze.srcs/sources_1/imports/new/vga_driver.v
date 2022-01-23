`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/18/2020 01:43:30 PM
// Design Name:
// Module Name: vga_driver
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

// VGA 640*480 @ 60Hz
`define H_SYNC     11'd96
`define H_FRONT     11'd48
`define H_DISPLAY  11'd640
`define H_BACK    11'd16
`define H_TOTAL    11'd800

`define V_SYNC     11'd2
`define V_FRONT     11'd33
`define V_DISPLAY  11'd480
`define V_BACK    11'd10
`define V_TOTAL    11'd525

module vga_driver(
           input clk_vga, // 25Mhz
           input rst_n,   // reset
           input [ 11: 0 ] vgaData,
           output vga_en, 
           output reg HSync,
           output reg VSync,
           output [ 3: 0 ] vgaRed,
           output [ 3: 0 ] vgaGreen,
           output [ 3: 0 ] vgaBlue,
           output [ 10: 0 ] vgaH,
           output [ 10: 0 ] vgaV
       );
reg [ 10: 0 ] hCnt;

// 行扫描计数器
always @( posedge clk_vga or negedge rst_n ) begin
    if ( !rst_n ) begin
        hCnt <= 11'b0;
    end
    else begin
        if ( hCnt < `H_TOTAL - 1'b1 ) begin
            hCnt <= hCnt + 1;
        end
        else begin
            hCnt <= 11'b0;
        end
    end
end


reg [ 10: 0 ] vCnt;

// 场扫描计数器
always @( posedge clk_vga or negedge rst_n ) begin
    if ( !rst_n ) 
        vCnt <= 11'b0;
    else if(vCnt == `V_TOTAL - 1'b1) 
        vCnt <= 11'b0;
    else if ( hCnt == `H_TOTAL - 1'b1 )
        vCnt <= vCnt + 1;
end

// 行同步输出
always @( posedge clk_vga or negedge rst_n ) begin
    if (!rst_n)
        HSync <= 1'b1;
    else if (hCnt < `H_SYNC)
        HSync <= 1'b0;
    else
        HSync <= 1'b1;
end

// 场同步输出
always @( posedge clk_vga or negedge rst_n ) begin
		if (!rst_n)
			VSync <= 1'b1;
		else if (vCnt < `V_SYNC)
			VSync <= 1'b0;
		else
			VSync <= 1'b1;
end

assign vga_en = (hCnt >=`H_FRONT + `H_SYNC && hCnt < `H_DISPLAY + `H_FRONT + `H_SYNC ) && 
                (vCnt >=`V_FRONT + `V_SYNC && vCnt < `V_DISPLAY + `V_FRONT + `V_SYNC ) ? 1'b1 : 1'b0;


assign vgaRed[ 3 ] = vga_en ? vgaData[ 3 ] : 1'b0;
assign vgaRed[ 2 ] = vga_en ? vgaData[ 2 ] : 1'b0;
assign vgaRed[ 1 ] = vga_en ? vgaData[ 1 ] : 1'b0;
assign vgaRed[ 0 ] = vga_en ? vgaData[ 0 ] : 1'b0;

assign vgaGreen[ 3 ] = vga_en ? vgaData[ 7 ] : 1'b0;
assign vgaGreen[ 2 ] = vga_en ? vgaData[ 6 ] : 1'b0;
assign vgaGreen[ 1 ] = vga_en ? vgaData[ 5 ] : 1'b0;
assign vgaGreen[ 0 ] = vga_en ? vgaData[ 4 ] : 1'b0;

assign vgaBlue[ 3 ] = vga_en ? vgaData[ 11 ] : 1'b0;
assign vgaBlue[ 2 ] = vga_en ? vgaData[ 10 ] : 1'b0;
assign vgaBlue[ 1 ] = vga_en ? vgaData[ 9 ] : 1'b0;
assign vgaBlue[ 0 ] = vga_en ? vgaData[ 8 ] : 1'b0;

/*
    assign vgaRed = (vgaX > 0) ? 4'b0000 : 4'b0000;
    assign vgaGreen = (vgaX > 0) ? 4'b0000 : 4'b0000;
    assign vgaBlue = (vgaX > 0) ? 4'b1111 : 4'b0000;
*/

assign vgaH = (hCnt >=`H_FRONT + `H_SYNC && hCnt < `H_DISPLAY + `H_FRONT + `H_SYNC ) ? hCnt - (`H_FRONT + `H_SYNC) : 1'b0;
assign vgaV = (vCnt >=`V_FRONT + `V_SYNC && vCnt < `V_DISPLAY + `V_FRONT + `V_SYNC ) ? vCnt - (`V_FRONT + `V_SYNC) : 1'b0;

endmodule
