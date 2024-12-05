`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:28:47
// Design Name: 
// Module Name: DoorLockSystem_assignment3
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


module DoorLockSystem_assignment3(
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire motion_near_door,  // High if motion is detected near the door
    output reg door_locked        // High to lock the door
);

    always @(*) begin
        if (~wifi_connected && motion_near_door)
            door_locked = 1; // Lock the door if no Wi-Fi connection and motion is detected
        else
            door_locked = 0; // Keep the door unlocked otherwise
    end

endmodule