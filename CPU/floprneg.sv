module floprneg #( parameter WIDTH = 8 )
				     ( input  logic clk, reset,
				       input  logic [WIDTH-1:0] d,
				       output logic [WIDTH-1:0] q );
always_ff @(negedge clk, posedge reset)
	if (reset) q <= 0;
	else q <= d;
endmodule 