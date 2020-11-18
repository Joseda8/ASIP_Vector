module eq(data1, data2, equal);
	
	input logic [31:0] data1, data2;
	output logic equal;
	
	logic [31:0] subs;
	
	always_comb begin
		subs = data1 - data2;
		
		if(subs == 32'b0)
			equal = 1;
		else
			equal = 0;
	end
	
endmodule
