module mult_mem_tb();
	
	logic clk, we;
	logic [31:0] wr_addr, rd_addr, wd1, wd2, wd3, wd4, out1, out2, out3, out4, out5, out6, out7, out8;
	
	mult_mem uut(clk, we, wr_addr, rd_addr, wd1, wd2, wd3, wd4, 
					 out1, out2, out3, out4, out5, out6, out7, out8);

	initial begin
	
		clk = 1;
		
		#10; wr_addr = 32'b0; rd_addr = 32'b0; wd1 = 32'd50; wd2 = 32'd100; wd3 = 32'd11; wd4 = 32'd23; we = 1;
		#10; we = 0;
		#10; rd_addr = 32'b0;
		#10 wr_addr = 32'd4; wd1 = 32'd50; wd2 = 32'd100; wd3 = 32'd11; wd4 = 32'd23; we = 1;
		#10; rd_addr = 32'b0;
	
	end
	
	always #5 clk = ~clk;

endmodule
