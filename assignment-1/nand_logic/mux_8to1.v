`include "mux_4to1.v"

module mux_8to1 (
    input [7:0] a,
    input [2:0] sel,
    output y
);
  wire mux1_op, mux2_op;
  mux_4to1 mux1 (
      .a  (a[7:4]),
      .sel(sel[1:0]),
      .y  (mux1_op)
  );
  mux_4to1 mux2 (
      .a  (a[3:0]),
      .sel(sel[1:0]),
      .y  (mux2_op)
  );
  mux_2to1 mux3 (
      .a  ({mux1_op, mux2_op}),
      .sel(sel[2]),
      .y  (y)
  );
endmodule
