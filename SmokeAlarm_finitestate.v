`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2024 15:48:18
// Design Name: 
// Module Name: SmokeAlarm_finitestate
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


module SmokeAlarm_finitestate(
    input wire clk,        // Clock signal
    input wire reset,      // Reset signal
    input wire input_signal, // Input to control the state
    output reg alarm_output // Output indicating alarm state
);

    // State encoding
    parameter OFF = 1'b0;
    parameter ON  = 1'b1;

    // State registers
    reg current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= OFF;  // Default to OFF state
        end else begin
            current_state <= next_state;
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            OFF: begin
                if (input_signal == 1) // Transition to ON when input is 1
                    next_state = ON;
                else
                    next_state = OFF;
            end
            ON: begin
                if (input_signal == 0) // Transition to OFF when input is 0
                    next_state = OFF;
                else
                    next_state = ON;
            end
            default: next_state = OFF; // Default state
        endcase
    end

    // Output logic
    always @(*) begin
        case (current_state)
            OFF: alarm_output = 1'b0; // No alarm when OFF
            ON:  alarm_output = 1'b1; // Alarm ON when ON
            default: alarm_output = 1'b0;
        endcase
    end

endmodule