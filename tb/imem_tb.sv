module imem_tb();

logic [31:0] a;
logic [29:0] rd;

imem uut(a, rd);

initial begin	
	#10 a = 32'b0000;
	#10 a = 32'b0100;	
	#10 a = 32'b1000; 
	#10 a = 32'b1100;
	#10 a = 32'b10000;
	#10;

end

endmodule
