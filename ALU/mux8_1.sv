module mux8_1
	#( parameter N = 4 )
	 ( input logic [N-1:0] a, b, c, d, e, f, g, h,
		input logic [2:0]   sel,
	  output logic [N-1:0] y );
	
	logic [N-1:0] muxAres;
	logic [N-1:0] muxBres;
	
	mux4_1 #(N) muxA(a, b, c, d, sel[1:0], muxAres);
	mux4_1 #(N) muxB(e, f, g, h, sel[1:0], muxBres);
	mux2_1 #(N) muxY(muxAres,muxBres,sel[2],y);
endmodule