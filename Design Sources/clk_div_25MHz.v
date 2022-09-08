`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 12:03:35 PM
// Design Name: 
// Module Name: clk_div_25MHz
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
module clk_div_25MHz(
    input clk,
    input rst,
    output clk_25MHz
    );
    
    reg [6:0] cnt;
    
    always @(posedge clk) begin
        if(rst) cnt <= 0;
        else cnt <= cnt + 1;
    end

    //assign clk_div = cnt[16]; //100 MHz / 2^17 = 762.93 Hz 
    
    assign clk_25MHz = cnt[1]; // 100 MHz /2^2 = 25MHz
endmodule
