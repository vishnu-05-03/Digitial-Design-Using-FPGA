`include "decoder_3to8.v"

module decoder_4to16 (
    input  [ 3:0] in,
    output [15:0] out
);
  wire in3_not;
  not_using_nand not1 (
      .a(in[3]),
      .y(in3_not)
  );

  wire [7:0] dec1_op;
  decoder_3to8 dec1 (
      .in (in[2:0]),
      .en (in3_not),
      .out(out[15:8])
  );
  decoder_3to8 dec2 (
      .in (in[2:0]),
      .en (in[3]),
      .out(out[7:0])
  );
endmodule
