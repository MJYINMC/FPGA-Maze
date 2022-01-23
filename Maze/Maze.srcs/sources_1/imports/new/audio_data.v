`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/31/2020 09:50:27 AM
// Design Name: 
// Module Name: audio_data
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


module audio_data(
    input clk_audio,
    input rst_n,
    output [15:0] audio_sample
    );
    // parameter sample_rate = 18'd16000;
    // parameter playtime = 4'd10; // seconds
    // assign total = sample_rate * playtime;
    wire [15:0] audio_data;
    reg [17:0] rom_addr;
    always @( posedge clk_audio or negedge rst_n)
    begin
        if(!rst_n)
            rom_addr <= 0;
        else
            begin
                if(rom_addr < 219255)
                    rom_addr <= rom_addr + 1;
                else
                    rom_addr <= 0;
            end
    end

    blk_mem_gen_0 audio(.clka(clk_audio),.addra(rom_addr),.douta(audio_data),.ena(1'b1));
    assign audio_sample = audio_data;
endmodule
