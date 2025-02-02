`include "basic_gates.v"

module demux_1_16(
    input wire in,
    input wire [3:0] sel,
    output wire [15:0] out
);

    wire [3:0] not_sel;
    wire [3:0] temp1, temp2, temp3;

    // Invert selection bits
    not_aoi not0(sel[0], not_sel[0]);
    not_aoi not1(sel[1], not_sel[1]);
    not_aoi not2(sel[2], not_sel[2]);
    not_aoi not3(sel[3], not_sel[3]);

    // First level
    and_aoi and_l1_0(in, not_sel[3], temp1[0]);
    and_aoi and_l1_1(in, sel[3], temp1[1]);

    // Second level
    and_aoi and_l2_0(temp1[0], not_sel[2], temp2[0]);
    and_aoi and_l2_1(temp1[0], sel[2], temp2[1]);
    and_aoi and_l2_2(temp1[1], not_sel[2], temp2[2]);
    and_aoi and_l2_3(temp1[1], sel[2], temp2[3]);

    // Third level
    and_aoi and_l3_0(temp2[0], not_sel[1], temp3[0]);
    and_aoi and_l3_1(temp2[0], sel[1], temp3[1]);
    and_aoi and_l3_2(temp2[1], not_sel[1], temp3[2]);
    and_aoi and_l3_3(temp2[1], sel[1], temp3[3]);
    and_aoi and_l3_4(temp2[2], not_sel[1], temp3[4]);
    and_aoi and_l3_5(temp2[2], sel[1], temp3[5]);
    and_aoi and_l3_6(temp2[3], not_sel[1], temp3[6]);
    and_aoi and_l3_7(temp2[3], sel[1], temp3[7]);

    // Final level
    and_aoi and_l4_0(temp3[0], not_sel[0], out[0]);
    and_aoi and_l4_1(temp3[0], sel[0], out[1]);
    and_aoi and_l4_2(temp3[1], not_sel[0], out[2]);
    and_aoi and_l4_3(temp3[1], sel[0], out[3]);
    and_aoi and_l4_4(temp3[2], not_sel[0], out[4]);
    and_aoi and_l4_5(temp3[2], sel[0], out[5]);
    and_aoi and_l4_6(temp3[3], not_sel[0], out[6]);
    and_aoi and_l4_7(temp3[3], sel[0], out[7]);
    and_aoi and_l4_8(temp3[4], not_sel[0], out[8]);
    and_aoi and_l4_9(temp3[4], sel[0], out[9]);
    and_aoi and_l4_10(temp3[5], not_sel[0], out[10]);
    and_aoi and_l4_11(temp3[5], sel[0], out[11]);
    and_aoi and_l4_12(temp3[6], not_sel[0], out[12]);
    and_aoi and_l4_13(temp3[6], sel[0], out[13]);
    and_aoi and_l4_14(temp3[7], not_sel[0], out[14]);
    and_aoi and_l4_15(temp3[7], sel[0], out[15]);

endmodule