`include "mux_2to1.v"

module mux_4to1 (
    input [3:0] a,
    input [1:0] sel,
    output y
);
  wire mux1_op, mux2_op;
  mux_2to1 mux1 (
      .a  (a[3:2]),
      .sel(sel[0]),
      .y  (mux1_op)
  );
  mux_2to1 mux2 (
      .a  (a[1:0]),
      .sel(sel[0]),
      .y  (mux2_op)
  );
  mux_2to1 mux3 (
      .a  ({mux1_op, mux2_op}),
      .sel(sel[1]),
      .y  (y)
  );
endmodule
