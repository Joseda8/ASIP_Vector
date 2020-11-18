`timescale 1 ps / 1 ps

module testbenchCPU();
	logic 		 clk;
	logic 		 reset;
	logic [31:0] WriteData, DataAdr, PC, PCNext, ReadData;
	logic [29:0] Instr;
	logic 	 	 MemWrite;
	int			 counter;
	
	// instantiate device to be tested
	top dut(clk, reset, WriteData, DataAdr, PC, PCNext, ReadData, Instr, MemWrite, counter);
	
	// initialize test
	initial
	begin
		reset <= 1; # 12; reset <= 0;
	end
	
	// generate clock to sequence tests
	always
	begin
		clk <= 1; # 5; clk <= 0; # 5;
	end

	// stops execution if loop is passed
	always @(negedge clk)
	begin
		if (PC === 164) begin
			$display("Simulation succeeded");
			$stop;

		end
	end
endmodule