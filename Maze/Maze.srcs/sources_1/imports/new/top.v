`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2020 10:00:54 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input ps2k_clk,
    input ps2k_data,
    input [1:0] BTN_Y,
    input [2:0] SW,
    output BTN_X,
    output HSync,
    output VSync,
    output [ 3: 0 ] vgaRed,
    output [ 3: 0 ] vgaGreen,
    output [ 3: 0 ] vgaBlue,
	output seg_clk,
	output seg_clrn,
	output seg_sout,
	output SEG_PEN,
    output AUD_PWM,
    output AUD_SD
    );
    assign AUD_SD = 1'b1;
    assign BTN_X = 1'b0;
    assign HIGH = 1'b1;
    wire vga_en;
    
    wire clk_mem;
    wire clk_vga;
    wire [ 10: 0 ] vgaH;
    wire [ 10: 0 ] vgaV;
    wire [11:0] pixel;

	wire [ 31: 0 ] clkdiv;
    wire clk_1s;

    wire [7:0] key_status;
    wire status;
    wire clear;
    wire rst_n;

    wire sound;
    wire clk_audio;
    wire [15:0] audio_sample;
    wire [ 3: 0 ] ironManCounter;
    wire [ 3: 0 ] fireManCounter;

    clkdiv m1(.clk(clk),.rst_n(1'b1),.clkdiv(clkdiv));
    clk_16000Hz m3(.clk(clk),.rst_n(1'b1),.clk_16000Hz(clk_audio));
    pbdebounce m4(.clk_1ms(clkdiv[17]),.button(BTN_Y[0]),.pbreg(rst_n));
    pbdebounce m5(.clk_1ms(clkdiv[17]),.button(BTN_Y[1]),.pbreg(clear));

    assign clk_vga = clkdiv[1];
    assign clk_mem = clk;
    game_data m6(.clk_mem(clk_mem), .clkdiv(clkdiv),
                .clk_vga(clk_vga), .rst_n(rst_n), .clear(~clear), .vga_en(vga_en),
                .vgaH(vgaH), .vgaV(vgaV), .key_status(key_status),.speed(SW),
                .vgaData(pixel), .ironManCounter(ironManCounter), .fireManCounter(fireManCounter), .status(status));
    vga_driver m7(.clk_vga(clk_vga),.rst_n(1'b1),.vgaData(pixel),.vga_en(vga_en),.HSync(HSync),.VSync(VSync),.vgaRed(vgaRed),.vgaGreen(vgaGreen),.vgaBlue(vgaBlue),.vgaH(vgaH),.vgaV(vgaV));
    KeyBoard_PS2 m8(.clk_in(clkdiv[0]),.rst_n(rst_n), .key_clk(ps2k_clk), .key_data(ps2k_data), .out(key_status));

    audio_data m9(.clk_audio(clk_audio), .rst_n(rst_n), .audio_sample(audio_sample));
    delta_sigma_adc#(.W ( 16 ))
    delta_sigma_adc_mono(.clk(clk), .rst_n(1'b1), .din(audio_sample), .dout(sound));

    SSeg7_Dev m10( .clk( clk ), .rst( { 1'b0 } ),.Start( clkdiv[ 20 ] ),.SW0({1'b1}), .flash( clkdiv[ 25 ] ),
              .Hexs({ironManCounter, 24'b0, fireManCounter}), .point( { 8'b00000000 } ), .LES( { 8'b00000000 } ),
              .seg_clk( seg_clk ), .seg_sout( seg_sout ), .SEG_PEN( SEG_PEN ),.seg_clrn( seg_clrn ));
    assign AUD_PWM = status ? clkdiv[16] : sound; 
endmodule
