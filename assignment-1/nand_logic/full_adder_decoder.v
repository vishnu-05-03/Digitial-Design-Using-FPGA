`include "decoder_3to8.v"

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

module full_adder_decoder (
    input  a,
    input  b,
    input  carry_in,
    output sum,
    output carry_out
);
  wire [7:0] dec_op;
  decoder_3to8 dec (
      .in ({a, b, carry_in}),
      .en (1),
      .out(dec_op)
  );

  or_4ip or1 (
      .a(dec_op[1]),
      .b(dec_op[2]),
      .c(dec_op[4]),
      .d(dec_op[7]),
      .y(sum)
  );
  or_4ip or2 (
      .a(dec_op[3]),
      .b(dec_op[5]),
      .c(dec_op[6]),
      .d(dec_op[7]),
      .y(carry_out)
  );
endmodule
