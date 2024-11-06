`timescale 1ns / 1ps

module DoorLockSystem (
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire motion_near_door,  // High if motion is detected near the door
    output wire door_locked       // High to lock the door
);

    assign door_locked = (~wifi_connected) & motion_near_door;

endmodule