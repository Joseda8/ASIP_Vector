module CPU_Datapath_ID(clk, rst, instr, w_mem_2, w_mem_3, vec_func, new_pc, instr_out, 
								mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, 
								addr1, addr2, addr3, addr4,
								flag);

	input logic clk, rst, w_mem_2, w_mem_3, vec_func;
	input logic [29:0] instr;
	
	output logic [31:0] new_pc, addr1, addr2, addr3, addr4, mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4;
	output logic [29:0] instr_out;
	
	output int flag;

	
	// Fetch signals
	logic [31:0] pc_next, pc4;//, pc4;

	logic [1:0] sca_reg_op;
	logic [23:0] imm;
		
	// Fetch Stage
	mux2_1 #(32) pcmux(pc4, 0, 0, pc_next); 
	pc_reg pcreg(clk, rst, pc_next, new_pc);
	adder #(32) pcadder(new_pc, 32'b100, pc4);

	//run -all
	
	// Fetch-Decode Register
	regFetchDecode regfd(clk, rst, instr, instr_out);
	
	// inicia deco
	
	instr_decoder_ID decoder(instr_out, sca_reg_op, imm);
	
	logic [31:0] imm_32, i_exe_in, j_exe_in, n_exe_in, i_exe, j_exe, n_exe;
	
	zero_ext_32 zero_ext(imm, imm_32);
	
	control_limit contrl_lim(clk, rst, sca_reg_op, imm_32, i_exe_in, j_exe_in, n_exe_in);
	
	regDecodeExe regde(clk, rst, i_exe_in, j_exe_in, n_exe_in, i_exe, j_exe, n_exe);
	
	// inicia exe-mem
	
	address_calculator addr_calc(i_exe, j_exe, n_exe, addr1, addr2, addr3, addr4);
	
	logic [31:0] pix1, pix2, pix3, pix4, const1, const2, const3, const4;
	//logic [31:0] /*mulr1, mulr2, mulr3, mulr4,*/ mulr5, mulr6, mulr7, mulr8;
	logic [31:0] alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8;
	
	dmem image_mem(clk, addr1, addr2, addr3, addr4, pix1, pix2, pix3, pix4);
	
	const_mem cnst_mem(clk, addr1, addr2, addr3, addr4, const1, const2, const3, const4);
	
	logic [31:0] vresult1, vresult2, vresult3, vresult4;
	
	lanes alus(alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8,
				vec_func, clk, vresult1, vresult2, vresult3, vresult4);

	
	mult_mem mul_mem(clk, w_mem_2, vresult1, vresult2, vresult3, vresult4, 
							mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, flag);
	
	sum_mem sum_mem(clk, w_mem_3, addr1, addr2, addr3, addr4, vresult1, vresult2, vresult3, vresult4, 
						 sumr1, sumr2, sumr3, sumr4);
	
	vector_data_mux data_mux(mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8,
									 pix1, const1, pix2, const2, pix3, const3, pix4, const4,
									 alu_in1, alu_in2, alu_in3, alu_in4, alu_in5, alu_in6, alu_in7, alu_in8,
									 vec_func);
									 
endmodule


/*
r1 -> Imagen original
r2, w2 -> Resultado de la multiplicación
w3 -> Resultado de la suma
*/
	