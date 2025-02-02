`include "basic_gates.v"
module binary_to_7segments(
    input [3:0] bin_in,
    output a, b, c, d, e, f, g
);

    wire [3:0] not_in;
    wire [15:0] and_wire;
    wire [6:0] or_wire1, or_wire2, or_wire3, or_wire4;

    // Inverters for inputs
    not_aoi x_not1(not_in[0], bin_in[0]);
    not_aoi x_not2(not_in[1], bin_in[1]);
    not_aoi x_not3(not_in[2], bin_in[2]);
    not_aoi x_not4(not_in[3], bin_in[3]);

    // Segment a
    and_aoi x_and1(and_wire[0], not_in[3], bin_in[2]);
    and_aoi x_and2(and_wire[1], bin_in[1], bin_in[0]);
    and_aoi x_and3(and_wire[2], not_in[2], not_in[1]);
    and_aoi x_and4(and_wire[3], bin_in[3], not_in[2]);
    or_aoi x_or1(or_wire1[0], and_wire[0], and_wire[1]);
    or_aoi x_or2(or_wire1[1], and_wire[2], and_wire[3]);
    or_aoi x_or3(a, or_wire1[0], or_wire1[1]);

    // Segment b
    and_aoi x_and5(and_wire[4], bin_in[2], bin_in[1]);
    and_aoi x_and6(and_wire[5], bin_in[2], bin_in[0]);
    and_aoi x_and7(and_wire[6], bin_in[1], not_in[0]);
    or_aoi x_or4(or_wire2[0], and_wire[4], and_wire[5]);
    or_aoi x_or5(b, or_wire2[0], and_wire[6]);

    // Segment c
    and_aoi x_and8(and_wire[7], not_in[2], bin_in[1]);
    and_aoi x_and9(and_wire[8], not_in[0], bin_in[1]);
    or_aoi x_or6(c, and_wire[7], and_wire[8]);

    // Segment d
    and_aoi x_and10(and_wire[9], not_in[3], not_in[2]);
    and_aoi x_and11(and_wire[10], not_in[3], bin_in[1]);
    and_aoi x_and12(and_wire[11], bin_in[2], not_in[1]);
    and_aoi x_and13(and_wire[12], bin_in[2], bin_in[0]);
    or_aoi x_or7(or_wire3[0], and_wire[9], and_wire[10]);
    or_aoi x_or8(or_wire3[1], and_wire[11], and_wire[12]);
    or_aoi x_or9(d, or_wire3[0], or_wire3[1]);

    // Segment e
    and_aoi x_and14(and_wire[13], not_in[1], not_in[0]);
    and_aoi x_and15(and_wire[14], bin_in[2], not_in[1]);
    or_aoi x_or10(e, and_wire[13], and_wire[14]);

    // Segment f
    and_aoi x_and16(and_wire[15], not_in[2], not_in[1]);
    and_aoi x_and17(or_wire4[0], not_in[3], not_in[0]);
    and_aoi x_and18(or_wire4[1], bin_in[1], not_in[0]);
    or_aoi x_or11(or_wire4[2], and_wire[15], or_wire4[0]);
    or_aoi x_or12(f, or_wire4[2], or_wire4[1]);

    // Segment g
    and_aoi x_and19(or_wire4[3], not_in[3], not_in[2]);
    and_aoi x_and20(or_wire4[4], bin_in[2], bin_in[1]);
    and_aoi x_and21(or_wire4[5], not_in[1], not_in[0]);
    or_aoi x_or13(or_wire4[6], or_wire4[3], or_wire4[4]);
    or_aoi x_or14(g, or_wire4[6], or_wire4[5]);

endmodule