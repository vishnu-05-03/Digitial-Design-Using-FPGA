`include "basic_gates.v"

module bcd_to_binary(
    input [3:0] bcd_in,
    output [3:0] binary_out
);

    wire not_b3, not_b2, not_b1, not_b0;
    wire and1, and2, and3, and4;
    wire or1, or2;

    // Inverters
    not_aoi n1(not_b3, bcd_in[3]);
    not_aoi n2(not_b2, bcd_in[2]);
    not_aoi n3(not_b1, bcd_in[1]);
    not_aoi n4(not_b0, bcd_in[0]);

    // Binary output for each position
    // binary[0] = bcd[0]
    assign binary_out[0] = bcd_in[0];

    // binary[1] = bcd[1]
    assign binary_out[1] = bcd_in[1];

    // binary[2] = bcd[2] XOR (bcd[3] AND bcd[1])
    and_aoi a1(and1, bcd_in[3], bcd_in[1]);
    xor_aoi x1(binary_out[2], bcd_in[2], and1);

    // binary[3] = bcd[3] AND (bcd[2] OR bcd[1])
    or_aoi o1(or1, bcd_in[2], bcd_in[1]);
    and_aoi a2(binary_out[3], bcd_in[3], or1);

endmodule