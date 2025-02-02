`include "basic_gates.v"

module demux_1_4(input in, s1, s0, output y3, y2, y1, y0);
    wire s1_bar, s0_bar;
    
    not_aoi not1(s1_bar, s1);
    not_aoi not2(s0_bar, s0);
    
    and_aoi and1(y0, in, s1_bar, s0_bar);
    and_aoi and2(y1, in, s1_bar, s0);
    and_aoi and3(y2, in, s1, s0_bar);
    and_aoi and4(y3, in, s1, s0);
endmodule