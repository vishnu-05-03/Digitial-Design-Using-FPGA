module and_using_nand (
    input  a,
    input  b,
    output y
);
  wire nand_out;
  nand (nand_out, a, b);
  nand (y, nand_out, nand_out);
endmodule

module or_using_nand (
    input  a,
    input  b,
    output y
);
  wire nand_out1, nand_out2;
  nand (nand_out1, a, a);
  nand (nand_out2, b, b);
  nand (y, nand_out1, nand_out2);
endmodule

module not_using_nand (
    input  a,
    output y
);
  nand (y, a, a);
endmodule

module xor_using_nand (
    input  a,
    input  b,
    output y
);
  wire a_not, b_not, a_b_not, a_not_b;
  not_using_nand not_a (
      .a(a),
      .y(a_not)
  );
  not_using_nand not_b (
      .a(b),
      .y(b_not)
  );
  nand (a_b_not, a, b_not);
  nand (a_not_b, a_not, b);
  nand (y, a_b_not, a_not_b);
endmodule

module xnor_using_nand (
    input  a,
    input  b,
    output y
);
  wire a_not, b_not, a_b, a_not_b_not;
  nand (a_b, a, b);
  not_using_nand not_a (
      .a(a),
      .y(a_not)
  );
  not_using_nand not_b (
      .a(b),
      .y(b_not)
  );
  nand (a_not_b_not, a_not, b_not);
  nand (y, a_b, a_not_b_not);
endmodule
