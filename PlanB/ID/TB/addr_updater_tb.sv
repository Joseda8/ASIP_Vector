module addr_updater_tb();
	
	logic vec_alu_op;
	logic [31:0] in, out;
	
	addr_updater uut(in, vec_alu_op, out);
	
	initial begin
		
		#10 in = 32'b0; vec_alu_op = 0;
		#10 in = 32'd8; vec_alu_op = 1;
		#10;
	
	end
	

endmodule
