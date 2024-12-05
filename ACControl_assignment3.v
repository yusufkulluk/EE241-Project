`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:24:16
// Design Name: 
// Module Name: ACControl_assignment3
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


module ACControl_assignment3(
    input wire door_open,      // High if any door is open
    input wire window_open,    // High if any window is open
    output reg ac_on           // High to turn on the air conditioner
);

    always @(*) begin
        if (door_open || window_open)
            ac_on = 0;         // Turn off the AC if any door or window is open
        else
            ac_on = 1;         // Turn on the AC otherwise
    end

endmodule

