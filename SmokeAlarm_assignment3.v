`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:36:33
// Design Name: 
// Module Name: SmokeAlarm_assignment3
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


module SmokeAlarm_assignment3(
    input wire smoke_detected,  // High if smoke is detected
    output reg siren_on         // High to turn on the siren
);

    always @(*) begin
        if (smoke_detected)
            siren_on = 1;    // Turn on the siren when smoke is detected
        else
            siren_on = 0;    // Turn off the siren otherwise
    end

endmodule