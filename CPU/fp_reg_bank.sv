module fp_reg_bank(clk, write_enable, ra1, ra2, rd, write_data, rd1, rd2);

	input logic clk, write_enable;
	input logic [3:0] ra1, ra2, rd;
	input logic [31:0] write_data;
	
	output logic [31:0] rd1, rd2;
	
	logic [31:0] reg_bank[15:0];
	
	always_ff @(posedge clk)
		if (write_enable) reg_bank[rd] <= write_data;
	
	
	assign rd1 = reg_bank[ra1];
	assign rd2 = reg_bank[ra2];


endmodule
