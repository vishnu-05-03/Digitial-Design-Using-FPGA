`include "full_subtractor.v"

module parallel_subtractor_4bit
(
    input [3:0] a,
    input [3:0] b,
    input bin,
    output [3:0] d,
    output bout
);

    wire b1, b2, b3;

    full_subtractor fs0(.a(a[0]), .b(b[0]), .bin(bin), .d(d[0]), .bout(b1));
    full_subtractor fs1(.a(a[1]), .b(b[1]), .bin(b1), .d(d[1]), .bout(b2));
    full_subtractor fs2(.a(a[2]), .b(b[2]), .bin(b2), .d(d[2]), .bout(b3));
    full_subtractor fs3(.a(a[3]), .b(b[3]), .bin(b3), .d(d[3]), .bout(bout));

endmodule