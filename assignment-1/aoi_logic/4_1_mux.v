`include "2_1_mux.v"

module mux_4_1(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    input wire [1:0] sel,
    output wire y
);

    wire y1, y2;

    mux_2_1 mux1(
        .a(a),
        .b(b),
        .sel(sel[0]),
        .y(y1)
    );

    mux_2_1 mux2(
        .a(c),
        .b(d),
        .sel(sel[0]),
        .y(y2)
    );

    mux_2_1 mux3(
        .a(y1),
        .b(y2),
        .sel(sel[1]),
        .y(y)
    );

endmodule