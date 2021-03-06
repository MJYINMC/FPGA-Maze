`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/15/2020 11:04:04 PM
// Design Name:
// Module Name: Keyboard_PS2
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

module KeyBoard_PS2(
           input	clk_in,
           input	rst_n,
           input	key_clk,
           input	key_data,
           output	reg	[ 7: 0 ] out
       );
    reg	key_clk_r0 = 1'b1, key_clk_r1 = 1'b1;
    reg	key_data_r0 = 1'b1, key_data_r1 = 1'b1;
    reg key_break;
    always @ ( posedge clk_in ) begin
        if ( !rst_n ) begin
            key_clk_r0 <= 1'b1;
            key_clk_r1 <= 1'b1;
            key_data_r0 <= 1'b1;
            key_data_r1 <= 1'b1;
        end
        else begin
            key_clk_r0 <= key_clk;
            key_clk_r1 <= key_clk_r0;
            key_data_r0 <= key_data;
            key_data_r1 <= key_data_r0;
        end
    end


    wire	key_clk_neg = key_clk_r1 & ( ~key_clk_r0 );

    reg	[ 3: 0 ] cnt;
    reg	[ 7: 0 ] temp_data;

    always @ ( posedge clk_in ) begin
        if ( !rst_n ) begin
            cnt <= 4'd0;
            temp_data <= 8'd0;
        end
        else if ( key_clk_neg ) begin
            if ( cnt >= 4'd10 ) begin
                cnt <= 4'd0;
            end
            else begin
                cnt <= cnt + 1'b1;
            end
            case ( cnt )
                4'd0:
                    ;
                4'd1:
                    temp_data[ 0 ] <= key_data_r1;
                4'd2:
                    temp_data[ 1 ] <= key_data_r1;
                4'd3:
                    temp_data[ 2 ] <= key_data_r1;
                4'd4:
                    temp_data[ 3 ] <= key_data_r1;
                4'd5:
                    temp_data[ 4 ] <= key_data_r1;
                4'd6:
                    temp_data[ 5 ] <= key_data_r1;
                4'd7:
                    temp_data[ 6 ] <= key_data_r1;
                4'd8:
                    temp_data[ 7 ] <= key_data_r1;
                4'd9:
                    ;
                4'd10:
                    ;
                default:
                    ;
            endcase
        end
    end

    localparam IRON_UP = 8'h1D,          // W
            IRON_DOWN = 8'h1B,          // S
            IRON_LEFT = 8'h1C,          // A
            IRON_RIGHT = 8'h23,          // D
            // we really ignore the ascii code "E0" because it's useless
            FIRE_UP = 8'h75,          // UP
            FIRE_DOWN = 8'h72,          // DOWN
            FIRE_LEFT = 8'h6B,          // LEFT
            FIRE_RIGHT = 8'h74;          //RIFHT

    always @ ( posedge clk_in ) begin
        if ( !rst_n ) begin
            key_break <= 1'b0;
        end
        else if ( cnt == 4'd10 && key_clk_neg ) begin
            if ( temp_data == 8'hf0 ) begin
                key_break <= 1'b1;
            end
            else begin
                key_break <= 1'b0;
            end
            case ( temp_data )
                IRON_UP:
                    out[ 0 ] <= ~key_break;
                IRON_DOWN:
                    out[ 1 ] <= ~key_break;
                IRON_LEFT :
                    out[ 2 ] <= ~key_break;
                IRON_RIGHT:
                    out[ 3 ] <= ~key_break;
                FIRE_UP:
                    out[ 4 ] <= ~key_break;
                FIRE_DOWN:
                    out[ 5 ] <= ~key_break;
                FIRE_LEFT:
                    out[ 6 ] <= ~key_break;
                FIRE_RIGHT:
                    out[ 7 ] <= ~key_break;
                default:
                    ;
            endcase
        end
    end
endmodule