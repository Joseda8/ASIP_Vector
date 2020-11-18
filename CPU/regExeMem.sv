module regExeMem(clk, reset, scalar_reg_wr_in, vec_reg_wr_in, 
						wr_mem_in, rd_mem_in, scalar_reg_wmux_in, vec_reg_wmux_in, vec_reg_wfp_in,
						scalar_result_in, v1in, v2in, v3in, v4in, store_address_in, imm_in,
						
						scalar_reg_wr_out, vec_reg_wr_out, wr_mem_out, rd_mem_out, scalar_reg_wmux_out,
						vec_reg_wmux_out, vec_reg_wfp_out, scalar_result_out, v1out, v2out, v3out, v4out, store_address_out,
						imm_out);
						
	input logic clk, reset, scalar_reg_wr_in, vec_reg_wr_in, wr_mem_in, rd_mem_in, scalar_reg_wmux_in, 
					vec_reg_wmux_in, vec_reg_wfp_in;					
	input logic [31:0] scalar_result_in, v1in, v2in, v3in, v4in, store_address_in, imm_in;
	
	output logic scalar_reg_wr_out, vec_reg_wr_out, wr_mem_out, rd_mem_out, scalar_reg_wmux_out,
					 vec_reg_wmux_out, vec_reg_wfp_out;
					 
	output logic [31:0] scalar_result_out, v1out, v2out, v3out, v4out, store_address_out, imm_out;
	

	flopr #(1) scalar_reg_wr(clk, reset, scalar_reg_wr_in, scalar_reg_wr_out);
	flopr #(1) vec_reg_wr(clk, reset, vec_reg_wr_in, vec_reg_wr_out);
	flopr #(1) wr_mem(clk, reset, wr_mem_in, wr_mem_out);
	flopr #(1) rd_mem(clk, reset, rd_mem_in, rd_mem_out);
	flopr #(1) scalar_reg_wmux(clk, reset, scalar_reg_wmux_in, scalar_reg_wmux_out);
	flopr #(1) vec_reg_wmux(clk, reset, vec_reg_wmux_in, vec_reg_wmux_out);
	flopr #(1) vec_reg_wfp(clk, reset, vec_reg_wfp_in, vec_reg_wfp_out);
	flopr #(32) scalar_result(clk, reset, scalar_result_in, scalar_result_out);
	flopr #(32) v1(clk, reset, v1in, v1out);
	flopr #(32) v2(clk, reset, v2in, v2out);
	flopr #(32) v3(clk, reset, v3in, v3out);
	flopr #(32) v4(clk, reset, v4in, v4out);
	flopr #(32) str_addr(clk, reset, store_address_in, store_address_out);
	flopr #(32) imm(clk, reset, imm_in, imm_out);
					
endmodule 