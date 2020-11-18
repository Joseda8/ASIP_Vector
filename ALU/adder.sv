//module adder
//	#( parameter N = 4)
//	 ( input logic  [N-1:0] a,b,
//		output logic [N-1:0] s,
//		output logic         cout);
//	  
//	assign {cout, s} = a + b;
//	
//endmodule

module adder
	#( parameter N = 4)
	 ( input logic  [N-1:0] a,b,
		output logic [N-1:0] s);
	  
	assign s = a + b;
	
endmodule 