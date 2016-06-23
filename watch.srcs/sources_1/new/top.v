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


module top #(parameter value = 50000000)(clk, hz);
  input             clk;            // synthesis attribute PERIOD clk "50 MHz"
  reg        [25:0] count = 0;
  output reg        hz = 0; 

  always @ (posedge clk) begin
    hz <= (count == value - 2);
    count <= hz ? 0 : count + 1;
  end
endmodule
