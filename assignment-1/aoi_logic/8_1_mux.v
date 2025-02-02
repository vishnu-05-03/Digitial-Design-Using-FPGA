`include "2_1_mux.v"

module mux_8_1(
    input wire [7:0] data_in,    // 8 input lines
    input wire [2:0] sel,        // 3 select lines
    output wire y                // output
);

    wire [5:0] intermediate;     // for connecting intermediate muxes

    // First stage: 4 2:1 muxes
    mux_2_1 mux1(
        .a(data_in[0]),
        .b(data_in[1]),
        .sel(sel[0]),
        .y(intermediate[0])
    );

    mux_2_1 mux2(
        .a(data_in[2]),
        .b(data_in[3]),
        .sel(sel[0]),
        .y(intermediate[1])
    );

    mux_2_1 mux3(
        .a(data_in[4]),
        .b(data_in[5]),
        .sel(sel[0]),
        .y(intermediate[2])
    );

    mux_2_1 mux4(
        .a(data_in[6]),
        .b(data_in[7]),
        .sel(sel[0]),
        .y(intermediate[3])
    );

    // Second stage: 2 2:1 muxes
    mux_2_1 mux5(
        .a(intermediate[0]),
        .b(intermediate[1]),
        .sel(sel[1]),
        .y(intermediate[4])
    );

    mux_2_1 mux6(
        .a(intermediate[2]),
        .b(intermediate[3]),
        .sel(sel[1]),
        .y(intermediate[5])
    );

    // Final stage: 1 2:1 mux
    mux_2_1 mux7(
        .a(intermediate[4]),
        .b(intermediate[5]),
        .sel(sel[2]),
        .y(y)
    );

endmodule