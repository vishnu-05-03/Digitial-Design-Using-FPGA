module half_adder_nand(
    input  a,
    input  b,
    output sum,
    output cout
);
    wire x1, x2, x3;

    // XOR using NAND gates
    nand(x1, a, b);      // x1 = ~(a & b)
    nand(x2, a, x1);     // x2 = ~(a & ~(a & b))
    nand(x3, b, x1);     // x3 = ~(b & ~(a & b))
    nand(sum, x2, x3);   // sum = a ^ b

    // Carry (a & b) using NAND gates
    nand(cout, x1, x1);  // cout = ~(~(a & b) & ~(a & b)) = a & b
endmodule

module half_adder_nor(
    input  a,
    input  b,
    output sum,
    output cout
);
    wire[2:0] w;

    nor (w[0], a, a);
    nor (w[1], b, b);
    nor (cout, w[0], w[1]);
    nor (w[2], a, b);
    nor (sum, w[2], cout);
endmodule