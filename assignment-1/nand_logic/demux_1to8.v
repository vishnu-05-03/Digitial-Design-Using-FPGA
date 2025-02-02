`include "demux_1to4.v"

module demux_1to2 (
    input a,
    input s,
    output [1:0] y
);
  wire not_s;
  not_using_nand not0 (
      .a(s),
      .y(not_s)
  );

  and_using_nand and0 (
      .a(a),
      .b(not_s),
      .y(y[0])
  );
  and_using_nand and1 (
      .a(a),
      .b(s),
      .y(y[1])
  );
endmodule

module demux_1to8 (
    input a,
    input [2:0] s,
    output [7:0] y
);
  wire [1:0] op_1to2;
  demux_1to2 demux0 (
      .a(a),
      .s(s[2]),
      .y(op_1to2)
  );
  demux_1to4 demux1 (
      .a(op_1to2[0]),
      .s(s[1:0]),
      .y(y[7:4])
  );
  demux_1to4 demux2 (
      .a(op_1to2[1]),
      .s(s[1:0]),
      .y(y[3:0])
  );
endmodule
