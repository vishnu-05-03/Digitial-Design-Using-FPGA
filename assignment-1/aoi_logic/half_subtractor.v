`include "basic_gates.v"
module half_subtractor(
    input  a,
    input  b,
    output difference,
    output borrow
);
    wire not_a;
    not_aoi g0 (not_a, a);        
    and_aoi g1 (borrow, not_a, b);
    xor_aoi g2 (difference, a, b);
endmodule