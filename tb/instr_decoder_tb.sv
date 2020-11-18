module instr_decoder_tb();

parameter ARQ = 32;

logic [ARQ - 1:0] instr;
logic [1:0] src1, src2, srcdest, type_reg; 
logic [3:0] opcode;
logic [25:0] addr;
logic [23:0] imm;
logic jop_lsb;

instr_decoder uut(instr, src1, src2, srcdest, type_reg, opcode, addr, imm, jop_lsb);

initial begin
	#50 instr = 32'b00001101100000000000000000000000; // SUM SR3, SR1, SR2
	#50 instr = 32'b00101000000000000000000001000100; //SUMI SR2, #17
	#50 instr = 32'b00110110000000000000000000000000; //MULFV SR1, SR3
	#50 instr = 32'b01011011000000000000000000000000; //LDV SR2, (SR3)
	#50 instr = 32'b01110000000000000000000000000000; //NOP
	#50 instr = 32'b10000000000000000000000010101100; //JEQ
	#50 instr = 32'b10010000000000000000000010101100; //J
	#50 instr = 32'b01100001000000000000000000000000; //CMPEQ SR1, SR0
	#50;
end

endmodule

