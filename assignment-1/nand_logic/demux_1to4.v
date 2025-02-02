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

module demux_1to4 (
    input a,
    input [1:0] s,
    output [3:0] y
);
  wire [1:0] not_s;
  not_using_nand not0 (
      .a(s[0]),
      .y(not_s[0])
  );
  not_using_nand not1 (
      .a(s[1]),
      .y(not_s[1])
  );

  and_3ip and0 (
      .a(a),
      .b(not_s[1]),
      .c(not_s[0]),
      .y(y[0])
  );
  and_3ip and1 (
      .a(a),
      .b(not_s[1]),
      .c(s[0]),
      .y(y[1])
  );
  and_3ip and2 (
      .a(a),
      .b(s[1]),
      .c(not_s[0]),
      .y(y[2])
  );
  and_3ip and3 (
      .a(a),
      .b(s[1]),
      .c(s[0]),
      .y(y[3])
  );
endmodule
