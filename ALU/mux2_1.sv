module mux2_1 
	#( parameter N = 4 )
	 ( input logic [N-1:0] a,b,
		input logic         sel,
	  output logic [N-1:0] yOut );
	  
	assign yOut = sel ? b : a;

endmodule	