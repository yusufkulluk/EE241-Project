`timescale 1ns / 1ps

module SecuritySystem (
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire motion_detected,   // High if motion is detected
    output wire siren_active      // High to activate the siren
);

    assign siren_active = (~wifi_connected) & motion_detected;

endmodule