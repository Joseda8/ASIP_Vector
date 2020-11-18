module ALU(
		input logic [31:0] A, B,
		input logic Func,
		input logic clk,
		output logic [31:0] out, 
		output logic ready_add, ready_mul, busy_add, busy_mul
		);

/*
0 -> suma FP
1 -> mult FP
*/
logic [32:0] tempRes;

logic [32:0] add_fp_out;
logic [32:0] mult_fp_out;

adder_fp adder_fp32(clk, 1, 0, A, B, ready_add, busy_add, add_fp_out);

multiplier_fp mult_fp32(clk, 1, A, B, ready_mul, busy_mul, mult_fp_out);

always_comb

begin
	case (Func)
		1'b0: tempRes = add_fp_out;
		1'b1: tempRes = mult_fp_out;
		default: tempRes = 32'bz;
	endcase
	
	out = tempRes[31:0];
	
end

endmodule
