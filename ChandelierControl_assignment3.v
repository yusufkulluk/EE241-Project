`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:25:26
// Design Name: 
// Module Name: ChandelierControl_assignment3
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


module ChandelierControl_assignment3(
    input wire [3:0] bulb_status, // 4 bits: 1 if bulb is working, 0 if not
    output wire [3:0] brightness  // Brightness level for each bulb
);

    wire all_working;

    assign all_working = (bulb_status == 4'b1111); // Check if all bulbs are working
    assign brightness = (all_working & 4'b1010) | (~all_working & 4'b1111);

endmodule
