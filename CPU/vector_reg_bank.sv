module vector_reg_bank(clk, rst, write_enable, write_imm, vindex, imm, vs1, vs2, vd,
							  vw1, vw2, vw3, vw4,
							  v11, v12, v13, v14, v21, v22, v23, v24);

	input logic clk, rst, write_enable, write_imm;
	input logic [31:0] imm, vw1, vw2, vw3, vw4;
	input logic [1:0] vs1, vs2, vd, vindex;
	
	output logic [31:0] v11, v12, v13, v14, v21, v22, v23, v24;
	
	logic [31:0]vbank[0:3][0:3]; // 4 reg vectores con 4 elementos, cada uno de 32 bits
	
	always_ff @(posedge clk) begin
		if (write_enable) begin
			vbank[vd][0] <= vw1;
			vbank[vd][1] <= vw2;
			vbank[vd][2] <= vw3;
			vbank[vd][3] <= vw4; 
		end 
		else if(write_imm) begin
			vbank[vd][vindex] <= imm;
		end
		// Reset registers
		if (rst) begin
			vbank <= '{'{4{32'b0}}, '{4{32'b0}}, '{4{32'b0}}, '{4{32'b0}}};
		end
	end
		
	assign v11 = vbank[vs1][0];
	assign v12 = vbank[vs1][1];
	assign v13 = vbank[vs1][2];
	assign v14 = vbank[vs1][3];
	
	assign v21 = vbank[vs2][0];
	assign v22 = vbank[vs2][1];
	assign v23 = vbank[vs2][2];
	assign v24 = vbank[vs2][3];

endmodule
