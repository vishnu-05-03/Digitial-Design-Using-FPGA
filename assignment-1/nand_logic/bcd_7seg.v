`include "basic_gates.v"

module or_4ip (
    input  a,
    input  b,
    input  c,
    input  d,
    output y
);
  wire or_ab, or_cd;
  or_using_nand or1 (
      .a(a),
      .b(b),
      .y(or_ab)
  );
  or_using_nand or2 (
      .a(c),
      .b(d),
      .y(or_cd)
  );
  or_using_nand or3 (
      .a(or_ab),
      .b(or_cd),
      .y(y)
  );
endmodule

module bcd_7seg (
    input  [3:0] bcd,
    output [6:0] seg
);
  wire [3:0] bcd_not;
  not_using_nand not1 (
      .a(bcd[3]),
      .y(bcd_not[3])
  );
  not_using_nand not2 (
      .a(bcd[2]),
      .y(bcd_not[2])
  );
  not_using_nand not3 (
      .a(bcd[1]),
      .y(bcd_not[1])
  );
  not_using_nand not4 (
      .a(bcd[0]),
      .y(bcd_not[0])
  );

  wire and_2_0, and_2not_0not;
  and_using_nand and1 (
      .a(bcd[2]),
      .b(bcd[0]),
      .y(and_2_0)
  );
  and_using_nand and2 (
      .a(bcd_not[2]),
      .b(bcd_not[0]),
      .y(and_2not_0not)
  );
  or_4ip or1 (
      .a(bcd[3]),
      .b(bcd[1]),
      .c(and_2_0),
      .d(and_2not_0not),
      .y(seg[0])
  );

  wire and_1_0, and_1not_0not;
  and_using_nand and3 (
      .a(bcd[1]),
      .b(bcd[0]),
      .y(and_1_0)
  );
  and_using_nand and4 (
      .a(bcd_not[1]),
      .b(bcd_not[0]),
      .y(and_1not_0not)
  );
  or_4ip or2 (
      .a(bcd_not[2]),
      .b(and_1_0),
      .c(and_1not_0not),
      .d(0),
      .y(seg[1])
  );

  or_4ip or3 (
      .a(bcd[2]),
      .b(bcd_not[1]),
      .c(bcd[0]),
      .d(0),
      .y(seg[2])
  );

  wire and_1_0not, and_2_1not, and_2_1not_0, and_2not_1;
  and_using_nand and5 (
      .a(bcd[1]),
      .b(bcd_not[0]),
      .y(and_1_0not)
  );
  and_using_nand and6 (
      .a(bcd[2]),
      .b(bcd_not[1]),
      .y(and_2_1not)
  );
  and_using_nand and7 (
      .a(and_2_1not),
      .b(bcd[0]),
      .y(and_2_1not_0)
  );
  and_using_nand and8 (
      .a(bcd_not[2]),
      .b(bcd[1]),
      .y(and_2not_1)
  );
  wire or_seg3_1;
  or_4ip or4 (
      .a(and_2not_0not),
      .b(and_1_0not),
      .c(and_2_1not_0),
      .d(and_2not_1),
      .y(or_seg3_1)
  );
  or_using_nand or5 (
      .a(or_seg3_1),
      .b(bcd[3]),
      .y(seg[3])
  );

  or_4ip or6 (
      .a(and_2not_0not),
      .b(and_1_0not),
      .c(0),
      .d(0),
      .y(seg[4])
  );

  wire and_2_0not;
  and_using_nand and9 (
      .a(bcd[2]),
      .b(bcd_not[0]),
      .y(and_2_0not)
  );
  or_4ip or7 (
      .a(bcd[3]),
      .b(and_1not_0not),
      .c(and_2_1not),
      .d(and_2_0not),
      .y(seg[5])
  );

  or_4ip or8 (
      .a(bcd[3]),
      .b(and_2_1not),
      .c(and_2not_1),
      .d(and_1_0not),
      .y(seg[6])
  );
endmodule
