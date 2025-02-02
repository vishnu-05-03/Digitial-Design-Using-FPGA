`include "full_subtractor.v"

module subtractor_4bit (
    input [3:0] a,
    input [3:0] b,
    input borrow_in,
    output [3:0] difference,
    output borrow_out
);
  wire b0, b1, b2, b3;
  full_subtractor fs1 (
      .a(a[0]),
      .b(b[0]),
      .borrow_in(borrow_in),
      .difference(difference[0]),
      .borrow_out(b0)
  );
  full_subtractor fs2 (
      .a(a[1]),
      .b(b[1]),
      .borrow_in(b0),
      .difference(difference[1]),
      .borrow_out(b1)
  );
  full_subtractor fs3 (
      .a(a[2]),
      .b(b[2]),
      .borrow_in(b1),
      .difference(difference[2]),
      .borrow_out(b2)
  );
  full_subtractor fs4 (
      .a(a[3]),
      .b(b[3]),
      .borrow_in(b2),
      .difference(difference[3]),
      .borrow_out(borrow_out)
  );
endmodule
