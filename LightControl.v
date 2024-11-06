`timescale 1ns / 1ps

module LightControl (
    input wire motion_detected,    // High if motion is detected
    input wire clk,                // Clock input for timing
    output reg light_on            // High to keep the light on
);

    reg [5:0] timer;              // 6-bit timer to count up to 60 minutes

    always @(posedge clk) begin
        if (motion_detected) begin
            timer <= 0;           // Reset timer when motion is detected
            light_on <= 1;        // Keep light on
        end else if (timer == 60) begin
            light_on <= 0;       // Turn off light after 60 minutes of no motion
        end else begin
            timer <= timer + 1;  // Increment timer each clock cycle
        end
    end

endmodule
