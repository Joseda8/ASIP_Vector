module lanes_tb();

	logic [31:0] dataA0, dataB0, dataA1, dataB1, dataA2, dataB2, dataA3, dataB3;
	logic [1:0] func;
	logic clk;
	
	logic [31:0] result0, result1, result2, result3;


	lanes uut(dataA0, dataB0, dataA1, dataB1, dataA2, dataB2, dataA3, dataB3,
				func, clk, result0, result1, result2, result3);
				
	initial begin
	
		clk <= 1;
	
		#10 dataA0 = 32; dataB0 = 63; dataA1 = 333; dataB1 = 12; dataA2 = 32; dataB2 = 41; dataA3 = 74; dataB3 = 12; func = 2'b00;
		#10;
		
		#15 dataA0 = 32'b01000001101010011001100110011010; dataB0 = 32'b01000001101110110011001100110011;
		dataA1 = 32'b01000010011000000110011001100110; dataB1 = 32'b01000000100100000000000000000000; 
		dataA2 = 32'b01000000110001100110011001100110; dataB2 = 32'b01000001001100011001100110011010; 
		dataA3 = 32'b01000010000000000110011001100110; dataB3 = 32'b01000000101111001100110011001101; 
		func = 2'b01;
		#150;
		
		#10 dataA0 = 32; dataB0 = 63; dataA1 = 333; dataB1 = 12; dataA2 = 32; dataB2 = 41; dataA3 = 74; dataB3 = 12; func = 2'b10;
		#10;
		
		#10 dataA0 = 32'b01000001101010011001100110011010; dataB0 = 32'b01000001101110110011001100110011;
		dataA1 = 32'b01000010011000000110011001100110; dataB1 = 32'b01000000100100000000000000000000; 
		dataA2 = 32'b01000000110001100110011001100110; dataB2 = 32'b01000001001100011001100110011010; 
		dataA3 = 32'b01000010000000000110011001100110; dataB3 = 32'b01000000101111001100110011001101;
		func = 2'b11;
		#100;
	 
	end
	
	always #5 clk = ~clk;

endmodule
