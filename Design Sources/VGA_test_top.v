`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2022 10:41:24 AM
// Design Name: 
// Module Name: VGA_test_top
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


module VGA_test_top(
    input clk,
    input btnC,
    input btnR,
    output Hsync,
    output Vsync,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue
    );
    
    wire clk_25MHz;
    wire blanking;
    wire debounce_clk;
    wire debounced_btnC;
    
    //create a 25MHz clk for the VGA display
    clk_div_25MHz clk_divider
        (.clk(clk),
         .clk_25MHz(clk_25MHz),
         .rst(btnR));
    
    //Instantiate a vga display module
    VGA_Driver vga_Display
        (.clk(clk_25MHz),
         .rst(btnR),
         .HSync(Hsync),
         .VSync(Vsync),
         .blanking(blanking));
         
    //Need to debounce a button,
    //first created a slowed down clk
    debounce_div deb_clk
        (.clk(clk),
         .clk_deb(debounce_clk));
        
    //debounce center button
    button_debounce center
        (.clk(debounce_clk),
         .btn_in(btnC),
         .btn_status(debounced_btnC)); 
         
    //cycle through colors every time center btn is pressed
    Color_Generator color_gen
        (.clk(clk),
         .rst(btnR),
         .btnC(debounced_btnC),
         .Red(vgaRed),
         .Green(vgaGreen),
         .Blue(vgaBlue),
         .blanking(blanking));
         
         
         
         
endmodule
