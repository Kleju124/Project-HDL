`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2016 21:03:53
// Design Name: 
// Module Name: dec_cnt
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


module dec_cnt(
    input wire clk,
    output reg [3:0] s1, s2, m1, m2, h1, h2,
/*    output reg [3:0] s1,
    output reg [7:4] s2,
    output reg [11:8] m1,
    output reg [15:12] m2,
    output reg [19:16] h1,
    output reg [23:20] h2, */
    reg [2:0] state   
    );
    
    initial
        begin
             state <= 3'b000;
             s1 <= 4'b0000;
             s2 <= 4'b0000;
             m1 <= 4'b0000;
             m2 <= 4'b0000;
             h1 <= 4'b0000;
             h2 <= 4'b0000;
        end
    
    always @(negedge clk )
    if(s1 == 4'b1001)
                begin
                s1 = 4'b0000;
                state <= 3'b001;
                end
            else if(s2 == 4'b0110)
                begin
                state <= 3'b010;
                s2 <= 4'b0000;
                end
            else if(m1 == 4'b1001)
                begin
                state <= 3'b011;
                m1 <= 4'b0000;
                end
            else if(m2 == 4'b0110)
                begin
                state <= 3'b100;
                m2 <= 4'b0000;
                end
            else if(h1 == 4'b1001)
                begin
                state <= 3'b101;
                h1 <= 4'b0000;
                end
            else if(h2 == 4'b0010 && h1 == 4'b0100)
                begin
                state <= 3'b000;
                h1 <= 4'b0000;
                h2 <= 4'b0000;
                end
    
    always @(posedge clk )
    begin     
        case(state)
            3'b000:
                s1 <= s1 + 4'b0001;                 
            3'b001:
            begin
                s2 <= s2 + 4'b0001;
                state <= 3'b000;
            end
            3'b010:
            begin
                m1 <= m1 + 4'b0001;
                state <= 3'b000;
            end
            3'b011:
            begin
                m2 <= m2 + 4'b0001;
                state <= 3'b000;
            end
            3'b100:
            begin
                h1 <= h1 + 4'b0001;
                state <= 3'b000;
            end
            3'b101:
            begin
                h2 <= h2 + 4'b0001;
                state <= 3'b000;
            end
       endcase
    end       
            
endmodule
