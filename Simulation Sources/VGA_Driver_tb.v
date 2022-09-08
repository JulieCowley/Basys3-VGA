`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 11:33:08 AM
// Design Name: 
// Module Name: VGA_Driver_tb
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


module VGA_Driver_tb();

    reg clk;
    reg rst;
    wire HSync;
    wire VSync;
    wire [9:0] x;
    wire [8:0] y;
    wire blanking;
    
    VGA_Driver UUT 
        (.clk(clk),
         .rst(rst),
         .HSync(HSync),
         .VSync(VSync),
         .blanking(blanking),
         .x(x),
         .y(y));
         
    always #2 clk <= ~clk;
    
    initial
    begin
        clk <= 1'b0;
        rst <= 1'b1;
        #20 
        rst <= 1'b0;
        #5000;
        $finish;
    end
         
    

endmodule
