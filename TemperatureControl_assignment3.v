`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:37:56
// Design Name: 
// Module Name: TemperatureControl_assignment3
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


module TemperatureControl_assignment3(
    input wire [7:0] temperature,  // 8-bit temperature input in Celsius
    output wire heater_on,         // High to turn on the heater
    output wire ac_on              // High to turn on the air conditioner
);

    assign heater_on = (temperature < 20);
    assign ac_on = (temperature > 25);

endmodule