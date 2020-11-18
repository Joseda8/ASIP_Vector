module control_limit(clk, rst, sca_reg_op, imm, i_out, j_out, n_out);

	input logic clk, rst;
	input logic [1:0] sca_reg_op;
	input logic [31:0] imm;
	
	output logic [31:0] i_out, j_out, n_out;

	logic [31:0] i = 32'b0;
	logic [31:0] j = 32'b0;
	logic [31:0] n = 32'b0;
	
	always_ff @(posedge clk && ~rst) begin
		case (sca_reg_op)
			2'b00: //INCRI 
				begin
					i = i + 1;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
				end
			2'b01: //INCRJ
				begin
					if(n == j)
						j = 0;
					else
						j = j + 1;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
				end
			2'b10: //SETN
				begin
					n = imm;
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
				end
			2'b11: //MULF- SUMF
				begin
					i_out = i;
					j_out = j;
					n_out = n;
				end
			default:
				begin
					i_out = 32'bx;
					j_out = 32'bx;
					n_out = 32'bx;
				end
		endcase
	end

endmodule
