module CPU_vector_TB();

	logic clk, rst;
	logic [29:0] instr, instr_out;
	logic [31:0] pc;
	
	logic vec_alu_op;
	logic r_mem_1, r_mem_2, w_mem_2, w_mem_3;
	
	logic [31:0] mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4, addr1, addr2, addr3, addr4;
	
	
	CPU_vector uut(clk, rst, pc, instr, instr_out, vec_alu_op,
						r_mem_1, r_mem_2, w_mem_2, w_mem_3,
							
							mulr1, mulr2, mulr3, mulr4, mulr5, mulr6, mulr7, mulr8, sumr1, sumr2, sumr3, sumr4,
							addr1, addr2, addr3, addr4);
	
	
	initial begin
		rst <= 1;
		#10 clk <= 1;
		#5 clk <= 0;
		#5 rst <= 0;
		
		#10 instr = 30'b001000000000000000000000001000; // SETN
		//#10 instr = 30'b000000000000000000000000000000; // INCRI 
		//#10 instr = 30'b000100000000000000000000000000; // INCRJ
		#10 instr = 30'b010000000000000000000000000000; // MULFV
		#300 instr = 30'b010100000000000000000000000000; // NOP
		#10 instr = 30'b000000000000000000000000000000; // INCRI 
		#10 instr = 30'b010000000000000000000000000000; // MULFV
		#300
		#10 instr = 30'b001100000000000000000000000000; // SUMFV
		#150;
		/*#10 instr = 30'b010000000000000000000000000000; // MULFV
		#100;
		#10 instr = 30'b010100000000000000000000000000; // NOP*/
	end
	
	always #5 clk = ~clk;

endmodule
