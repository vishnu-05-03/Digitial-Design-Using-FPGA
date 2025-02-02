`include "basic_gates.v"

module and_3ip (
    input  a,
    input  b,
    input  c,
    output y
);
  wire ab;
  and_using_nand and0 (
      .a(a),
      .b(b),
      .y(ab)
  );
  and_using_nand and1 (
      .a(ab),
      .b(c),
      .y(y)
  );
endmodule

module bin_to_bcd (
    input  [3:0] bin,
    output [4:0] bcd
);
  wire and_3_1, and_3_2;
  and_using_nand and0 (
      .a(bin[3]),
      .b(bin[1]),
      .y(and_3_1)
  );
  and_using_nand and1 (
      .a(bin[3]),
      .b(bin[2]),
      .y(and_3_2)
  );
  or_using_nand or0 (
      .a(and_3_1),
      .b(and_3_2),
      .y(bcd[4])
  );

  wire not_3, not_2, not_1;
  not_using_nand not2 (
      .a(bin[3]),
      .y(not_3)
  );
  not_using_nand not0 (
      .a(bin[2]),
      .y(not_2)
  );
  not_using_nand not1 (
      .a(bin[1]),
      .y(not_1)
  );
  and_3ip and2 (
      .a(bin[3]),
      .b(not_2),
      .c(not_1),
      .y(bcd[3])
  );

  wire and_3not_2, and_2_1;
  and_using_nand and3 (
      .a(not_3),
      .b(bin[2]),
      .y(bcd[2])
  );
  and_using_nand and4 (
      .a(bin[2]),
      .b(bin[1]),
      .y(and_2_1)
  );
  or_using_nand or1 (
      .a(and_3not_2),
      .b(and_2_1),
      .y(bcd[2])
  );

  wire and_3not_1, and_3_2_1not;
  and_using_nand and5 (
      .a(not_3),
      .b(bin[1]),
      .y(and_3not_1)
  );
  and_3ip and6 (
      .a(bin[3]),
      .b(bin[2]),
      .c(not_1),
      .y(and_3_2_1not)
  );
  or_using_nand or2 (
      .a(and_3not_1),
      .b(and_3_2_1not),
      .y(bcd[1])
  );

  assign bcd[0] = bin[0];
endmodule
