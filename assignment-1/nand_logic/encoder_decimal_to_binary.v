`include "basic_gates.v"

module encoder_decimal_to_binary (
    input  [8:0] in,
    output [3:0] out
);
  wire or_65, or_654, or_21, or_86, or_864, or_8642;

  or_using_nand or1 (
      .a(in[8]),
      .b(in[7]),
      .y(out[3])
  );

  or_using_nand or2 (
      .a(in[6]),
      .b(in[5]),
      .y(or_65)
  );
  or_using_nand or3 (
      .a(or_65),
      .b(in[4]),
      .y(or_654)
  );
  or_using_nand or4 (
      .a(or_654),
      .b(in[3]),
      .y(out[2])
  );

  or_using_nand or5 (
      .a(in[2]),
      .b(in[1]),
      .y(or_21)
  );
  or_using_nand or6 (
      .a(or_21),
      .b(or_65),
      .y(out[1])
  );

  or_using_nand or7 (
      .a(in[8]),
      .b(in[6]),
      .y(or_86)
  );
  or_using_nand or8 (
      .a(or_86),
      .b(in[4]),
      .y(or_864)
  );
  or_using_nand or9 (
      .a(or_864),
      .b(in[2]),
      .y(or_8642)
  );
  or_using_nand or10 (
      .a(or_8642),
      .b(in[0]),
      .y(out[0])
  );
endmodule
