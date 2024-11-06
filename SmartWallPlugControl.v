`timescale 1ns / 1ps

module SmartWallPlugControl (
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire phone_control,     // High if the system can be controlled by a phone
    output wire wall_plug_off    // High to turn off the smart wall plug
);

    assign wall_plug_off = (~wifi_connected) | (~phone_control);

endmodule
