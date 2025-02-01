module half_adder (
    output sum, cout,
    input a, b
);

    xor_aoi g0 (sum, a, b);
    and_aoi g1 (cout, a, b);
    
endmodule