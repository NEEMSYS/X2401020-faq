`timescale 1ns / 1ps

module testbench;
    reg d0, d1, bi_reg, bi_dir_oe;
    wire sel;
    wire out;

    assign sel = bi_dir_oe ? bi_reg : 1'bz; 
    initial begin
        bi_reg = 1'b1;
        bi_dir_oe = 1'b1;
        d0 = 1'b0;
        d1 = 1'b0;
        #100
        bi_dir_oe = 1'b1;
        //sel = 1'b1;
        #100 
        d0 = 1'b0;
        d1 = 1'b0;
        bi_reg = 1'b0;
        //sel = 1'b0;
        #100
        bi_dir_oe = 1'b0; 
        d0 = 1'b1;
        d1 = 1'b1;
        #100
        d0 = 1'b1;
        d1 = 1'b0; 
        #100 $finish;
    end

    mux21topv u1(d0, d1, sel, out);

endmodule
