module mux4_1
	#( parameter N = 4 )
	 ( input logic [N-1:0] a, b, c, d,
		input logic [1:0]   sel,
	  output logic [N-1:0] y );
	
	logic [N-1:0] muxAres;
	logic [N-1:0] muxBres;
	
	mux2_1 #(N) muxA(a,b,sel[0],muxAres);
	mux2_1 #(N) muxB(c,d,sel[0],muxBres);
	mux2_1 #(N) muxY(muxAres,muxBres,sel[1],y);
endmodule
