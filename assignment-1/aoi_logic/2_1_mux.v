`include "basic_gates.v"

module mux_2_1(
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);

    wire sel_n;
    wire and1_out;
    wire and2_out;

    not_aoi not1(sel_n, sel);
    and_aoi and1(and1_out, a, sel_n);
    and_aoi and2(and2_out, b, sel);
    or_aoi or1(y, and1_out, and2_out);

endmodule