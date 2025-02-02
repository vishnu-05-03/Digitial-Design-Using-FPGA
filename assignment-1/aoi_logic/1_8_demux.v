`include "basic_gates.v"

module demux1_8(
    input wire in,
    input wire [2:0] sel,
    output wire [7:0] out
);

    wire [2:0] sel_n;
    
    not_aoi n0(sel_n[0], sel[0]);
    not_aoi n1(sel_n[1], sel[1]);
    not_aoi n2(sel_n[2], sel[2]);

    and_aoi a0(out[0], in, sel_n[2], sel_n[1], sel_n[0]);
    and_aoi a1(out[1], in, sel_n[2], sel_n[1], sel[0]);
    and_aoi a2(out[2], in, sel_n[2], sel[1], sel_n[0]);
    and_aoi a3(out[3], in, sel_n[2], sel[1], sel[0]);
    and_aoi a4(out[4], in, sel[2], sel_n[1], sel_n[0]);
    and_aoi a5(out[5], in, sel[2], sel_n[1], sel[0]);
    and_aoi a6(out[6], in, sel[2], sel[1], sel_n[0]);
    and_aoi a7(out[7], in, sel[2], sel[1], sel[0]);

endmodule