`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 12:07:58 PM
// Design Name: 
// Module Name: clk_div_tb
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


module clk_div_tb();

    reg clk;
    reg rst;
    reg ref_clk_25MHz;
    wire clk_25MHz;
    
    always #5 clk <= ~clk;
    always #20 ref_clk_25MHz <= ~ref_clk_25MHz;
    
    clk_div_25MHz UUT
        (.clk(clk),
         .rst(rst),
         .clk_25MHz(clk_25MHz));
    
    initial
    begin
        rst <= 1'b1;
        clk <= 1'b1;
        ref_clk_25MHz <= 1'b1;
        #10 rst <= 1'b0;
        #1000;
        $finish;
    end
    

endmodule
