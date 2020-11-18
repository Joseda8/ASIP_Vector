module controller(input logic clk, reset,
						input logic [29:16] InstrD,
						input logic [3:0] ALUFlagsE,
						input logic [3:0] CondE,
						output logic [1:0] RegSrcD,
						output logic [1:0] ImmSrcD,
						output logic ALUSrcD,
						output logic [1:0] ALUControlD,
						output logic MemtoRegD,
						output logic PCSD, RegWD, MemWD,
						output logic CondExE,
						output logic [1:0] FlagWD);

decoder dec(InstrD[29:28], InstrD[27:24], InstrD[19:16],
				FlagWD, PCSD, RegWD, MemWD,
				MemtoRegD, ALUSrcD, 
				ImmSrcD, RegSrcD, 
				ALUControlD);
				
				
condcheck cc(CondE, ALUFlagsE, CondExE);
				
endmodule 