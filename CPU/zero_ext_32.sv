module zero_ext_32(in, out);
	
	input logic[23:0] in;
	output logic[31:0] out;
	
	assign out = {8'b0, in};
endmodule