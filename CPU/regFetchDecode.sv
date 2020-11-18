module regFetchDecode(	input  logic clk, reset,
								input  logic [29:0] instr_in,
								output logic [29:0] instr_out);

flopr instrReg(clk, reset, instr_in, instr_out);
								
endmodule 