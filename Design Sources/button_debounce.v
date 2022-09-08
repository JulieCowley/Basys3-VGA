`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 01:19:53 PM
// Design Name: 
// Module Name: button_debounce
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


module button_debounce(
    input clk,
    input btn_in,
    output btn_status
    );
    
    reg [19:0] btn_shift;
    
    // left shift register
    always @(posedge clk) begin
        btn_shift <= {btn_shift[18:0], btn_in}; 
    end
    
    // use of reduction & operator
    // produces 1 when all 20 bits in btn_shift are 1
    assign btn_status = &btn_shift;
    
endmodule
