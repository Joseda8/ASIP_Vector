module out_vector_tb();

	logic clk, write_enable;
	logic [31:0] data1, data2, data3, data4, data_out1, data_out2, data_out3, data_out4;

	out_vector uut(clk, write_enable, data1, data2, data3, data4, data_out1, data_out2, data_out3, data_out4);
	
	initial begin
	
	clk <= 1;
	
	#10 write_enable <= 1;
	data1 <= 32'b01000010011000011001100110011010;
	data2 <= 32'b01000001001101001100110011001101;
	data3 <= 32'b01000010001111111001100110011010;
	data4 <= 32'b01000010100001111100110011001101;
	#10 write_enable <= 0;
	
	#10;
	end
	
	always #5 clk = ~clk;

endmodule
