module datapath(input  logic clk, reset,
					 input  logic [29:0] InstrF,
					 input  logic PCSD, RegWD, MemWD, MemtoRegD, ALUSrcD, CondExE,
					 input  logic [1:0] RegSrcD, ImmSrcD, ALUControlD, FlagWD,
					 input  logic [31:0] ReadDataM,
					 output logic [31:0] PC, PCNext,
					 output logic [29:0] InstrD,
					 output logic [3:0] ALUFlagsE,
					 output logic [3:0] CondE,
					 output logic [31:0] ALUOutM, WriteDataM,
					 output logic MemWriteM);
					 
logic [31:0] PCPlus4;
logic [31:0] SrcBE, ResultW;
logic [3:0] RA1D, RA2D;
logic  C, Z, N, V;

// Decode
logic [31:0] WriteDataD, ExtImmD, SrcAD;
logic [3:0] ALUFlagsD;

// Exe
logic [3:0] wa3E;
logic [31:0] WriteDataE, ExtImmE, SrcAE, ALUResultE;
logic PCSE, RegWE, MemtoRegE, MemWE, ALUSrcE;
logic [1:0] ALUControlE, FlagWE;
logic [3:0] FlagsE;
logic MemWriteE, RegWriteE, PCSrcE;

// Mem
logic [3:0] wa3M;
logic PCSrcM, RegWriteM, MemtoRegM;

// WB
logic [3:0] wa3W;
logic [31:0] ALUOutW, ReadDataW;
logic PCSrcW, RegWriteW, MemtoRegW;

assign ALUFlagsD = {N, Z, C, V};

// Next PC logic
mux2_1 #(32) pcmux(PCPlus4, ResultW, PCSrcW, PCNext);
flopr #(32) pcreg(clk, reset, PCNext, PC);
adder #(32) pcadd1(PC, 32'b100, PCPlus4);

// Fetch-Decode Register
regFetchDecode regfd(clk, reset, InstrF, InstrD);


// Reg File logic
mux2_1 #(4) ra1mux(InstrD[15:12], 4'b1111, RegSrcD[0], RA1D);
mux2_1 #(4) ra2mux(InstrD[11:8], InstrD[19:16], RegSrcD[1], RA2D);
regfile rf(clk, RegWriteW, RA1D, RA2D,
			  wa3W, ResultW, PCPlus4,
			  SrcAD, WriteDataD);
			  
// Extend immediate
extend ext(InstrD[19:0], ImmSrcD, ExtImmD);

// Decode-Exe Register
regDecodeExe regde(clk, reset, 
						 InstrD[19:16], SrcAD, WriteDataD, ExtImmD, wa3E, SrcAE, WriteDataE, ExtImmE,
						 PCSD, RegWD, MemtoRegD, MemWD, ALUSrcD, ALUControlD, FlagWD, InstrD[23:20], ALUFlagsD, 
						 PCSE, RegWE, MemtoRegE, MemWE, ALUSrcE, ALUControlE, CondE, ALUFlagsE);

// ALU logic
mux2_1 #(32) srcbmux(WriteDataE, ExtImmE, ALUSrcE, SrcBE);
ALU alu(SrcAE, SrcBE, ALUControlE, C, Z, N, V, ALUResultE);

// Exe Control Logic
assign RegWriteE = RegWE & CondExE;
assign MemWriteE = MemWE & CondExE;
assign PCSrcE = PCSE & CondExE;

// Exe-Mem Register
regExeMem regem(clk, reset, wa3E, ALUResultE, WriteDataE, wa3M, ALUOutM, WriteDataM,
					 PCSrcE, RegWriteE, MemWriteE, MemtoRegE, PCSrcM, RegWriteM, MemWriteM, MemtoRegM );

// Mem-WB Register
regMemWB regmw(clk, reset, wa3M, ALUOutM, ReadDataM, wa3W, ALUOutW, ReadDataW,
					PCSrcM, RegWriteM, MemtoRegM, PCSrcW, RegWriteW, MemtoRegW);

// Resutl Mux
mux2_1 #(32) resmux(ALUOutW, ReadDataW, MemtoRegW, ResultW);

endmodule 