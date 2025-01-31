module half_adder_tb;
    // Test inputs
    reg a, b;
    
    // Outputs for NAND implementation
    wire sum_nand, cout_nand;
    
    // Outputs for NOR implementation
    wire sum_nor, cout_nor;
    
    // Instantiate the half adders
    half_adder_nand ha_nand(
        .a(a),
        .b(b),
        .sum(sum_nand),
        .cout(cout_nand)
    );
    
    half_adder_nor ha_nor(
        .a(a),          // Changed from .A to .a
        .b(b),          // Changed from .B to .b
        .sum(sum_nor),  // Changed from .SUM to .sum
        .cout(cout_nor) // Changed from .COUT to .cout
    );
    
    // Add waveform dumping
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
    end
    
    // Task to check and display results
    task check_outputs;
        input [1:0] expected;
        begin
            #10; // Increased delay for signal stabilization
            $display("Test: a=%b b=%b", a, b);
            expected = a+b;
            $display("NAND: sum=%b cout=%b %s", 
                    sum_nand, cout_nand,
                    (sum_nand == expected[0] && cout_nand == expected[1]) ? "PASS" : "FAIL");
            $display("NOR:  sum=%b cout=%b %s\n", 
                    sum_nor, cout_nor,
                    (sum_nor == expected[0] && cout_nor == expected[1]) ? "PASS" : "FAIL");
            #10; // Add delay between test cases
        end
    endtask
    
    // Test stimulus
    initial begin
        // Initialize inputs
        a = 0; b = 0;
        #10; // Initial stabilization delay
        
        $display("Starting Half Adder Tests\n");
        
        // Test case 1: 0 + 0 = 0, no carry
        a = 0; b = 0;
        check_outputs(2'b00);
        
        // Test case 2: 0 + 1 = 1, no carry
        a = 0; b = 1;
        check_outputs(2'b10);
        
        // Test case 3: 1 + 0 = 1, no carry
        a = 1; b = 0;
        check_outputs(2'b10);
        
        // Test case 4: 1 + 1 = 0, carry 1
        a = 1; b = 1;
        check_outputs(2'b01);
        
        $display("Half Adder Tests Complete");
        $finish;
    end

endmodule
