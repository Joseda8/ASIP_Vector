module CPU_vector_ID_TB();

	logic clk, rst;
	logic [29:0] instr;
	logic [31:0] pc;
	
	CPU_vector_IF uut(clk, rst, pc, instr);
	
	initial begin
		rst <= 1;
		#10 clk <= 1;
		#5 clk <= 0;
		#5 rst <= 0;
		
		#10 instr <= 30'b001000100000000000000000001111; // SUMI SR2, 0xF
		#100;
		#10 instr <= 30'b001000100000000000000000001010; // SUMI SR2, 0XA
		//#10 instr <= 30'b000000000101000000000000000000; // SUM SR0, SR1, SR2
		//#10 instr <= 30'b000100010010000000000000000000; read_data <= 0; // SUMFV VR0, [VR1], 0x1
		//#10 instr <= 30'b001001000000000000000100000000; // SUMI SR2, 0x100
		//#10 instr <= 30'b001101100100000000000000000000; read_data <= 0; // MULFV VR1, [VR2], 0x2
		//#10 instr <= 30'b010001000000000000000000000011;  // SUBI SR2, 0x3
		//#10 instr <= 30'b010110111000000000000000000000; read_data <= 0; // LDV VR2, [VR3], 0x4
		//#10 instr <= 30'b011100000000000000000000000000; // NOP
		//#10 instr <= 30'b101000100000000000000000010000;  // SETI SR1, 0x10
		//#10 instr <= 30'b101101101010000000000000000000; read_data <= 0; // SETFV VR1, [VR2], 0x5
		//#10 instr <= 30'b011000101001100000000000000000; // CMPEQ SR1, SR2, SR3
		//#10 instr <= 30'b100000000000000000000000000011; read_data <= 0; // JEQ ciclo_infinito
		//#10 instr <= 30'b100100000000000000000000000011; read_data <= 0; // J ciclo_infinito
		//#10 instr <= 30'b011100000000000000000000000000;  // NOP
	end
	
	always #5 clk = ~clk;

endmodule
