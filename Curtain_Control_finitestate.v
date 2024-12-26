`timescale 1ns / 1ps


module Curtain_Control_finitestate(
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal
    input wire input_sig, // Input signal
    output reg state,     // Current state (0: Close, 1: Open)
    output reg out        // Output (Curtain status)
);

    // State encoding
    parameter CLOSE = 1'b0;
    parameter OPEN  = 1'b1;

    // Next state logic
    reg next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= CLOSE; // Reset to CLOSE state
        end else begin
            state <= next_state; // Update state
        end
    end

    always @(*) begin
        // Default values
        next_state = state;
        out = 1'b0;

        case (state)
            CLOSE: begin
                if (input_sig == 1'b1) begin
                    next_state = OPEN; // Transition to OPEN state
                    out = 1'b1; // Curtain is opening
                end
            end
            OPEN: begin
                if (input_sig == 1'b0) begin
                    next_state = CLOSE; // Transition to CLOSE state
                    out = 1'b0; // Curtain is closing
                end
            end
            default: begin
                next_state = CLOSE;
                out = 1'b0;
            end
        endcase
    end

endmodule