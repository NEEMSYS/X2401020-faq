`timescale 1ns / 1ps


module mux21topv(
   input wire sw0,
   input wire sw1,
   inout wire sw2,
   output wire [0:0] led
);
   mux21a u1(.a(sw0),
             .b(sw1),
             .s(sw2),
             .y(led[0])
   );
endmodule

module mux21a(
    input wire a,
    input wire b,
    inout wire s,
    output wire y
    );
    
    assign y = a ? (s^1'b0) : s;
    assign s = a ? (a&b) : 1'bz;
endmodule
