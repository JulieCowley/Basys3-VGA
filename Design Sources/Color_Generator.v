`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 12:48:43 PM
// Design Name: 
// Module Name: Color_Generator
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


module Color_Generator(
    input clk,
    input rst,
    input btnC,
    input blanking,
    output reg [3:0] Red,
    output reg [3:0] Green,
    output reg [3:0] Blue
    );
    
    localparam WHITE = 2'b00;
    localparam RED = 2'b01;
    localparam GREEN = 2'b10;
    localparam BLUE = 2'b11;
    reg [1:0] CURRENT_STATE, NEXT_STATE;
    
    //cycle though colors when center button is pressed
    always @ (posedge btnC) begin
        case (CURRENT_STATE)
        WHITE: NEXT_STATE <= RED;
        RED:   NEXT_STATE <= GREEN;
        GREEN: NEXT_STATE <= BLUE;
        BLUE:  NEXT_STATE <= WHITE;
        default: NEXT_STATE <= WHITE;
        endcase
    end //state genrator
    
    //flip flops
    always @ (posedge clk) begin
        if(rst) CURRENT_STATE <= WHITE;
        else CURRENT_STATE <= NEXT_STATE;
    end
    
    //Output Forming Logic
    always @(posedge clk) begin
    
        if(~blanking) begin
            case(CURRENT_STATE)
            WHITE:begin
                Red <= 4'hF;
                Green <= 4'hF;
                Blue <= 4'hF;
            end // case:WHITE
            
            RED:begin
                Red <= 4'hF;
                Green <= 4'h0;
                Blue <= 4'h0;
            end // case:RED
            
            GREEN:begin
                Red <= 4'h0;
                Green <= 4'hF;
                Blue <= 4'h0;
            end //case:GREEN
            
            BLUE:begin
                Red <= 4'h0;
                Green <= 4'h0;
                Blue <= 4'hF;
            end //case:BLUE
            endcase
        end // not blanking condition
        
        // vga is blanking so drive outputs off
        else begin
            Red <= 4'h0;
            Green <= 4'h0;
            Blue <= 4'h0;
        end 
    end //Output forming logic
    
endmodule
