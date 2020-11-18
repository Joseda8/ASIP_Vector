module address_calculator(i, j, n, addr1, addr2, addr3, addr4);

	input logic [31:0] i, j, n;
	output logic [31:0] addr1, addr2, addr3, addr4;
	
	assign addr1 = i*n + j;
	assign addr2 = i*n + (j+1);
	assign addr3 = (i+1)*n + j;
	assign addr4 = (i+1)*n + (j+1);
	

endmodule
