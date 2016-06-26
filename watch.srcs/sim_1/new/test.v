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
    wire [3:0] s3, s4, m3, m4, h3, h4,
    wire a,
    wire b 
);
    
    top #(1000000) CLK_1Hz (
        .clk(gen_clk),
        .hz(a)
      );
      top #(40000) CLK_250Hz (
        .clk(gen_clk),
        .hz(b)
      );
     

      dec_cnt UUT (
        .clk(a),
        //.clk(gen_clk),
        .s1(s3),
        .s2(s4),
        .m1(m3),
        .m2(m4),
        .h1(h3),
        .h2(h4)        
    );
     
    multi_led LED (
        .clk(b),
        .led1(s3),
        .led2(s4),
        .led3(m3),
        .led4(m4),
        .led5(h3),
        .led6(h4)
    );
        
    initial
     begin
     gen_clk <= 3'b000;
     end

     always forever #500 gen_clk <= ~gen_clk;
endmodule
