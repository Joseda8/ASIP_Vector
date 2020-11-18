module vector_reg_bank_tb();

	logic clk, write_enable, write_imm;
	logic [31:0] imm, vw1, vw2, vw3, vw4;
	logic [1:0] vs1, vs2, vd, vindex;
	
	logic [31:0] v11, v12, v13, v14, v21, v22, v23, v24;

	vector_reg_bank uut(clk, write_enable, write_imm, vindex, imm, vs1, vs2, vd,
							  vw1, vw2, vw3, vw4,
							  v11, v12, v13, v14, v21, v22, v23, v24);
	
	initial begin
		clk <= 1;
		
		#10 write_enable <= 1; vd = 2'b01; 
		vw1 <= 32'b01000010000010000000000000000000;
		vw2 <= 32'b01000001011000000000000000000000;
		vw3 <= 32'b01000001011010000000000000000000;
		vw4 <= 32'b01000010101010101100110011001101;
		#10 write_enable <= 0;
		
		#10 vd = 2'b00; write_enable <= 1;
		vw1 <= 32'b01000010110111100011001100110011;
		vw2 <= 32'b01000010000111100110011001100110;
		vw3 <= 32'b01000010011000011001100110011010;
		vw4 <= 32'b01000010101010101001100110011010;
		#10 write_enable <= 0;
		
		#10; vs1 <= 2'b00; vs2 <= 2'b01;
		
		#10 vd = 2'b00; write_imm <= 1; imm <= 32'b01000000010110011001100110011010; vd <= 2'b00; vindex <= 2'b11;
		#10 write_imm <= 0;
		
	end
	
	always #5 clk = ~clk;

endmodule
