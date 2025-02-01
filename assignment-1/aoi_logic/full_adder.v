module full_adder (
    output sum, cout,
    input a, b, cin
);

    wire [2:0] w;
    xor_aoi g0 (w[0], a, b);
    xor_aoi g1 (sum, w[0], cin);
    and_aoi g2 (w[1], a, b);
    xor_aoi g3 (w[2], w[1], cin);
    or_aoi g4 (cout, w[1], w[2]);

endmodule