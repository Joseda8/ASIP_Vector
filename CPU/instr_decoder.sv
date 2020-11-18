module instr_decoder(instr, 
							srs1, srs2, srd, vrs1, vrs2, vrd,
							addr, imm, jump);
														
   input logic [29:0] instr;
	
	output logic [2:0] srs1, srs2, srd;
	output logic [1:0] vrs1, vrs2, vrd;
	output logic [25:0] addr;
	output logic [23:0] imm;
	output logic jump;
	
	logic [31:0] instr_in;
	assign instr_in = {instr, 2'b0};
	
	always @* begin 
		case (instr_in[31:28])
				4'b0000, 4'b0110: //SUM - CMPEQ
					begin
						srs1 = instr_in[24:22];
						srs2 = instr_in[21:19];
						srd = instr_in[27:25];
						vrs1 = 2'bx;
						vrs2 = 2'bx;
						vrd = 2'bx;
						addr = 26'd0;
						imm = 24'd0;
						jump = 1'd0;
					end
				4'b0010, 4'b0100, 4'b1010: //SUMI - SUBI - SETI
					begin
						srs1 = instr_in[27:25];
						srs2 = 3'bx;
						srd = instr_in[27:25];
						vrs1 = 2'bx;
						vrs2 = 2'bx;
						vrd = 2'bx;	
						addr = 26'd0;
						imm = instr_in[24:2];
						jump = 1'd0;
					end
				4'b0001, 4'b0011, 4'b0101, 4'b1011: //SUMFV - MULFV - LDV - SETFV
					begin
						srs1 = instr_in[23:21];
						srs2 = 3'bx;
						srd = 3'bx;
						vrs1 = instr_in[25:24];
						vrs2 = 2'bx;
						vrd = instr_in[27:26];
						addr = 26'd0;
						imm = 24'd0;
						jump = 1'd0;
					end
				4'b0111: //NOP
					begin
						srs1 = 3'bx;
						srs2 = 3'bx;
						srd = 3'bx;
						vrs1 = 2'bx;
						vrs2 = 2'bx;
						vrd = 2'bx;	
						addr = 26'd0;
						imm = 24'd0;
						jump = 1'd0;
					end
				4'b1000, 4'b1001: //J - JEQ
					begin
						srs1 = 3'bx;
						srs2 = 3'bx;
						srd = 3'bx;
						vrs1 = 2'bx;
						vrs2 = 2'bx;
						vrd = 2'bx;
						addr = instr_in[27:2];
						imm = 24'd0;
						jump = 1'd1;
					end
				default:
					begin
						srs1 = 3'bx;
						srs2 = 3'bx;
						srd = 3'bx;
						vrs1 = 2'bx;
						vrs2 = 2'bx;
						vrd = 2'bx;
						addr = 26'd0;
						imm = 24'd0;
						jump = 1'd0;
					end
			endcase
	end

endmodule
