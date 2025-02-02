`include "basic_gates.v"

module mux_2to1 (
    input [1:0] a,
    input sel,
    output y
);
  wire not_sel, or_ip1, or_ip2;
  not_using_nand not1 (
      .a(sel),
      .y(not_sel)
  );
  and_using_nand and1 (
      .a(a[0]),
      .b(not_sel),
      .y(or_ip1)
  );
  and_using_nand and2 (
      .a(a[1]),
      .b(sel),
      .y(or_ip2)
  );
  or_using_nand or1 (
      .a(or_ip1),
      .b(or_ip2),
      .y(y)
  );
endmodule
