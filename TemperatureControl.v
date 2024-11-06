`timescale 1ns / 1ps

module TemperatureControl (
    input wire [7:0] temperature,  // 8-bit temperature input in Celsius
    output reg heater_on,          // High to turn on the heater
    output reg ac_on               // High to turn on the air conditioner
);

    always @(*) begin
        if (temperature < 20) begin
            heater_on = 1;
            ac_on = 0;
        end
        else if (temperature >= 20 && temperature <= 25) begin
            heater_on = 0;
            ac_on = 0;
        end
        else begin  // temperature > 25
            heater_on = 0;
            ac_on = 1;
        end
    end

endmodule

