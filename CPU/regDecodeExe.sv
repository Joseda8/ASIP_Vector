module regDecodeExe(clk, rst, i_in, j_in, n_in,
							i_out, j_out, n_out);

	input logic clk, rst;
	input logic [31:0] i_in, j_in, n_in;
	
	output logic [31:0] i_out, j_out, n_out;
	
	// data
	flopr i(clk, rst, i_in, i_out);
	flopr j(clk, rst, j_in, j_out);
	flopr n(clk, rst, n_in, n_out);
						
endmodule 