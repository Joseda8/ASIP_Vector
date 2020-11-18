module control_unit_ID #(parameter ARQ = 32)(opcode, vec_alu_op,
															r_mem_1,
															r_mem_2, w_mem_2,
															w_mem_3);
					
	input logic [3:0] opcode;
	output logic vec_alu_op;
	output logic r_mem_1, r_mem_2, w_mem_2, w_mem_3;
	
	logic last_vec_alu_op = 0;

	always @(*) begin
		case(opcode) 
			4'b0000, 4'b0001, 4'b0010: //INCRI - INCRJ - SETN
				begin
					vec_alu_op = 1'bx;
					r_mem_1 = 1'b0;
					r_mem_2 = 1'b0;
					w_mem_2 = 1'b0;
					w_mem_3 = 1'b0;
				end
			4'b0011: //SUMFV
				begin
					vec_alu_op = 1'b0;
					r_mem_1 = 1'b0;
					r_mem_2 = 1'b1;
					w_mem_2 = 1'b0;
					w_mem_3 = 1'b1;
				end
			4'b0100: //MULFV
				begin
					vec_alu_op = 1'b1;
					r_mem_1 = 1'b1;
					r_mem_2 = 1'b0;
					w_mem_2 = 1'b1;
					w_mem_3 = 1'b0;
				end
			4'b0101: //NOP
				begin
					vec_alu_op = vec_alu_op;
					r_mem_1 = r_mem_1;
					r_mem_2 = r_mem_2;
					w_mem_2 = w_mem_2;
					w_mem_3 = w_mem_3;
				end

			default:
				begin
					vec_alu_op = 1'bx;
					r_mem_1 = 1'b0;
					r_mem_2 = 1'b0;
					w_mem_2 = 1'b0;
					w_mem_3 = 1'b0;
				end
			
		endcase
	end


endmodule
