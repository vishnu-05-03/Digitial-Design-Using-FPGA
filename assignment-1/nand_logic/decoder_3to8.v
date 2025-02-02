`include "basic_gates.v"

module and_4ip (
    input  a,
    input  b,
    input  c,
    input  d,
    output y
);
  wire and_ab, and_cd;
  and_using_nand and1 (
      .a(a),
      .b(b),
      .y(and_ab)
  );
  and_using_nand and2 (
      .a(c),
      .b(d),
      .y(and_cd)
  );
  and_using_nand and3 (
      .a(and_ab),
      .b(and_cd),
      .y(y)
  );
endmodule

module decoder_3to8 (
    input [2:0] in,
    input en,
    output [7:0] out
);
  wire in0_not, in1_not, in2_not;
  not_using_nand not1 (
      .a(in[0]),
      .y(in0_not)
  );
  not_using_nand not2 (
      .a(in[1]),
      .y(in1_not)
  );
  not_using_nand not3 (
      .a(in[2]),
      .y(in2_not)
  );

  and_3ip and1 (
      .a(in0_not),
      .b(in1_not),
      .c(in2_not),
      .d(en),
      .y(out[0])
  );
  and_3ip and2 (
      .a(in[0]),
      .b(in1_not),
      .c(in2_not),
      .d(en),
      .y(out[1])
  );
  and_3ip and3 (
      .a(in0_not),
      .b(in[1]),
      .c(in2_not),
      .d(en),
      .y(out[2])
  );
  and_3ip and4 (
      .a(in[0]),
      .b(in[1]),
      .c(in2_not),
      .d(en),
      .y(out[3])
  );
  and_3ip and5 (
      .a(in0_not),
      .b(in1_not),
      .c(in[2]),
      .d(en),
      .y(out[4])
  );
  and_3ip and6 (
      .a(in[0]),
      .b(in1_not),
      .c(in[2]),
      .d(en),
      .y(out[5])
  );
  and_3ip and7 (
      .a(in0_not),
      .b(in[1]),
      .c(in[2]),
      .d(en),
      .y(out[6])
  );
  and_3ip and8 (
      .a(in[0]),
      .b(in[1]),
      .c(in[2]),
      .d(en),
      .y(out[7])
  );
endmodule
