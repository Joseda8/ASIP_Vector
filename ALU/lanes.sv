module lanes(dataA0, dataB0, dataA1, dataB1, dataA2, dataB2, dataA3, dataB3,
				func, clk, result0, result1, result2, result3);
				
	input logic [31:0] dataA0, dataB0, dataA1, dataB1, dataA2, dataB2, dataA3, dataB3;
	input logic func;
	input logic clk;
	
	output logic [31:0] result0, result1, result2, result3;
	
	logic ready_add0, ready_mul0, busy_add0, busy_mul0;
	logic ready_add1, ready_mul1, busy_add1, busy_mul1;
	logic ready_add2, ready_mul2, busy_add2, busy_mul2;
	logic ready_add3, ready_mul3, busy_add3, busy_mul3;
	
	ALU alu0(dataA0, dataB0, func, clk, result0, ready_add0, ready_mul0, busy_add0, busy_mul0);
	ALU alu1(dataA1, dataB1, func, clk, result1, ready_add1, ready_mul1, busy_add1, busy_mul1);
	ALU alu2(dataA2, dataB2, func, clk, result2, ready_add2, ready_mul2, busy_add2, busy_mul2);
	ALU alu3(dataA3, dataB3, func, clk, result3, ready_add3, ready_mul3, busy_add3, busy_mul3);
	
endmodule
