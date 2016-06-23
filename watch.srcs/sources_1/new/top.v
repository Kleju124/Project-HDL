`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.06.2016 01:16:36
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


module top (clk, onehertz);
  input             clk;            // synthesis attribute PERIOD clk "50 MHz"
  reg        [25:0] count = 0;
  output reg        onehertz = 0;   // one pulse per second

  always @ (posedge clk) begin
    onehertz <= (count == 50000000 - 2);
    count <= onehertz ? 0 : count + 1;
  end
endmodule
