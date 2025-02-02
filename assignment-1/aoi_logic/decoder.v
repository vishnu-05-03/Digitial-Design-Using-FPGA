`include "basic_gates.v"
module decoder_3to8 (
    input [2:0] in,
    input en,
    output [7:0] out
);

    wire [2:0] not_in;
    wire [7:0] temp1, temp2;
    
    // Generate inverted inputs
    not_aoi x_not0(not_in[0], in[0]);
    not_aoi x_not1(not_in[1], in[1]);
    not_aoi x_not2(not_in[2], in[2]);
    
    // Break down AND operations into 2-input gates
    and_aoi x_and0_1(temp1[0], not_in[2], not_in[1]);
    and_aoi x_and0_2(temp2[0], not_in[0], en);
    and_aoi x_and0_3(out[0], temp1[0], temp2[0]);

    and_aoi x_and1_1(temp1[1], not_in[2], not_in[1]);
    and_aoi x_and1_2(temp2[1], in[0], en);
    and_aoi x_and1_3(out[1], temp1[1], temp2[1]);

    and_aoi x_and2_1(temp1[2], not_in[2], in[1]);
    and_aoi x_and2_2(temp2[2], not_in[0], en);
    and_aoi x_and2_3(out[2], temp1[2], temp2[2]);

    and_aoi x_and3_1(temp1[3], not_in[2], in[1]);
    and_aoi x_and3_2(temp2[3], in[0], en);
    and_aoi x_and3_3(out[3], temp1[3], temp2[3]);

    and_aoi x_and4_1(temp1[4], in[2], not_in[1]);
    and_aoi x_and4_2(temp2[4], not_in[0], en);
    and_aoi x_and4_3(out[4], temp1[4], temp2[4]);

    and_aoi x_and5_1(temp1[5], in[2], not_in[1]);
    and_aoi x_and5_2(temp2[5], in[0], en);
    and_aoi x_and5_3(out[5], temp1[5], temp2[5]);

    and_aoi x_and6_1(temp1[6], in[2], in[1]);
    and_aoi x_and6_2(temp2[6], not_in[0], en);
    and_aoi x_and6_3(out[6], temp1[6], temp2[6]);

    and_aoi x_and7_1(temp1[7], in[2], in[1]);
    and_aoi x_and7_2(temp2[7], in[0], en);
    and_aoi x_and7_3(out[7], temp1[7], temp2[7]);

endmodule