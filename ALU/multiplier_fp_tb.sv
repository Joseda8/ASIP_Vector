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

module multiplier_fp_tb;

	// Inputs
	reg clk, start;
	reg [31:0] A, B;

	// Outputs
	wire ready, busy;
	wire [31:0] Y;

	// Instantiate the Unit Under Test (UUT)
	multiplier_fp uut (
		.clk(clk), 
		.start(start),
		.ready(ready),
		.busy(busy),
		.A(A),
		.B(B),
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		clk = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// stimulus here
		start = 1;
		A = 32'h40C0_0000;
		B = 32'h4020_0000;
		
		// case 2
		#100;
		start = 0;
		
		#2000;
		start = 1;
		A = 32'h40e3_3333;
		B = 32'h4182_6666;
		
		// case 3
		#100;
		start = 0;
		
		#2000;
		start = 1;
		A = 32'h3f8c_cccd;
		B = 32'h40b9_999a;
		
	end
	
	always begin
		#50
		clk = ~clk;
	end
      
endmodule