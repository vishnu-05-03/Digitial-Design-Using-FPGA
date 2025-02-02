`include "mux_8to1.v"

module mux_16to1 (
    input [15:0] a,
    input [3:0] sel,
    output y
);
  wire mux1_op, mux2_op;
  mux_8to1 mux1 (
      .a  (a[15:8]),
      .sel(sel[2:0]),
      .y  (mux1_op)
  );
  mux_8to1 mux2 (
      .a  (a[7:0]),
      .sel(sel[2:0]),
      .y  (mux2_op)
  );
  mux_2to1 mux3 (
      .a  ({mux1_op, mux2_op}),
      .sel(sel[3]),
      .y  (y)
  );
endmodule
