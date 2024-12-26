`timescale 1ns / 1ps


module AC_Control_finitestate(
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal
    input wire in1,       // Input 1: Door
    input wire in2,       // Input 2: Window
    output reg state,     // Current state (0: Close, 1: Open)
    output reg out        // Output (AC status)
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
                if (in1 == 1'b0 && in2 == 1'b1) begin
                    next_state = OPEN;
                end
                out = 1'b0; // AC is off in CLOSE state
            end
            OPEN: begin
                if (in1 == 1'b0 && in2 == 1'b0) begin
                    next_state = CLOSE;
                end
                out = 1'b1; // AC is on in OPEN state
            end
            default: begin
                next_state = CLOSE;
                out = 1'b0;
            end
        endcase
    end

endmodule
