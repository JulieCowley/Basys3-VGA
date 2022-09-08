`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/08/2022 10:24:37 AM
// Design Name: 
// Module Name: color_gen_tb
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


module color_gen_tb();

    reg clk;
    reg rst;
    reg btnC;
    reg blanking;
    wire [3:0] Red;
    wire [3:0] Green;
    wire [3:0] Blue;
    
    Color_Generator UUT 
        (.clk(clk),
         .rst(rst),
         .btnC(btnC),
         .blanking(blanking),
         .Red(Red),
         .Green(Green),
         .Blue(Blue));
    
    always # 5 clk <= ~clk;
    
    initial
    begin
    clk <= 1'b0;
    rst <= 1'b1;
    btnC <= 1'b0;
    blanking <= 1'b0;
    
    #5 rst <= 1'b0;
    
    #10 btnC <= 1'b1;
    #10 btnC <= 1'b0;
    
    #22 btnC <= 1'b1;
    #15 btnC <= 1'b0;
    
    #22 btnC <= 1'b1;
    #15 btnC <= 1'b0;
    
    #10 blanking <= 1'b1;
    #10 blanking <= 1'b0;
    
    #1000;
    $finish;
    end


endmodule
