`timescale 1ns / 1ps

module WaterSafetySystem (
    input wire wifi_connected,     // High if a device is connected to Wi-Fi
    input wire water_flow_detected, // High if water flow is detected
    output wire water_supply_off    // High to shut off the water supply
);

    assign water_supply_off = (~wifi_connected) & water_flow_detected;

endmodule