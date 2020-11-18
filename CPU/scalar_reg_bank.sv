module scalar_reg_bank(clk, rst, write_enable, rs1, rs2, rd, write_data, ro1, ro2);

	input logic clk, rst, write_enable;
	input logic [2:0] rs1, rs2, rd;
	input logic [31:0] write_data;
	
	output logic [31:0] ro1, ro2;
	// 8 registros de 32 bits
	logic [31:0] rf[7:0];

	always_ff @(clk) begin
		if (write_enable) begin
			// Write in register
         rf[rd] <= write_data;
		end
		// Reset registers
		if (rst) begin
			rf <= '{8{32'b0}};
		end
	end

	assign ro1 = rf[rs1];
	assign ro2 = rf[rs2];
	
endmodule
