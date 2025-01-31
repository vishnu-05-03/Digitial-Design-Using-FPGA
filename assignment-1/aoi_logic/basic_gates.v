module aoi (
    output out,
    input a, b, c
);
    wire w;

    and (w, a, b);
    nor (out, w, c);
endmodule

module not_aoi (
    output out,
    input in
);
    aoi g0 (out, 1'b0, 1'b0, in);
endmodule

module nand_aoi (
    output out,
    input a, b
);
    aoi g0 (out, a, b, 1'b0);
endmodule

module and_aoi (
    output out,
    input a, b
);
    wire w1;
    nand_aoi g0 (w1, a, b);
    not_aoi g1 (out, w1);
endmodule

module nor_aoi (
    output out,
    input a, b
);
    aoi g0 (out, a, 1'b1, b);
endmodule

module or_aoi (
    output out,
    input a, b
);
    wire w1;
    nor_aoi g0 (w1, a, b);
    not_aoi g1 (out, w1);
endmodule

module xnor_aoi (
    output out,
    input a, b
);
    wire [3:0] w;
    not (w[0], a);
    not (w[1], b);
    or (w[2], w[1], a);
    or (w[3], w[0], b);
    and (out, w[2], w[3]);
endmodule

module xor_aoi (
    output out,
    input a, b
);
    wire w;
    xnor_aoi g0 (w, a, b);
    not_aoi g1 (out, w);
endmodule
