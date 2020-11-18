module top( input  logic clk, reset,
			   output logic [31:0] WriteDataM, ALUOutM, PC, PCNext, ReadDataM,
				output logic [29:0] InstrF, 
			   output logic MemWriteM,
				output int counterMEM); 

// instantiate processor and memories
cpu cpu(clk, reset, InstrF, ReadDataM, MemWriteM, PC, PCNext, ALUOutM, WriteDataM);
		  
imem imem(PC, InstrF);

dmem dmem(clk, MemWriteM, ALUOutM, WriteDataM, ReadDataM, counterMEM);


endmodule 