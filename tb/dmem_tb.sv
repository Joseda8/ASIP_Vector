//`timescale 1 ps / 1 ps

module dmem_tb();

	logic clk;
	logic [31:0] addr1, out1, out2, out3, out4;

	dmem uut(clk, addr1, out1, out2, out3, out4);
					 
	initial begin
		clk = 1;
		
		#10 addr1 <= 32'b0; 
		#10 addr1 <= 32'b10100;
	end

	always #5 clk = ~clk;

endmodule
