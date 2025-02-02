`include "basic_gates.v"
module full_subtractor
(
    input  a,
    input  b,
    input  bin,
    output d,
    output bout
);

    wire x1, w1, w2, w3;

    xor_aoi x_xor1(x1, a, b);
    xor_aoi x_xor2(d, x1, bin);

    not_aoi x_not1(w1, a);

    and_aoi x_and1(w2, w1, b);
    and_aoi x_and2(w3, w1, bin);
    and_aoi x_and3(x1, b, bin);

    or_aoi x_or1(bout, w2, w3, x1);

endmodule