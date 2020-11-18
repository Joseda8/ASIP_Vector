module control_unit #(parameter ARQ = 32)(opcode, zero,
														mux_pc, 
														sca_reg_w, vec_reg_w,
														sca_mux_exe, sca_alu_op, vec_alu_op, 
														w_mem, r_mem,
														sca_reg_wd, vec_reg_wd, vec_reg_wfp);
					
	input logic [3:0] opcode;
	input logic zero;
	
	output logic mux_pc, sca_reg_w, vec_reg_w, sca_mux_exe, sca_alu_op, vec_alu_op, 
					w_mem, r_mem, sca_reg_wd, vec_reg_wd, vec_reg_wfp;
	
	
	logic FLAG_zero = 0;
	

	always @(*) begin
		case(opcode) 
			4'b0000: begin    // SUM
				mux_pc = 0; //0 PC+4, 1 BranchAddr
				sca_reg_w = 1;
				vec_reg_w = 0;
				sca_mux_exe = 0; //0 reg, 1 inmediato
				sca_alu_op = 0; //0 suma, 1 resta
				vec_alu_op = 0; //0 suma, 1 multiplica 
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 1; //0 inmediato, 1 ALU
				vec_reg_wd = 0; //0 mem, 1 ALU
				vec_reg_wfp = 0;
			end
			
			4'b0110: begin    // CMPEQ
				FLAG_zero = zero;
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0;
				sca_alu_op = 0;
				vec_alu_op = 0; 
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0;
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b0010: begin //SUMI
				mux_pc = 0;
				sca_reg_w = 1;
				vec_reg_w = 0;
				sca_mux_exe = 1;
				sca_alu_op = 0;
				vec_alu_op = 0; 
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0;
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b0100: begin //SUBI
				mux_pc = 0;
				sca_reg_w = 1;
				vec_reg_w = 0;
				sca_mux_exe = 1;
				sca_alu_op = 1;
				vec_alu_op = 0; 
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0;
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b1010: begin //SETI
				mux_pc = 0;
				sca_reg_w = 1;
				vec_reg_w = 0;
				sca_mux_exe = 0;
				sca_alu_op = 0;
				vec_alu_op = 0; 
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; //Inmediato
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b0001: begin //SUMFV
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0; 
				sca_alu_op = 0;
				vec_alu_op = 1; 
				w_mem = 1;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0; 
				vec_reg_wfp = 0;
			end
			
			4'b0011: begin //MULFV
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 1;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 1;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 1;
				vec_reg_wfp = 0;
			end
			
			4'b0101: begin //LDV
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 1;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 1;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b1011: begin //SETFV
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 1;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 1;
			end
			
			4'b0111: begin //NOP
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b1000: begin //J
				mux_pc = 1;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
			4'b1001: begin //JEQ
			  if(zero)
				 mux_pc = 1;
			  else
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			default: begin
				mux_pc = 0;
				sca_reg_w = 0;
				vec_reg_w = 0;
				sca_mux_exe = 0; 
				sca_alu_op = 0; 
				vec_alu_op = 0;
				w_mem = 0;
				r_mem = 0;
				sca_reg_wd = 0; 
				vec_reg_wd = 0;
				vec_reg_wfp = 0;
			end
			
		endcase
	end


endmodule
