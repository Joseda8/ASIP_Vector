module address_calc_tb();

	logic [31:0] i, j, n, addr;
	
	address_calculator uut(i, j, n, addr);
	
	initial begin
	
		#10 i = 32'd10; j = 32'd50; n = 32'd8;
		#10 i = 32'd5; j = 32'd10; n = 32'd20;
		#10;
	
	end


endmodule
