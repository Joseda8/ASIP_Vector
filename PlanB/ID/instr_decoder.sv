module instr_decoder_ID(instr, sca_reg_op, imm);
														
   input logic [29:0] instr;
	
	output logic [1:0] sca_reg_op;
	output logic [23:0] imm;
	
	logic [31:0] instr_in;
	assign instr_in = {instr, 2'b0};
	
	always @* begin 
		case (instr_in[31:28])
				4'b0000: //INCRI 
					begin
						sca_reg_op = 2'b00;
						imm = 24'd0;
					end
				4'b0001: //INCRJ
					begin
						sca_reg_op = 2'b01;
						imm = 24'd0;
					end
				4'b0010: //SETN
					begin
						sca_reg_op = 2'b10;
						imm = instr_in[24:2];
					end
				4'b0011: //SUMFV
					begin
						sca_reg_op = 2'b11;
						imm = 24'd0;
					end
				4'b0100: //MULFV
					begin
						sca_reg_op = 2'b11;
						imm = 24'd0;
					end
				4'b0101: //NOP
					begin
						sca_reg_op = 2'b11;
						imm = 24'd0;
					end
				default:
					begin
						sca_reg_op = 2'bx;
						imm = 24'd0;
					end
			endcase
	end

endmodule
