module alu_scalar_tb();
	
	logic [31:0] a, b, out;
	logic func;
	
	ALU_scalar uut(a, b, func, out);
	
	initial begin
	
		#10 a <= 32'd45; b <= 32'd77; func <= 0;
		#10 a <= 32'd45; b <= 32'd77; func <= 1;
		#10;
		
	end


endmodule