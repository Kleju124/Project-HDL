`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2016 22:53:58
// Design Name: 
// Module Name: multi_led
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


module multi_led(
    input clk,
    input [3:0] led1, led2, led3, led4, led5, led6,
    output reg sa, sb, sc, sd, se, sf, sg,
    output reg display1, display2, display3, display4, display5, display6
    );
    initial
        select <= 3'b000;
    
    reg [2:0] select;
    always @(posedge clk)
        select <= select + 3'b001;
        
    reg [3:0] led;
    always @(select, led1, led2, led3, led4, led5, led6)
        case(select)
        3'b000:
            begin
            display6 <= 1;
            display5 <= 1;
            display4 <= 1;
            display3 <= 1;
            display2 <= 1;
            display1 <= 0;
            led <= led1;
            end
        3'b001:
            begin
            display6 <= 1;
            display5 <= 1;
            display4 <= 1;
            display3 <= 1;
            display2 <= 0;
            display1 <= 1;
            led <= led2;
            end
        3'b010:
            begin
            display6 <= 1;
            display5 <= 1;
            display4 <= 1;
            display3 <= 0;
            display2 <= 1;
            display1 <= 1;
            led <= led3;
            end
        3'b011:
            begin
            display6 <= 1;
            display5 <= 1;
            display4 <= 0;
            display3 <= 1;
            display2 <= 1;
            display1 <= 1;
            led <= led4;
            end
        3'b100:
            begin
            display6 <= 1;
            display5 <= 0;
            display4 <= 1;
            display3 <= 1;
            display2 <= 1;
            display1 <= 1;
            led <= led5;
            end
        3'b101:
            begin
            display6 <= 0;
            display5 <= 1;
            display4 <= 1;
            display3 <= 1;
            display2 <= 1;
            display1 <= 1;
            led <= led6;
            end
    endcase
    always @(led)
           case(led)                               //abcdefg
               4'b0000: {sa,sb,sc,sd,se,sf,sg} <= 7'b0000001;  // 0
               4'b0001: {sa,sb,sc,sd,se,sf,sg} <= 7'b1001111;  // 1
               4'b0010: {sa,sb,sc,sd,se,sf,sg} <= 7'b0010010;  // 2
               4'b0011: {sa,sb,sc,sd,se,sf,sg} <= 7'b0000110;  // 3
               4'b0100: {sa,sb,sc,sd,se,sf,sg} <= 7'b1001100;  // 4
               4'b0101: {sa,sb,sc,sd,se,sf,sg} <= 7'b0100100;  // 5
               4'b0110: {sa,sb,sc,sd,se,sf,sg} <= 7'b0100000;  // 6
               4'b0111: {sa,sb,sc,sd,se,sf,sg} <= 7'b0001111;  // 7
               4'b1000: {sa,sb,sc,sd,se,sf,sg} <= 7'b0000000;  // 8
               4'b1001: {sa,sb,sc,sd,se,sf,sg} <= 7'b0000100;  // 9
               4'b1010: {sa,sb,sc,sd,se,sf,sg} <= 7'b0001000;  // a
               4'b1011: {sa,sb,sc,sd,se,sf,sg} <= 7'b1100000;  // b
               4'b1100: {sa,sb,sc,sd,se,sf,sg} <= 7'b0110001;  // c
               4'b1101: {sa,sb,sc,sd,se,sf,sg} <= 7'b1000010;  // d
               4'b1110: {sa,sb,sc,sd,se,sf,sg} <= 7'b0110000;  // e
               4'b1111: {sa,sb,sc,sd,se,sf,sg} <= 7'b0111000;  // f
               default: {sa,sb,sc,sd,se,sf,sg} <= 7'b1111111;  // -
           endcase
         
endmodule
