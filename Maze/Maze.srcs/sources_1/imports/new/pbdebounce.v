`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    08:03:23 11/02/2020
// Design Name:
// Module Name:    pbdebounce
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
module pbdebounce(
           input wire clk_1ms,
           input wire button,
           output reg pbreg
       );

reg [ 7: 0 ] pbshift;
always @( posedge clk_1ms ) begin
    pbshift = pbshift << 1;
    pbshift[ 0 ] = button;
    if ( pbshift == 8'b0 ) begin
        pbreg = 0;
    end
    if ( pbshift == 8'hFF ) begin
        pbreg = 1;
    end
end

endmodule
