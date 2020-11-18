module CPU_DatapathIF(clk, rst, pc, instr_out);

	input logic clk, rst;
	
	output logic [31:0] pc;
	output logic [29:0] instr_out;
	
	// Fetch signals
	logic [31:0] pc_plus_4, pc_next;
	logic mux_pc;
	logic [29:0] instr;
	
	
	// Fetch Stage
	mux2_1 #(32) pcmux(pc_plus_4, 0, mux_pc, pc_next); //TODO: 0 is the jump, change, also change pc_sel
	flopr #(32) pcreg(clk, rst, pc_next, pc);
	adder #(32) pcadder(pc, 32'b100, pc_plus_4);
	
	// Fetch-Decode Register
	regFetchDecode regfd(clk, rst, instr, instr_out);
	
							
endmodule
	