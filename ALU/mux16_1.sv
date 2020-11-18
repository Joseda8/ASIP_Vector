module mux16_1
	#( parameter N = 4 )
	 ( input logic [N-1:0] e0, e1, e2, e3, e4, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, e15, 
		input logic [3:0]   sel,
	  output logic [N-1:0] y );
	
	logic [N-1:0] muxAres;
	logic [N-1:0] muxBres;
	logic [N-1:0] muxCres;
	logic [N-1:0] muxDres;
	
	mux4_1 #(N) muxA(e0, e1, e2, e3, sel[1:0], muxAres);
	mux4_1 #(N) muxB(e4, e5, e6, e7, sel[1:0], muxBres);
	mux4_1 #(N) muxC(e8, e9, e10, e11, sel[1:0], muxCres);
	mux4_1 #(N) muxD(e12, e13, e14, e15, sel[1:0], muxDres);
	mux4_1 #(N) muxY(muxAres,muxBres,muxCres,muxDres, sel[3:2],y);
endmodule 