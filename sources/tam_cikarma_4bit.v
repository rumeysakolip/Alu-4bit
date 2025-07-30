`timescale 1ns / 1ps

module tam_cikarma_4bit(
    input a,b,
    input bin,
    output d,
    output bout
);

    assign d = ( a ^ b ) ^ bin; 
    assign bout = (~a & b) + (~(a ^ b) & bin);
endmodule