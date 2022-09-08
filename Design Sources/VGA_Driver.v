`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2022 12:16:26 PM
// Design Name: 
// Module Name: VGA_Driver
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
module VGA_Driver
   (input clk,
    input rst,
    output HSync,
    output VSync,
    output blanking,
    output [9:0] x,
    output [8:0] y
    );
    
    localparam TOTAL_COLS = 800;
    localparam TOTAL_ROWS = 525;
    localparam ACTIVE_COLS = 640;
    localparam ACTIVE_ROWS = 480;
    
    localparam H_SYNC_START = 18;   
    localparam H_SYNC_END = 18 + 92;
    localparam H_ACTIVE = 18 + 92 + 50;
    localparam V_ACTIVE_END = ACTIVE_ROWS;
    localparam V_SYNC_START = ACTIVE_ROWS + 10;
    localparam V_SYNC_END = ACTIVE_ROWS + 10 + 2;
    
    reg [9:0] h_count = 0; // horizontal position
    reg [8:0] v_count = 0; // vertical position
    
    //count up and reset once max row/cols reached
    always @(posedge clk)
    begin
        if(rst)
        begin
            h_count <= 10'b0;
            v_count <= 9'h000;
        end
        
        if (h_count == TOTAL_COLS - 1)
        begin
            h_count <= 0;
            if (v_count == TOTAL_ROWS -1)
                v_count <= 0;
            else
                v_count <= v_count +1;
        end
        else
            h_count <= h_count +1;
    end
    
    //generate the Sync Pulses
    assign HSync = ~((h_count >= H_SYNC_START) & (h_count < H_SYNC_END));
    assign VSync = ~((v_count >= V_SYNC_START) & (v_count < V_SYNC_END));
    
    // keep x and y bound within the blanking period
    assign x = (h_count < H_ACTIVE) ? 0 : (h_count - H_ACTIVE);
    assign y = (v_count >= V_ACTIVE_END) ? (V_ACTIVE_END - 1) : (v_count);
    
    assign blanking = ((h_count < H_ACTIVE) | (v_count > V_ACTIVE_END - 1));
    
 
endmodule