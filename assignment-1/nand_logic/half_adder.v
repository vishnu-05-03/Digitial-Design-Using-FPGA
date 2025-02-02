`include "basic_gates.v"

module half_adder (
    input  a,
    input  b,
    output sum,
    output carry
);
  xor_using_nand sum_xor (
      .a(a),
      .b(b),
      .y(sum)
  );
  and_using_nand sum_and (
      .a(a),
      .b(b),
      .y(carry)
  );
endmodule

