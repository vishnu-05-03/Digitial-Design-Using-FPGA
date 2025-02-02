`include "basic_gates.v"
module encoder_8to3(
    input [7:0] in,
    output [2:0] out
);

    wire w2_a, w2_b, w1_a, w1_b, w0_a, w0_b;

    or_aoi or2_2a(w2_a, in[4], in[5]);
    or_aoi or2_2b(w2_b, in[6], in[7]);
    or_aoi or2_2c(out[2], w2_a, w2_b);

    or_aoi or2_1a(w1_a, in[2], in[3]);
    or_aoi or2_1b(w1_b, in[6], in[7]);
    or_aoi or2_1c(out[1], w1_a, w1_b);

    or_aoi or2_0a(w0_a, in[1], in[3]);
    or_aoi or2_0b(w0_b, in[5], in[7]);
    or_aoi or2_0c(out[0], w0_a, w0_b);

endmodule