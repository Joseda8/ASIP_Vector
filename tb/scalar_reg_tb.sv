module scalar_reg_tb();

	logic clk, write_enable;
	logic [3:0] ra1, ra2, write_address;
	logic [31:0] write_data, rd1, rd2;
	
	scalar_reg_bank uut(clk, write_enable, ra1, ra2, write_address, write_data, rd1, rd2);
	
	
	initial begin
		
		clk <= 1;
		
		// write registers sr1 y sr2
		#10 write_enable <= 1; write_address <= 3'b001; write_data <= 15;
		
		#10 write_address <= 3'b010; write_data <= 23;
	
		// read data
		#10 write_enable <= 0; ra1 <= 3'b001; ra2 = 3'b010;
		
		#10;
	
	end
	
	always #5 clk = ~clk;

endmodule
