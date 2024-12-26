`timescale 1ns / 1ps



module SmartWallPlugControl_finitestate(

    input wire clk,        // Clock signal
    input wire reset,      // Reset signal
    input wire in1,        // Wi-Fi input
    input wire in2,        // Phone control input
    output reg output_signal // Output signal for the wall plug
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
                if (in1 == 0 && in2 == 1) // Transition to ON when in2 is 1
                    next_state = ON;
                else
                    next_state = OFF;
            end
            ON: begin
                if (in1 == 0 && in2 == 1) // Transition to OFF when in2 is 1
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
            OFF: output_signal = 1'b0; // Output is 0 when OFF
            ON:  output_signal = 1'b1; // Output is 1 when ON
            default: output_signal = 1'b0;
        endcase
    end

endmodule