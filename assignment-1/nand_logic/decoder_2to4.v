`include "basic_gates.v"

module nand_3ip (
    input  a,
    input  b,
    input  c,
    output y
);
  wire ab, ab_not;
  nand (ab_not, a, b);
  nand (ab, ab_not, ab_not);
  nand (y, ab, c);
endmodule

module decoder_2to4 (
    input [1:0] a,
    input en,
    output [3:0] y
);
  wire a1_not, a0_not, en_not;
  not_using_nand not1 (
      .a(a[0]),
      .y(a0_not)
  );
  not_using_nand not2 (
      .a(a[1]),
      .y(a1_not)
  );
  not_using_nand not3 (
      .a(en),
      .y(en_not)
  );

  nand_3ip nand1 (
      .a(a0_not),
      .b(a1_not),
      .c(en_not),
      .y(y[0])
  );
  nand_3ip nand2 (
      .a(a[0]),
      .b(a1_not),
      .c(en_not),
      .y(y[1])
  );
  nand_3ip nand3 (
      .a(a0_not),
      .b(a[1]),
      .c(en_not),
      .y(y[2])
  );
  nand_3ip nand4 (
      .a(a[0]),
      .b(a[1]),
      .c(en_not),
      .y(y[3])
  );
endmodule
