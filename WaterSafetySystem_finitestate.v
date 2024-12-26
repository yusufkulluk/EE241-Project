`timescale 1ns / 1ps


module WaterSafetySystem_finitestate(
    input wire clk,         // Clock signal
    input wire reset,       // Reset signal
    input wire in1,         // Wi-Fi status
    input wire in2,         // Flow status
    output reg state,       // Current state (0 = Off, 1 = On)
    output reg output_signal // Output signal
);

    // State encoding
    parameter OFF = 1'b0;
    parameter ON = 1'b1;

    // Next state logic
    reg next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= OFF; // Reset to the OFF state
        end else begin
            state <= next_state; // Update state on clock edge
        end
    end

    always @(*) begin
        // Default values
        next_state = state;
        output_signal = 1'b0;

        case (state)
            OFF: begin
                if (in1 == 1'b0 && in2 == 1'b1) begin
                    next_state = ON;
                    output_signal = 1'b1;
                end else begin
                    next_state = OFF;
                end
            end
            ON: begin
                if (in1 == 1'b1 && in2 == 1'b1) begin
                    next_state = OFF;
                end else begin
                    next_state = ON;
                end
            end
            default: begin
                next_state = OFF;
            end
        endcase
    end

endmodule