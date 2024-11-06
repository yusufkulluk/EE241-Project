`timescale 1ns / 1ps

module ChandelierControl (
    input wire [3:0] bulb_status, // 4 bits: 1 if bulb is working, 0 if not
    output reg [3:0] brightness   // Brightness level for each bulb
);

    always @(*) begin
        if (bulb_status != 4'b1111) // If any bulb is faulty
            brightness = 4'b1111;   // Set higher brightness for all working bulbs
        else
            brightness = 4'b1010;   // Default brightness level
    end

endmodule
