`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:31:31
// Design Name: 
// Module Name: LightControl_assignment3
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


module LightControl_assignment3(
    input wire motion_detected,    // High if motion is detected
    input wire [5:0] timer,        // External 6-bit timer value
    output wire light_on           // High to keep the light on
);

    // Dataflow logic for light control
    assign light_on = motion_detected || (timer < 60);

endmodule