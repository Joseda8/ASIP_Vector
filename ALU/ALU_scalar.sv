module ALU_scalar(
		input logic [31:0] A, B,
		input logic Func,
		output logic [31:0] out 
		);

/*
0 = Suma
1 = resta
*/
logic [32:0] tempRes;

always_comb

begin
	case (Func)
		1'b0: tempRes = A + B;
		1'b1: tempRes = A - B;
		default: tempRes = 32'bz;
	endcase
	
	out = tempRes[31:0];
	
end


endmodule
