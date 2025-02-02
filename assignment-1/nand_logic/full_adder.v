`include "basic_gates.v"

module full_adder (
    input  a,
    input  b,
    input  carry_in,
    output sum,
    output carry_out
);
  wire sum1, carry1, carry2;
  half_adder ha1 (
      .a(a),
      .b(b),
      .sum(sum1),
      .carry(carry1)
  );
  half_adder ha2 (
      .a(sum1),
      .b(carry_in),
      .sum(sum),
      .carry(carry2)
  );
  or_using_nand or1 (
      .a(carry1),
      .b(carry2),
      .y(carry_out)
  );
endmodule
