module cpu( input  logic clk, rst,
			   input  logic [29:0] InstrF,
			   input  logic [31:0] ReadDataM,
			   output logic MemWriteM,
			   output logic [31:0] PC, PCNext,
			   output logic [31:0] ALUOutM, WriteDataM);
			  
logic [3:0] ALUFlagsE, CondE;
logic [1:0] RegSrcD, ImmSrcD, ALUControlD, FlagWD;
logic reset;
logic [29:0] InstrD;
logic PCSD, RegWD, MemWD, MemtoRegD, ALUSrcD, CondExE;

//assign reset = ~rst;

controller c(clk, rst, InstrD[29:16], ALUFlagsE, CondE,
				 RegSrcD, ImmSrcD, 
				 ALUSrcD, ALUControlD,
				 MemtoRegD, PCSD, RegWD, MemWD, CondExE,
				 FlagWD);
				 
datapath dp(clk, rst,
				InstrF,
				PCSD, RegWD, MemWD, MemtoRegD, ALUSrcD, CondExE,
				RegSrcD, ImmSrcD, ALUControlD, FlagWD,
				ReadDataM,
				PC, PCNext, InstrD,
				ALUFlagsE, CondE,
				ALUOutM, WriteDataM, MemWriteM);
				
endmodule
