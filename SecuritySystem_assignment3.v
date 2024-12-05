`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:32:59
// Design Name: 
// Module Name: SecuritySystem_assignment3
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


module SecuritySystem_assignment3(
    input wire wifi_connected,    // High if a device is connected to Wi-Fi
    input wire motion_detected,   // High if motion is detected
    output reg siren_active       // High to activate the siren
);

    always @(*) begin
        if (~wifi_connected && motion_detected)
            siren_active = 1;    // Activate the siren when no Wi-Fi and motion is detected
        else
            siren_active = 0;    // Deactivate the siren otherwise
    end

endmodule