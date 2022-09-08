`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 01:19:53 PM
// Design Name: 
// Module Name: debounce_div
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


module debounce_div(
    input clk,
    output clk_deb
    );
    reg [15:0] cnt = 0;
    
    assign clk_deb = cnt[15];
    always @(posedge clk) cnt <= cnt +1;
    
endmodule
