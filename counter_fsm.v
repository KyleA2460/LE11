`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2023 01:35:37 PM
// Design Name: 
// Module Name: le9
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

module state_cntr(
    input en,
    input clk,
    input reset,
    output pulse,
    output TerminalCount_10,
    output TerminalCount_1
    );

reg [7:0] cnt;
reg [7:0] next_cnt;

// flip-flops (state memeory)
always @(posedge clk or posedge reset) begin
    if (reset==1'b1) cnt<=8'd0; // reset to zero 
    else cnt <= next_cnt;
end

// next-state logic 
always @(*) begin
    if(en) begin // check for the enable 
        if (cnt == 8'd255) next_cnt = 8'd0; // if the counter reaches 15 go back to zero 
        else next_cnt = cnt + 1; // new concept -- a counter! 
    end 
    else begin
    next_cnt = cnt; // if enable is low stay in the same state 
    end
end

// output logic 
TerminalCount_10 = TerminalCount_10 + 1
    if (TerminalCount_10 == 2'd3) cnt = 3'd5
        begin
assign pulse = (cnt == 8'd255); // at the last state send out a pulse 
TerminalCount_1 = cnt + 1
            if (TerminalCount_1 == 6'd30) cnt =
endmodule
