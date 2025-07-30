`timescale 1ns / 1ps

module tam_toplama_4bit(
    input a,b,
    input cin,
    output s, 
    output cout
    );
    
    assign s = ( a ^ b ) ^ cin;
    assign cout = (a & b) + (cin & (a ^ b));
    
endmodule