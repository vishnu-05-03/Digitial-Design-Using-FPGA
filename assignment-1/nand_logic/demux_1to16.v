`include "demux_1to8.v"

module demux_1to16 (
    input a,
    input [3:0] s,
    output [15:0] y
);
  wire [1:0] op_1to2;
  demux_1to2 demux0 (
      .a(a),
      .s(s[3]),
      .y(op_1to2)
  );
  demux_1to8 demux1 (
      .a(op_1to2[0]),
      .s(s[2:0]),
      .y(y[15:8])
  );
  demux_1to8 demux2 (
      .a(op_1to2[1]),
      .s(s[2:0]),
      .y(y[7:0])
  );
endmodule
