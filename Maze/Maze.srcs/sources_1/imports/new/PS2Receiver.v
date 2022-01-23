`timescale 1ns / 1ps
module PS2Receiver(
    input clk,
    input rst_n,
    input kclk,
    input kdata,
    output ps2_state,		//键盘当前状态，ps2_state=1表示有键被按下 
    output [7:0] ps2_byte
    );
    
    
    wire kclkf, kdataf;
    reg [7:0]datacur;
    reg [7:0]dataprev;
    reg [3:0]cnt;
    reg flag;

    reg [7:0] ps2_asci;
    reg key_released;

    initial begin
        cnt <= 4'b0000;
        flag <= 1'b0;
        key_released <= 1'b0;
    end
    
debouncer debounce(
    .clk(clk),
    .I0(kclk),
    .I1(kdata),
    .O0(kclkf),
    .O1(kdataf)
);

always@(negedge(kclkf))begin
    case(cnt)
    0:;//Start bit
    1:datacur[0]<=kdataf;
    2:datacur[1]<=kdataf;
    3:datacur[2]<=kdataf;
    4:datacur[3]<=kdataf;
    5:datacur[4]<=kdataf;
    6:datacur[5]<=kdataf;
    7:datacur[6]<=kdataf;
    8:datacur[7]<=kdataf;
    9:flag<=1'b1;
    10:flag<=1'b0;
    
    endcase
        if(cnt<=9) cnt<=cnt+1;
        else if(cnt==10) cnt<=0;
        
end

always @(posedge flag or negedge rst_n) begin
    if(!rst_n)begin
        key_released <= 1;
        ps2_asci <= 8'b0;        
    end
    else
    begin
        if ( (dataprev != datacur) || key_released) begin
            if(dataprev == 8'hf0)
            begin
                key_released <= 1'b1;
            end

            if(dataprev != 8'hf0 && key_released)
            begin
                key_released <= 1'b0;
            end
            if(dataprev == 8'hE0)
            begin
                case (datacur)		//键值转换为ASCII码，只处理字母
                    8'h74: ps2_asci <= 8'h14;  // RIGHT
                    default: ;
                endcase
            end
            else
            begin
                case (datacur)		//键值转换为ASCII码，只处理字母
                    8'h15: ps2_asci <= 8'h51;	//Q
                    8'h1d: ps2_asci <= 8'h57;	//W

                    8'h75: ps2_asci <= 8'h11;	//UP

                    8'h24: ps2_asci <= 8'h45;	//E
                    8'h2d: ps2_asci <= 8'h52;	//R
                    8'h2c: ps2_asci <= 8'h54;	//T
                    8'h35: ps2_asci <= 8'h59;	//Y
                    8'h3c: ps2_asci <= 8'h55;	//U
                    8'h43: ps2_asci <= 8'h49;	//I
                    8'h44: ps2_asci <= 8'h4f;	//O
                    8'h4d: ps2_asci <= 8'h50;	//P				  	
                    8'h1c: ps2_asci <= 8'h41;	//A

                    8'h6b: ps2_asci <= 8'h13;	//LEFT

                    8'h1b: ps2_asci <= 8'h53;	//S

                    8'h72: ps2_asci <= 8'h12;	//DOWN

                    8'h23: ps2_asci <= 8'h44;	//D
                    8'h2b: ps2_asci <= 8'h46;	//F
                    8'h34: ps2_asci <= 8'h47;	//G
                    8'h33: ps2_asci <= 8'h48;	//H
                    8'h3b: ps2_asci <= 8'h4a;	//J
                    8'h42: ps2_asci <= 8'h4b;	//K
                    8'h4b: ps2_asci <= 8'h4c;	//L
                    8'h1a: ps2_asci <= 8'h5a;	//Z
                    8'h22: ps2_asci <= 8'h58;	//X
                    8'h21: ps2_asci <= 8'h43;	//C
                    8'h2a: ps2_asci <= 8'h56;	//V
                    8'h32: ps2_asci <= 8'h42;	//B
                    8'h31: ps2_asci <= 8'h4e;	//N
                    8'h3a: ps2_asci <= 8'h4d;	//M
                    8'hf0: ps2_asci <= 8'hf0;	//Terminate
                    default: ;
                endcase
            end
            dataprev <= datacur; 
        end
    end
end

assign ps2_state = ~key_released;
assign ps2_byte = ps2_asci;
endmodule
