module addr_updater(in, vec_alu_op, out);
	
	input logic vec_alu_op;
	input logic [31:0] in;
	output logic [31:0] out;
	
	/*
	0 -> suma FP
	1 -> mult FP
	*/
	always_comb begin
		if(in == 32'bx) 
			out <= 32'b0;
			
		begin
			case (vec_alu_op)
				1'b0: out = in + 32'd8;
				1'b1: out = in + 32'd4;
				default: out = 32'bz;
			endcase
		end
	end

endmodule
