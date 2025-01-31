module basic_gates_tb;

    reg aoi_a, aoi_b, aoi_c;
    wire aoi_out;
    reg not_aoi_in;
    wire not_aoi_out;
    reg nand_aoi_a, nand_aoi_b;
    wire nand_aoi_out;
    reg and_aoi_a, and_aoi_b;
    wire and_aoi_out;
    reg nor_aoi_a, nor_aoi_b;
    wire nor_aoi_out;
    reg or_aoi_a, or_aoi_b;
    wire or_aoi_out;
    reg xnor_aoi_a, xnor_aoi_b;
    wire xnor_aoi_out;
    reg xor_aoi_a, xor_aoi_b;
    wire xor_aoi_out;

    // Instantiate the module
    aoi aoi_inst (aoi_out, aoi_a, aoi_b, aoi_c);
    not_aoi not_aoi_inst (not_aoi_out, not_aoi_in);
    nand_aoi nand_aoi_inst (nand_aoi_out, nand_aoi_a, nand_aoi_b);
    and_aoi and_aoi_inst (and_aoi_out, and_aoi_a, and_aoi_b);
    nor_aoi nor_aoi_inst (nor_aoi_out, nor_aoi_a, nor_aoi_b);
    or_aoi or_aoi_inst (or_aoi_out, or_aoi_a, or_aoi_b);
    xnor_aoi xnor_aoi_inst (xnor_aoi_out, xnor_aoi_a, xnor_aoi_b);
    xor_aoi xor_aoi_inst (xor_aoi_out, xor_aoi_a, xor_aoi_b);

    initial begin
        $dumpfile("basic_gates_tb.vcd");
        $dumpvars(0, basic_gates_tb);
    end

    reg out;
    // test aoi
    initial begin
        $display("\n aoi");
        aoi_a = 0; aoi_b = 0; aoi_c = 0;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 0; aoi_b = 0; aoi_c = 1;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 0; aoi_b = 1; aoi_c = 0;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 0; aoi_b = 1; aoi_c = 1;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 1; aoi_b = 0; aoi_c = 0;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 1; aoi_b = 0; aoi_c = 1;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 1; aoi_b = 1; aoi_c = 0;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");
        aoi_a = 1; aoi_b = 1; aoi_c = 1;
        #10;
        $display("%s", ~(aoi_a & aoi_b | aoi_c) == aoi_out ? "PASS" : "FAIL");

    // test not_aoi
        $display("\n nor");
        not_aoi_in = 0;
        #10;
        $display("%s", ~not_aoi_in == not_aoi_out ? "PASS" : "FAIL");
        not_aoi_in = 1;
        #10;
        $display("%s", ~not_aoi_in == not_aoi_out ? "PASS" : "FAIL");

    // test nand_aoi
        $display("\n nand");
        nand_aoi_a = 0; nand_aoi_b = 0;
        #10;
        $display("%s", ~(nand_aoi_a & nand_aoi_b) == nand_aoi_out ? "PASS" : "FAIL");
        nand_aoi_a = 0; nand_aoi_b = 1;
        #10;
        $display("%s", ~(nand_aoi_a & nand_aoi_b) == nand_aoi_out ? "PASS" : "FAIL");
        nand_aoi_a = 1; nand_aoi_b = 0;
        #10;
        $display("%s", ~(nand_aoi_a & nand_aoi_b) == nand_aoi_out ? "PASS" : "FAIL");
        nand_aoi_a = 1; nand_aoi_b = 1;
        #10;
        $display("%s", ~(nand_aoi_a & nand_aoi_b) == nand_aoi_out ? "PASS" : "FAIL");

    // test and_aoi
        $display("\nand");
        and_aoi_a = 0; and_aoi_b = 0;
        #10;
        $display("%s", (and_aoi_a & and_aoi_b) == and_aoi_out ? "PASS" : "FAIL");
        and_aoi_a = 0; and_aoi_b = 1;
        #10;
        $display("%s", (and_aoi_a & and_aoi_b) == and_aoi_out ? "PASS" : "FAIL");
        and_aoi_a = 1; and_aoi_b = 0;
        #10;
        $display("%s", (and_aoi_a & and_aoi_b) == and_aoi_out ? "PASS" : "FAIL");
        and_aoi_a = 1; and_aoi_b = 1;
        #10;
        $display("%s", (and_aoi_a & and_aoi_b) == and_aoi_out ? "PASS" : "FAIL");

    // test nor_aoi
        $display("\nnor");
        nor_aoi_a = 0; nor_aoi_b = 0;
        #10;
        $display("%s", ~(nor_aoi_a | nor_aoi_b) == nor_aoi_out ? "PASS" : "FAIL");
        nor_aoi_a = 0; nor_aoi_b = 1;
        #10;
        $display("%s", ~(nor_aoi_a | nor_aoi_b) == nor_aoi_out ? "PASS" : "FAIL");
        nor_aoi_a = 1; nor_aoi_b = 0;
        #10;
        $display("%s", ~(nor_aoi_a | nor_aoi_b) == nor_aoi_out ? "PASS" : "FAIL");
        nor_aoi_a = 1; nor_aoi_b = 1;
        #10;
        $display("%s", ~(nor_aoi_a | nor_aoi_b) == nor_aoi_out ? "PASS" : "FAIL");

    // test or_aoi
        $display("\nor");
        or_aoi_a = 0; or_aoi_b = 0;
        #10;
        $display("%s", (or_aoi_a | or_aoi_b) == or_aoi_out ? "PASS" : "FAIL");
        or_aoi_a = 0; or_aoi_b = 1;
        #10;
        $display("%s", (or_aoi_a | or_aoi_b) == or_aoi_out ? "PASS" : "FAIL");
        or_aoi_a = 1; or_aoi_b = 0;
        #10;
        $display("%s", (or_aoi_a | or_aoi_b) == or_aoi_out ? "PASS" : "FAIL");
        or_aoi_a = 1; or_aoi_b = 1;
        #10;
        $display("%s", (or_aoi_a | or_aoi_b) == or_aoi_out ? "PASS" : "FAIL");

    // test xnor_aoi
        $display("\nxnor");
        xnor_aoi_a = 0; xnor_aoi_b = 0;
        #10;
        $display("%s", xnor_aoi_a == xnor_aoi_b ? xnor_aoi_out : ~xnor_aoi_out ? "PASS" : "FAIL");
        xnor_aoi_a = 0; xnor_aoi_b = 1;
        #10;
        $display("%s", xnor_aoi_a == xnor_aoi_b ? xnor_aoi_out : ~xnor_aoi_out ? "PASS" : "FAIL");
        xnor_aoi_a = 1; xnor_aoi_b = 0;
        #10;
        $display("%s", xnor_aoi_a == xnor_aoi_b ? xnor_aoi_out : ~xnor_aoi_out ? "PASS" : "FAIL");
        xnor_aoi_a = 1; xnor_aoi_b = 1;
        #10;
        $display("%s", xnor_aoi_a == xnor_aoi_b ? xnor_aoi_out : ~xnor_aoi_out ? "PASS" : "FAIL");

    // test xor_aoi
        $display("\nxor");
        xor_aoi_a = 0; xor_aoi_b = 0;
        #10;
        $display("%s", xor_aoi_a != xor_aoi_b ? xor_aoi_out : ~xor_aoi_out ? "PASS" : "FAIL");
        xor_aoi_a = 0; xor_aoi_b = 1;
        #10;
        $display("%s", xor_aoi_a != xor_aoi_b ? xor_aoi_out : ~xor_aoi_out ? "PASS" : "FAIL");
        xor_aoi_a = 1; xor_aoi_b = 0;
        #10;
        $display("%s", xor_aoi_a != xor_aoi_b ? xor_aoi_out : ~xor_aoi_out ? "PASS" : "FAIL");
        xor_aoi_a = 1; xor_aoi_b = 1;
        #10;
        $display("%s", xor_aoi_a != xor_aoi_b ? xor_aoi_out : ~xor_aoi_out ? "PASS" : "FAIL");
        $finish;
    end
    

endmodule