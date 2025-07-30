`timescale 1ns / 1ps

module karsilastirici_4bit(
    input [3:0] a,b,
    output buyuk, esit, kucuk);

wire [3:0]x;

assign x=~(a^b);
assign buyuk=(a[3]&(~b[3]))|(x[3]&a[2]&(~b[2]))|(x[3]&x[2]&a[1]&(~b[1]))|(x[3]&x[2]&x[1]&a[0]&(~b[0]));
assign kucuk=((~a[3])&b[3])|(x[3]&(~a[2])&b[2])|(x[3]&x[2]&(~a[1])&b[1])|(x[3]&x[2]&x[1]&(~a[0])&b[0]);
assign esit=x[3]&x[2]&x[1]&x[0];
endmodule
