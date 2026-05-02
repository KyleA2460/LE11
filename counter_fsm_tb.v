`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:20 PM
// Design Name: 
// Module Name: le9_tb
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

module counter_fsm_tb;
  reg en,clk,reset;
  wire out1, out2;
  wire [3:0] pulse, terminal_count;
  wire [3:0] MyTen = 4'd3;
  wire [3:0] MyOne = 4'd9;
  // Instantiate design under test
  state_cntr U1(
  .en(en), 
  .clk(clk), 
  .reset(reset), 
  .pulse(pulse), 
  .out(out1)
  );
  state_cntr U2(
  .en(pulse), 
  .clk(clk), 
  .reset(reset), 
  .pulse(terminal_count),
  .out(out2)
  );
    initial begin
    en = 0;
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #10 en = 1;
//    // en, clk, and reset all are initialized at 0 to begin the program becaue they need all to be at a state of 0 
//    #2 //time reset stays at 0 for the duration of the initiation of the program 
//    reset = 1;
//    #2 //time reset stays at 1 until it will go to 0 
//    reset = 0;
//    #6 //time reset stays at 0 until en will equal 1
//    en = 1;
    #8000 //time that simulation will run for (8000 microseconds)
    $finish;
//$display("Value of c in hex is %h", c);
//$display("Parity of c is %b", parity);
  end
  always 
    #5
    clk = ~clk;
endmodule