`timescale 1ns / 1ps // Defines the time unit and precision for simulation
module alu(
    // Inputs
    input [3:0] A,      // 4-bit data input A
    input [3:0] B,      // 4-bit data input B
    input [2:0] S,      // 3-bit operation select line

    // Outputs
    output reg [3:0] Y, // 4-bit result output
    output reg Cout,    // Carry-out flag for addition/subtraction
    output reg Zero     // Zero flag (1 if Y is 0)
);

// Internal temporary variable for carry in addition/subtraction
reg [4:0] temp_result;

// The 'always' block describes the ALU's behavior based on the select line 'S'
// It is sensitive to changes in inputs A, B, and S.
always @(A or B or S) begin
    // Default assignments to avoid latches
    Y = 4'b0000;
    Cout = 1'b0;
    temp_result = 5'b00000;

    case (S)
        // Operation 0: Addition (A + B)
        3'b000: begin
            temp_result = {1'b0, A} + {1'b0, B};
            Y = temp_result[3:0];
            Cout = temp_result[4];
        end

        // Operation 1: Subtraction (A - B) using 2's complement
        3'b001: begin
            temp_result = {1'b0, A} + {1'b0, ~B + 1'b1};
            Y = temp_result[3:0];
            Cout = temp_result[4]; // Cout is effectively a borrow bit here
        end

        // Operation 2: Bitwise AND
        3'b010: begin
            Y = A & B;
            Cout = 1'b0;
        end

        // Operation 3: Bitwise OR
        3'b011: begin
            Y = A | B;
            Cout = 1'b0;
        end

        // Operation 4: Bitwise XOR
        3'b100: begin
            Y = A ^ B;
            Cout = 1'b0;
        end

        // Operation 5: Bitwise NOT (operates only on A)
        3'b101: begin
            Y = ~A;
            Cout = 1'b0;
        end

        // Operation 6: Logical Shift Left by 1
        3'b110: begin
            Y = A << 1;
            Cout = A[3]; // The bit that is shifted out
        end

        // Operation 7: Logical Shift Right by 1
        3'b111: begin
            Y = A >> 1;
            Cout = A[0]; // The bit that is shifted out
        end

        // Default case to handle any undefined select line values
        default: begin
            Y = 4'b0000;
            Cout = 1'b0;
        end
    endcase
end

// This second 'always' block checks if the result Y is zero.
// It runs whenever the output Y changes.
always @(Y) begin
    if (Y == 4'b0000)
        Zero = 1'b1;
    else
        Zero = 1'b0;
end

endmodule
