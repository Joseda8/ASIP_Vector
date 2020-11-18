module eq_tb();
	
	logic [31:0] a, b;
	logic out;
	
	eq uut(a, b, out);
	
	initial begin
	
		#10 a <= 32'd50; b <= 32'd50;
		#10 a <= 32'd25; b <= 32'd10;
		#10;
		#10 a <= 32'd50; b <= 32'd50;
		#10;
		
	end

endmodule
