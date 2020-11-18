module sum_mem_tb();
	
	logic clk, we;
	logic [31:0] addr1, addr2, addr3, addr4, wd1, wd2, wd3, wd4, out1, out2, out3, out4;

	sum_mem uut(clk, we, addr1, addr2, addr3, addr4, wd1, wd2, wd3, wd4, out1, out2, out3, out4);

	initial begin
	
		clk = 1;
		
		#10; addr1 = 32'd0; addr2 = 32'd1; addr3 = 32'd2; addr4 = 32'd3; wd1 = 32'd50; wd2 = 32'd100; wd3 = 32'd11; wd4 = 32'd23; we = 1;
		#10; we = 0;
		#20;
		#10; addr1 = 32'd0; addr2 = 32'd1; addr3 = 32'd2; addr4 = 32'd3; 
	
	end
	
	always #5 clk = ~clk;

endmodule