`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.06.2016 22:55:25
// Design Name: 
// Module Name: test
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


module test(
    output reg gen_clk,
    wire [3:0] s3,
    wire [7:4] s4,
    wire [11:8] m3,
    wire [15:12] m4,
    wire [19:16] h3,
    wire [23:20] h4,
    wire a
);
    
      top CLK (
        .clk(gen_clk),
        .onehertz(a)
    );

      dec_cnt UUT (
        .clk(a),
        .s1(s3),
        .s2(s4),
        .m1(m3),
        .m2(m4),
        .h1(h3),
        .h2(h4)        
    );
        
    initial
     begin
     gen_clk <= 3'b000;
     end

     always forever #10 gen_clk <= ~gen_clk;
endmodule
