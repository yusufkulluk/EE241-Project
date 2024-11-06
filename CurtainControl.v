`timescale 1ns / 1ps

module CurtainControl (
    input wire sun_shine,     // High when sunlight is detected
    output wire curtains_open // High to open curtains, low to close
);

    assign curtains_open = sun_shine;

endmodule
