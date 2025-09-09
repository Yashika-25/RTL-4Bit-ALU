`timescale 1ns / 1ps // Defines the time unit and precision for simulation

module alu_tb;

    // Declare registers (reg) for testbench to drive the ALU inputs
    reg [3:0] A_tb;
    reg [3:0] B_tb;
    reg [2:0] S_tb;

    // Declare wires (wire) to connect to the ALU outputs
    wire [3:0] Y_tb;
    wire Cout_tb;
    wire Zero_tb;

    // Instantiate the Unit Under Test (UUT), which is our ALU
    alu uut (
        .A(A_tb),
        .B(B_tb),
        .S(S_tb),
        .Y(Y_tb),
        .Cout(Cout_tb),
        .Zero(Zero_tb)
    );

    // This initial block contains the sequence of test operations
    initial begin
        // Use $monitor to automatically print values whenever any of them change
        $monitor("Time=%0t | A=%b, B=%b, S=%b | Y=%b, Cout=%b, Zero=%b",
                 $time, A_tb, B_tb, S_tb, Y_tb, Cout_tb, Zero_tb);

        // --- Test Case 1: Addition ---
        $display("\n--- Testing Addition (S=000) ---");
        A_tb = 4'b0101; B_tb = 4'b0011; S_tb = 3'b000; #10; // 5 + 3 = 8
        A_tb = 4'b1001; B_tb = 4'b1000; S_tb = 3'b000; #10; // 9 + 8 = 17 (Carry)

        // --- Test Case 2: Subtraction ---
        $display("\n--- Testing Subtraction (S=001) ---");
        A_tb = 4'b1000; B_tb = 4'b0011; S_tb = 3'b001; #10; // 8 - 3 = 5
        A_tb = 4'b0011; B_tb = 4'b0100; S_tb = 3'b001; #10; // 3 - 4 = -1 (15 in 2's complement)

        // --- Test Case 3: Bitwise AND ---
        $display("\n--- Testing Bitwise AND (S=010) ---");
        A_tb = 4'b1010; B_tb = 4'b1100; S_tb = 3'b010; #10; // 10 & 12 = 8

        // --- Test Case 4: Bitwise OR ---
        $display("\n--- Testing Bitwise OR (S=011) ---");
        A_tb = 4'b1010; B_tb = 4'b0101; S_tb = 3'b011; #10; // 10 | 5 = 15

        // --- Test Case 5: Bitwise XOR ---
        $display("\n--- Testing Bitwise XOR (S=100) ---");
        A_tb = 4'b1010; B_tb = 4'b1111; S_tb = 3'b100; #10; // 10 ^ 15 = 5

        // --- Test Case 6: Bitwise NOT ---
        $display("\n--- Testing Bitwise NOT (S=101) ---");
        A_tb = 4'b1010; B_tb = 4'bxxxx; S_tb = 3'b101; #10; // ~10 = 5

        // --- Test Case 7: Logical Shift Left ---
        $display("\n--- Testing Logical Shift Left (S=110) ---");
        A_tb = 4'b0110; B_tb = 4'bxxxx; S_tb = 3'b110; #10; // 6 << 1 = 12

        // --- Test Case 8: Logical Shift Right ---
        $display("\n--- Testing Logical Shift Right (S=111) ---");
        A_tb = 4'b1100; B_tb = 4'bxxxx; S_tb = 3'b111; #10; // 12 >> 1 = 6

        // --- Test Case 9: Zero Flag Test ---
        $display("\n--- Testing Zero Flag ---");
        A_tb = 4'b0101; B_tb = 4'b0101; S_tb = 3'b001; #10; // 5 - 5 = 0

        $display("\n--- Test sequence finished ---");
        #10;
        $finish; // End the simulation
    end

endmodule
