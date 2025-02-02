`include "basic_gates.v"
module binary_to_bcd(
    input [3:0] bin,
    output [3:0] bcd
);

    wire w1, w2, w3, w4, w5, w6, w7, w8, w9, w10;
    wire nbin0, nbin1, nbin2;
    not_aoi x_n0(nbin0, bin[0]);
    not_aoi x_n1(nbin1, bin[1]);
    not_aoi x_n2(nbin2, bin[2]);

    // BCD[3] = bin[3] AND (bin[2] OR bin[1])
    or_aoi x_or1(w1, bin[2], bin[1]);
    and_aoi x_and2(bcd[3], bin[3], w1);

    // BCD[2] = bin[2] XOR bin[1]
    wire w11, w12;
    and_aoi x_and3(w11, bin[2], nbin1);
    and_aoi x_and4(w12, nbin2, bin[1]);
    or_aoi  x_or5(bcd[2], w11, w12);

    // BCD[1] = bin[1] XOR bin[0]
    wire w13, w14;
    and_aoi x_and6(w13, bin[1], nbin0);
    and_aoi x_and7(w14, nbin1, bin[0]);
    or_aoi  x_or8(bcd[1], w13, w14);

    // BCD[0] = bin[0]
    assign bcd[0] = bin[0];

endmodule