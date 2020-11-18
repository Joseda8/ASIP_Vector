module CPU_top_TB();

	logic clk, rst;
	
	logic [31:0] pc;
	logic [29:0] instr, instr_out;
	logic vec_alu_op;
	logic [31:0] mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4;
	
	
	CPU_top uut(clk, rst, pc, instr, instr_out, vec_alu_op, mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, 
						sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4); 
	
	initial begin
	
		clk <= 1; rst <= 1;
		
		#10 rst <= 0;
		
	end
	
	always #5 clk = ~clk;

endmodule
