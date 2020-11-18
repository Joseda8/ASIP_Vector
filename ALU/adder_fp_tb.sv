`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:28 11/27/2016
// Design Name:   
// Module Name:   
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_fp_tb;

	// Inputs
	reg clk, start, op;
	reg [31:0] A, B;

	// Outputs
	wire ready, busy;
	wire [31:0] Y;

	// Instantiate the Unit Under Test (UUT)
	adder_fp uut (
		.clk(clk), 
		.start(start),
		.ready(ready),
		.busy(busy),
		.op(op),
		.A(A),
		.B(B),
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		clk = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		start = 1;
		A = 32'b01000010001101110001111010111000;
		B = 32'b01000001001100011001100110011010;
		op = 0;
		
		// case 2
		#100;
		start = 0;
		
		#200;
		start = 1;
		
		A = 32'b01000000010011001100110011001101;
		B = 32'b01000000010011001100110011001101;
	

	end
	
	always begin
		#50
		clk = ~clk;
	end
      
endmodule

