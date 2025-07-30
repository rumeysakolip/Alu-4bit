`timescale 1ns / 1ps

module top_alu_4bit(
    input [3:0] a, b,
    input [1:0] sel,
    output [7:0] out, kare,
    output [4:0] toplam, fark, 
    output [2:0] karsilastirma 
);

  // toplayici ara teller
    wire c0,c1,c2;
    // cikarici için ara tel
    wire b0,b1,b2;

    wire [4:0] toplam_sonuc;
    wire [4:0] fark_sonuc;
    wire [7:0] kare_alici_sonuc;
    wire [2:0] karsilastirma_sonuc;

    wire [4:0] w1;
    wire [7:0] w2;

    tam_toplama_4bit s_0(
        .a(a[0]), 
        .b(b[0]),
        .cin(0),  
        .s(toplam_sonuc[0]), 
        .cout(c0));
        
    tam_toplama_4bit s_1(
        .a(a[1]), 
        .b(b[1]), 
        .cin(c0),
        .s(toplam_sonuc[1]), 
        .cout(c1));
        
    tam_toplama_4bit s_2(
        .a(a[2]), 
        .b(b[2]), 
        .cin(c1),
        .s(toplam_sonuc[2]), 
        .cout(c2));
    
    tam_toplama_4bit s_3(
        .a(a[3]), 
        .b(b[3]), 
        .cin(c2),
        .s(toplam_sonuc[3]), 
        .cout(toplam_sonuc[4]));

    assign toplam = toplam_sonuc[4:0];
    
    tam_cikarma_4bit d_0(
        .a(a[0]), 
        .b(b[0]),
        .bin(0),
        .d(fark_sonuc[0]), 
        .bout(b0));
        
    tam_cikarma_4bit d_1(
        .a(a[1]), 
        .b(b[1]),
        .bin(b0), 
        .d(fark_sonuc[1]), 
        .bout(b1));
        
    tam_cikarma_4bit d_2(
        .a(a[2]), 
        .b(b[2]), 
        .bin(b1),
        .d(fark_sonuc[2]), 
        .bout(b2));
        
    tam_cikarma_4bit d_3(
        .a(a[3]), 
        .b(b[3]),
        .bin(b2),  
        .d(fark_sonuc[3]), 
        .bout(fark_sonuc[4]));
    
    assign fark = fark_sonuc[4:0]; 
    
    karsilastirici_4bit comp(
        .a(a),
        .b(b),
        .esit(karsilastirma_sonuc[2]),
        .buyuk(karsilastirma_sonuc[1]),
        .kucuk(karsilastirma_sonuc[0])
    );
    
    assign karsilastirma = karsilastirma_sonuc;
    
    kare_alici_4bit sq(
        .a(a),
        .f(kare_alici_sonuc)
    );
    
    assign kare = kare_alici_sonuc;
    
    // 1. Seçim (w1: Toplama veya Çıkarma)
    mux2x1 mux_w1_0(
        .a(toplam_sonuc[0]), 
        .b(fark_sonuc[0]), 
        .sel(sel[0]), 
        .f(w1[0]));
        
    mux2x1 mux_w1_1(
        .a(toplam_sonuc[1]), 
        .b(fark_sonuc[1]), 
        .sel(sel[0]), 
        .f(w1[1]));
        
    mux2x1 mux_w1_2(
        .a(toplam_sonuc[2]), 
        .b(fark_sonuc[2]), 
        .sel(sel[0]), 
        .f(w1[2]));
        
    mux2x1 mux_w1_3(
        .a(toplam_sonuc[3]), 
        .b(fark_sonuc[3]), 
        .sel(sel[0]), 
        .f(w1[3]));
        
    mux2x1 mux_w1_4(
        .a(toplam_sonuc[4]), 
        .b(fark_sonuc[4]), 
        .sel(sel[0]), 
        .f(w1[4]));

    mux2x1 mux_w2_0(
        .a(kare_alici_sonuc[0]), 
        .b(karsilastirma_sonuc[0]), 
        .sel(sel[0]), 
        .f(w2[0]));
        
    mux2x1 mux_w2_1(
        .a(kare_alici_sonuc[1]), 
        .b(karsilastirma_sonuc[1]), 
        .sel(sel[0]), 
        .f(w2[1]));
        
    mux2x1 mux_w2_2(
        .a(kare_alici_sonuc[2]), 
        .b(karsilastirma_sonuc[2]), 
        .sel(sel[0]), 
        .f(w2[2]));
        
    mux2x1 mux_w2_3(
        .a(kare_alici_sonuc[3]), 
        .b(1'b0), 
        .sel(sel[0]), 
        .f(w2[3]));
        
    mux2x1 mux_w2_4(
        .a(kare_alici_sonuc[4]), 
        .b(1'b0), 
        .sel(sel[0]), 
        .f(w2[4]));
        
    mux2x1 mux_w2_5(
        .a(kare_alici_sonuc[5]), 
        .b(1'b0), 
        .sel(sel[0]), 
        .f(w2[5]));
        
    mux2x1 mux_w2_6(
        .a(kare_alici_sonuc[6]), 
        .b(1'b0), 
        .sel(sel[0]), 
        .f(w2[6]));
    mux2x1 mux_w2_7(
        .a(kare_alici_sonuc[7]),
        .b(1'b0),
        .sel(sel[0]), 
        .f(w2[7]));

    // 2. Seçim (out: w1 veya w2)
    mux2x1 mux_out_0(
        .a(w1[0]), 
        .b(w2[0]), 
        .sel(sel[1]), 
        .f(out[0]));
        
    mux2x1 mux_out_1(
        .a(w1[1]), 
        .b(w2[1]), 
        .sel(sel[1]), 
        .f(out[1]));
        
    mux2x1 mux_out_2(
        .a(w1[2]), 
        .b(w2[2]), 
        .sel(sel[1]), 
        .f(out[2]));
        
    mux2x1 mux_out_3(
        .a(w1[3]), 
        .b(w2[3]), 
        .sel(sel[1]), 
        .f(out[3]));
        
    mux2x1 mux_out_4(
        .a(w1[4]), 
        .b(w2[4]), 
        .sel(sel[1]), 
        .f(out[4]));
        
    mux2x1 mux_out_5(
        .a(1'b0), 
        .b(w2[5]), 
        .sel(sel[1]), 
        .f(out[5]));
        
    mux2x1 mux_out_6(
        .a(1'b0), 
        .b(w2[6]), 
        .sel(sel[1]), 
        .f(out[6]));
    
    mux2x1 mux_out_7(
        .a(1'b0), 
        .b(w2[7]), 
        .sel(sel[1]), 
        .f(out[7]));

endmodule
