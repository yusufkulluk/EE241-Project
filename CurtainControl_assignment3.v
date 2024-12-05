`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:27:09
// Design Name: 
// Module Name: CurtainControl_assignment3
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


module CurtainControl_assignment3(
    input wire sun_shine,     // High when sunlight is detected
    output reg curtains_open  // High to open curtains, low to close
);

    always @(*) begin
        if (sun_shine)
            curtains_open = 1; // Open curtains when sunlight is detected
        else
            curtains_open = 0; // Close curtains otherwise
    end

endmodule