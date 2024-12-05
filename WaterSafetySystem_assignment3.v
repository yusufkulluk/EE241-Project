`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:39:12
// Design Name: 
// Module Name: WaterSafetySystem_assignment3
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


module WaterSafetySystem_assignment3(
    input wire wifi_connected,     // High if a device is connected to Wi-Fi
    input wire water_flow_detected, // High if water flow is detected
    output reg water_supply_off     // High to shut off the water supply
);

    always @(*) begin
        if (~wifi_connected && water_flow_detected)
            water_supply_off = 1;    // Turn off water supply if no Wi-Fi and water flow is detected
        else
            water_supply_off = 0;    // Keep water supply on otherwise
    end

endmodule