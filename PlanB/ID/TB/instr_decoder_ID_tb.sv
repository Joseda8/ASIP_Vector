module instr_decoder_ID_tb();

parameter ARQ = 32;

logic [ARQ - 3:0] instr;
logic [1:0] sca_reg_op;
logic [23:0] imm;

instr_decoder_ID uut(instr, sca_reg_op, imm);

initial begin
	#50 instr = 30'b000000000000000000000000000000; // INCRI
	#50 instr = 30'b000100000000000000000000000000; // INCRJ
	#50 instr = 30'b001000000000000000000000001000; // SETN
	#50 instr = 30'b001100000000000000000000000000; // SUMFV
	#50 instr = 30'b010000000000000000000000000000; // MULFV
	#50 instr = 30'b010100000000000000000000000000; // NOP
	#50;
end

endmodule

