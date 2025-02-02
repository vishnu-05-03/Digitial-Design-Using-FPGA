`include "4_1_mux.v"

module mux_16_1(
    input wire [15:0] in,
    input wire [3:0] sel,
    output wire out
);

    wire [3:0] mux_out;

    mux_4_1 mux0(
        .a(in[0]), .b(in[1]), .c(in[2]), .d(in[3]),
        .sel(sel[1:0]), .y(mux_out[0])
    );

    mux_4_1 mux1(
        .a(in[4]), .b(in[5]), .c(in[6]), .d(in[7]),
        .sel(sel[1:0]), .y(mux_out[1])
    );

    mux_4_1 mux2(
        .a(in[8]), .b(in[9]), .c(in[10]), .d(in[11]),
        .sel(sel[1:0]), .y(mux_out[2])
    );

    mux_4_1 mux3(
        .a(in[12]), .b(in[13]), .c(in[14]), .d(in[15]),
        .sel(sel[1:0]), .y(mux_out[3])
    );

    mux_4_1 mux_final(
        .a(mux_out[0]), .b(mux_out[1]), .c(mux_out[2]), .d(mux_out[3]),
        .sel(sel[3:2]), .y(out)
    );

endmodule