`include "basic_gates.v"

module half_subtractor (
    input  a,
    input  b,
    output difference,
    output borrow
);
  wire a_not;
  xor_using_nand diff (
      .a(a),
      .b(b),
      .y(difference)
  );
  not_using_nand not_a (
      .a(a),
      .y(a_not)
  );
  and_using_nand brw (
      .a(a_not),
      .b(b),
      .y(borrow)
  );
endmodule
