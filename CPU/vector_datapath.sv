module vector_datapath(clk, rst, instr, rd1, rd2, rd3, rd4, mux_pc,
                       sca_reg_w, vec_reg_w, sca_mux_exe,
							  sca_alu_op, vec_alu_op, w_mem, r_mem, 
							  sca_reg_wd, vec_reg_wd, vec_reg_wfp,
							  
							  wd1, wd2, wd3, wd4, wr_addr, pc, alu_out, instr_out, 
							  zero, wr_mem,
							  
							  wr_sc);

	input logic clk, rst, mux_pc, sca_reg_w, vec_reg_w, sca_mux_exe;
	input logic sca_alu_op, vec_alu_op, w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp;
	input logic [29:0] instr;
	input logic [31:0] rd1, rd2, rd3, rd4;
	
	output logic [31:0] pc, alu_out, wd1, wd2, wd3, wd4, wr_addr;
	output logic [29:0] instr_out;
	output logic wr_mem, zero, wr_sc;
	
	// Fetch signals
	logic [31:0] pc_plus_4, pc_next;
	
	
	// Fetch Stage
	mux2_1 #(32) pcmux(pc_plus_4, 0, mux_pc, pc_next); //TODO: 0 is the jump, change, also change pc_sel
	flopr #(32) pcreg(clk, rst, pc_next, pc);
	adder #(32) pcadder(pc, 32'b100, pc_plus_4);
	
	// Fetch-Decode Register
	regFetchDecode regfd(clk, rst, instr, instr_out);
	
	// Last stage signals (Mem-WB)
	//logic sca_reg_w_mw = 0;
	
	// MEM signals
	logic scalar_reg_wr_wb_in, vec_reg_wr_wb_in, vec_wmux_wb_in, vec_wfp_wb_in;
	logic [31:0] v1alu_wb, v2alu_wb, v3alu_wb, v4alu_wb, v1mem_wb, v2mem_wb, v3mem_wb, v4mem_wb, imm_wb; 
	
	// deco signals
	logic [2:0] srs1, srs2, srd;
	logic [1:0] vrs1, vrs2, vrd;
	logic [25:0] addr;
	logic [23:0] imm;
	logic jump;
	
	logic [31:0] srout1, srout2, imm_32, wr_data;
	logic [31:0] vw1, vw2, vw3, vw4, v11, v12, v13, v14, v21, v22, v23, v24;
	
	logic scalar_reg_wr_out, vec_reg_wr_out, scalar_mux_exe_out, scalar_alu_op_out, vec_alu_op_out,
			wr_mem_out, rd_mem_out, scalar_reg_wmux_out, vec_reg_wmux_out, vec_reg_wfp_out;
			
	logic [31:0] srout1_out, srout2_out, imm_out, v11_out, v12_out, v13_out, v14_out, v21_out,
	             v22_out, v23_out, v24_out;
	
	instr_decoder deco(instr_out, srs1, srs2, srd, vrs1, vrs2, vrd, addr, imm, jump);
	
	zero_ext_32 zero_ext(imm, imm_32);
	
	// NOTA: sca_reg_wd debe venir luego de write back, cambiar eso cuando se tenga
	mux2_1 #(32) wr_data_mux(alu_out, imm_wb, scalar_reg_wr_wb_in, wr_data);
	
	// NOTA: igual para sca_reg_w
	//scalar_reg_bank scalar_regs(clk, rst, scalar_wmux_wb_in, srs1, srs2, srd, wr_data, srout1, srout2);
	scalar_reg_bank scalar_regs(clk, rst, wr_sc, srs1, srs2, srd, wr_data, srout1, srout2);
	
	eq eq_comparator(srout1, srout2, zero);
	
	vector_reg_bank vector_bank(clk, rst, vec_reg_wr_wb_in, vec_wfp_wb_in, vrs1, srout1, vrs1, vrs2, vrd, 
										 vw1, vw2, vw3, vw4, v11, v12, v13, v14, v21, v22, v23, v24);
	
	// Decode-Exe Register
	regDecodeExe regde(clk, rst, sca_reg_w, vec_reg_w, sca_mux_exe, sca_alu_op, vec_alu_op, 
							  w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp,
							  srout1, srout2, imm_32,
							  v11, v12, v13, v14, v21, v22, v23, v24,
							  
							  scalar_reg_wr_out, vec_reg_wr_out, scalar_mux_exe_out, scalar_alu_op_out, vec_alu_op_out,
							  wr_mem_out, rd_mem_out, scalar_reg_wmux_out, vec_reg_wmux_out, vec_reg_wfp_out,
							  srout1_out, srout2_out, imm_out, v11_out, v12_out, v13_out, v14_out, v21_out, v22_out, v23_out, v24_out);
	
	// EXE signals
	logic [31:0] alu2_in, scalar_alu_out, v1out, v2out, v3out, v4out;
	logic scalar_reg_wr_mem_in, vec_reg_wr_mem_in, wr_mem_in, rd_mem_in, scalar_wmux_mem_in,
			vec_wmux_mem_in, vec_wfp_mem_in;
	logic [31:0] scalar_resul_mem_in, imm_mem_in;
	
	mux2_1 #(32) exe_scalar_mux(srout2_out, imm_out, scalar_mux_exe_out, alu2_in); 
	
	ALU_scalar scalar_alu(srout1_out, alu2_in, scalar_alu_op_out, scalar_alu_out);
	
	lanes vector_lanes(v11_out, v21_out, v12_out, v22_out, v13_out, v23_out, v14_out, v24_out, 
							vec_alu_op_out, clk, v1out, v2out, v3out, v4out);
							
	regExeMem reg_exe_mem(clk, rst, scalar_reg_wr_out, vec_reg_wr_out, wr_mem_out, rd_mem_out,
								 scalar_reg_wmux_out, vec_reg_wmux_out, vec_reg_wfp_out, scalar_alu_out,
								 v1out, v2out, v3out, v4out, srout1_out, imm_out,
								 
								 scalar_reg_wr_mem_in, vec_reg_wr_mem_in, wr_mem, rd_mem_in, scalar_wmux_mem_in,
								 vec_wmux_mem_in, vec_wfp_mem_in, scalar_resul_mem_in, wd1, wd2, wd3,wd4, wr_addr, imm_mem_in);
							
	
	regMemWB reg_mem_wb(clk, rst, wd1, wd2, wd3, wd4, rd1, rd2, rd3, rd4,
							  scalar_reg_wr_mem_in, vec_reg_wr_mem_in, scalar_wmux_mem_in, vec_wmux_mem_in, vec_wfp_mem_in, 
							  scalar_resul_mem_in, imm_mem_in,
							  
							  scalar_reg_wr_wb_in, vec_reg_wr_wb_in, wr_sc, vec_wmux_wb_in, vec_wfp_wb_in, // todo: wr_sc es scalar_wmux_wb_in
							  v1alu_wb, v2alu_wb, v3alu_wb, v4alu_wb, v1mem_wb, v2mem_wb, v3mem_wb, v4mem_wb, 
							  alu_out, imm_wb);
	
	vector_mux wb_mux(v1mem_wb, v2mem_wb, v3mem_wb, v4mem_wb, v1alu_wb, v2alu_wb, v3alu_wb, v4alu_wb, vec_wmux_wb_in,
							vw1, vw2, vw3, vw4);
							
							
endmodule
	