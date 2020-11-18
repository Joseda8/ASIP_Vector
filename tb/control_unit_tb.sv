module control_unit_tb();

	logic[3:0] opcode;
	logic zero;
	logic mux_pc, pc_en, sca_reg_w, vec_reg_w, sca_mux_exe, sca_alu_op, 
	vec_alu_op, w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp;
	
	control_unit uut(opcode, zero, 
	mux_pc, pc_en, sca_reg_w, vec_reg_w, sca_mux_exe, sca_alu_op, 
	vec_alu_op, w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp);
	
	initial begin
		#100 opcode = 4'b0000; //SUM
		#100 opcode = 4'b0010; //SUMI
		#100 opcode = 4'b0110; zero = 1'b1; //CMP
		#100 opcode = 4'b1001; //JEQ
		#100 opcode = 4'b0111; //NOP
		#100 opcode = 4'b0011; //MULFV
		#100 opcode = 4'b0110; zero = 1'b0; //CMP
		#100 opcode = 4'b1001; //JEQ
		#100;
	end


endmodule
