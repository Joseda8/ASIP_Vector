module scalar_reg_bank_tb();

	logic clk, rst, write_enable;
	logic [1:0] rs1, rs2, rd;
	logic [31:0] write_data, ro1, ro2;

	scalar_reg_bank uut(clk, rst, write_enable, rs1, rs2, rd, write_data, ro1, ro2);

	initial begin
	
	#5 rst <= 1;
	#5 rst <= 0;
	clk <= 1;
	
	#5 write_enable <= 1; rd <= 2'b00; write_data <= 32'd54;
	#5;
	#5 rd <= 2'b01; write_data <= 32'd587;
	#5 write_enable <= 0;
	#5 rs1 <= 2'b00; rs2 <= 2'b01;
	#10;
	#5 rs1 <= 2'b00; rs2 <= 2'b01;
	#10;
	#5 rs1 <= 2'bx; rs2 <= 2'bx;
	
	
	end
	
	always #5 clk = ~clk;
	
endmodule
