`timescale 1ns / 1ps


module control_limit_tb;

	logic clk;
	logic [1:0] sca_reg_op;
	logic [31:0] imm;
	
	logic [31:0] i_out, j_out, n_out;

	control_limit uut(clk, sca_reg_op, imm, i_out, j_out, n_out);


	initial begin
		clk = 1;
		#100;
		
		#100 sca_reg_op = 2'b11; imm = 32'b0000000000000000000000000000111;
		#100 sca_reg_op = 2'b10;
		#100 sca_reg_op = 2'b00; 
		#100 sca_reg_op = 2'b01;
		#100 sca_reg_op = 2'b11;
		
		#100 sca_reg_op = 2'b00; 
		#100 sca_reg_op = 2'b01;
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b11;
		
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b11;
		
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b11; 
		
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b11; 
		
		#100 sca_reg_op = 2'b01; 
		#100 sca_reg_op = 2'b11; 
		
	end
	
	always begin
		#50
		clk = ~clk;
	end
      
endmodule

