`include "basic_gates.v"

module full_subtractor (
    input  a,
    input  b,
    input  borrow_in,
    output difference,
    output borrow_out
);
  wire diff1, brw1, brw2;
  half_subtractor hs1 (
      .a(a),
      .b(b),
      .difference(diff1),
      .borrow(brw1)
  );
  half_subtractor hs2 (
      .a(diff1),
      .b(borrow_in),
      .difference(difference),
      .borrow(brw2)
  );
  or_using_nand or1 (
      .a(brw1),
      .b(brw2),
      .y(borrow_out)
  );
endmodule
