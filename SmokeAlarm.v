`timescale 1ns / 1ps

module SmokeAlarm (
    input wire smoke_detected,  // High if smoke is detected
    output wire siren_on        // High to turn on the siren
);

    assign siren_on = smoke_detected;

endmodule
