`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:34:44
// Design Name: 
// Module Name: SmartWallPlugControl_assignment3
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


module SmartWallPlugControl_assignment3(
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire phone_control,     // High if the system can be controlled by a phone
    output reg wall_plug_off      // High to turn off the smart wall plug
);

    always @(*) begin
        if (~wifi_connected || ~phone_control)
            wall_plug_off = 1;    // Turn off the wall plug if no Wi-Fi or no phone control
        else
            wall_plug_off = 0;    // Keep the wall plug on otherwise
    end

endmodule