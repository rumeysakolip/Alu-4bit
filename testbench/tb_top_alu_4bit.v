`timescale 1ns / 1ps

module tb_top_alu_4bit();
    reg [3:0] tb_a,tb_b;
    reg [1:0] tb_sel;
    wire [4:0] tb_toplam,tb_fark;
    wire [7:0]tb_kare,tb_out;
    wire [2:0]tb_karsilastirma;
    
    top_alu_4bit uut(
        .a(tb_a),
        .b(tb_b),
        .sel(tb_sel),
        .out(tb_out),
        .toplam(tb_toplam),
        .fark(tb_fark),
        .kare(tb_kare),
        .karsilastirma(tb_karsilastirma)
        );
        
    initial begin
        tb_a = 4'b1111; tb_b = 4'b1111; tb_sel = 2'b11; 
        #10; 
        tb_a = 4'b1111; tb_b = 4'b0111; tb_sel = 2'b11; 
        #10; 
        tb_a = 4'b0111; tb_b = 4'b0011; tb_sel = 2'b10; 
        #10; 
        tb_a = 4'b0110; tb_b = 4'b1011; tb_sel = 2'b01; 
        #10;
        tb_a = 4'b0110; tb_b = 4'b0011; tb_sel = 2'b00; 
        #10; 
        tb_a = 4'b0101; tb_b = 4'b1010; tb_sel = 2'b11; 
        #10; 
        tb_a = 4'b0101; tb_b = 4'b0011; tb_sel = 2'b10; 
        #10;
        tb_a = 4'b0100; tb_b = 4'b1010; tb_sel = 2'b01; 
        #10; 
        tb_a = 4'b0100; tb_b = 4'b0010; tb_sel = 2'b00; 
        #10;
        tb_a = 4'b0011; tb_b = 4'b1001; tb_sel = 2'b11; 
        #10;
        tb_a = 4'b0011; tb_b = 4'b0001; tb_sel = 2'b10; 
        #10;
        tb_a = 4'b0010; tb_b = 4'b1001; tb_sel = 2'b01; 
        #10;
        tb_a = 4'b0010; tb_b = 4'b0001; tb_sel = 2'b00; 
        #10;
        tb_a = 4'b0001; tb_b = 4'b1000; tb_sel = 2'b11; 
        #10;
        tb_a = 4'b0000; tb_b = 4'b1000; tb_sel = 2'b01; 
        #10;
        tb_a = 4'b0000; tb_b = 4'b0000; tb_sel = 2'b00; 
        #10; 
    
        $finish;
    end

endmodule
