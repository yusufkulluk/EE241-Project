`timescale 1ns / 1ps

module ACControl (
    input wire door_open,      // High if any door is open
    input wire window_open,    // High if any window is open
    output wire ac_on          // High to turn on the air conditioner
);

    assign ac_on = ~(door_open | window_open);

endmodule
