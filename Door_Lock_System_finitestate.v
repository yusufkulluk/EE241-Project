`timescale 1ns / 1ps



module Door_Lock_System_finitestate(
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal
    input wire in1,       // Input 1: Wi-Fi
    input wire in2,       // Input 2: Sensor
    output reg state,     // Current state (0: Locked, 1: Unlocked)
    output reg out        // Output (Door status)
);

    // State encoding
    parameter LOCKED   = 1'b0;
    parameter UNLOCKED = 1'b1;

    // Next state logic
    reg next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= LOCKED; // Reset to LOCKED state
        end else begin
            state <= next_state; // Update state
        end
    end

    always @(*) begin
        // Default values
        next_state = state;
        out = 1'b0;

        case (state)
            LOCKED: begin
                if (in1 == 1'b0 && in2 == 1'b1) begin
                    next_state = UNLOCKED;
                    out = 1'b1; // Door is unlocked
                end else begin
                    next_state = LOCKED;
                    out = 1'b0; // Door remains locked
                end
            end
            UNLOCKED: begin
                if (in1 == 1'b1 && in2 == 1'b0) begin
                    next_state = LOCKED;
                    out = 1'b0; // Door is locked
                end else begin
                    next_state = UNLOCKED;
                    out = 1'b1; // Door remains unlocked
                end
            end
            default: begin
                next_state = LOCKED;
                out = 1'b0; // Default to locked state
            end
        endcase
    end

endmodule