# 4-Bit ALU Design and Verification in Verilog

## **Description**
This repository contains the complete RTL design and verification environment for a 4-bit Arithmetic Logic Unit (ALU). The project demonstrates a foundational digital design workflow, from writing the hardware description in Verilog to performing rigorous functional verification using the industry-standard Cadence toolchain.

## **Features**
The ALU is designed to perform the following eight operations on two 4-bit inputs (A and B), controlled by a 3-bit select line (S):

Addition: A + B

Subtraction: A - B (using 2's complement)

Bitwise AND: A & B

Bitwise OR: A | B

Bitwise XOR: A ^ B

Bitwise NOT: ~A

Logical Shift Left: A << 1

Logical Shift Right: A >> 1

The design also outputs a Carry-out (Cout) and a Zero (Zero) flag to indicate the status of the arithmetic operations.

## **Tools Used**
**Language:** Verilog

**Simulation:** Cadence NCLaunch

**Waveform Analysis & Debugging:** Cadence SimVision

## **Verification Strategy**
The functionality of the RTL design was validated through a comprehensive, self-checking testbench. The verification process included:

**Directed Testing:** A structured sequence of inputs was applied to the ALU to systematically test every operation with known values.

**Console Logging:** The testbench used Verilog's $display and $monitor system tasks to print the status and results of each test case to the console, providing a clear, human-readable log.

**Waveform Analysis:*8 The simulation was run with signal tracing enabled, and the resulting waveforms were loaded into SimVision for detailed graphical analysis. This allowed for visual confirmation that all signals behaved as expected at the correct simulation times.

## **Results**
The design passed all test cases defined in the testbench. The simulation waveform below shows the ALU correctly performing each of the eight operations in sequence, with the output Y_tb changing in response to the inputs A_tb, B_tb, and the select line S_tb.
