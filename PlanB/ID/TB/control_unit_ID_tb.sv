module control_unit_ID_tb();

	logic [3:0] opcode;
	logic [1:0] vec_alu_op;
	logic r_mem_1, r_mem_2, w_mem_2, w_mem_3;
	
	control_unit_ID uut(opcode, vec_alu_op,
							r_mem_1,
							r_mem_2, w_mem_2,
							w_mem_3);
	
	initial begin
		#100 opcode = 4'b0000; // INCRI
		#100 opcode = 4'b0001; //INCRJ
		#100 opcode = 4'b0010; //SETN
		#100 opcode = 4'b0100; //MULFV
		#100 opcode = 4'b0011; //SUMFV
		#100 opcode = 4'b0101; //NOP
		#100;
	end


endmodule
